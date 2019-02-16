package com.paeis;


import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    LGUConnect connect = new LGUConnect();
    Connection connection;
    private String divcode = "",auditId="";

    {
        try {
            connection = connect.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        String empId = request.getParameter("id");
        HttpSession session = request.getSession(false);
        if(session != null)
            session.invalidate();
        recSession(empId);
        //request.getRequestDispatcher("/PAEISPortal.jsp").forward(request,response);
        response.sendRedirect("PAEISPortal.jsp");
    }

    private void recSession( String empId) {
        try {
            Connection connection = connect.getConnection();
            PreparedStatement findEmp = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_employee_profile EP JOIN bpls_t_user U ON EP.EP_ID = U.EP_ID WHERE  EP.EP_ID = ? AND U.U_STATUS = 'Active'");
            findEmp.setInt(1,Integer.parseInt(empId));
            ResultSet resultSet = findEmp.executeQuery();
            if (resultSet.next()) {
                divcode = resultSet.getString("U.U_ROLE");
            }
            PreparedStatement findLastLogin = (PreparedStatement) connection.prepareStatement("SELECT AUDT_ID FROM `bpls_t_audit_trail` WHERE AUDT_EP_ID = ? AND AUDT_LOG_OUT IS NULL ORDER BY `AUDT_LOG_IN` DESC");
            findLastLogin.setInt(1,Integer.parseInt(empId));
            ResultSet resultSet1 = findLastLogin.executeQuery();
            if (resultSet1.next()) {
               auditId = resultSet1.getString("AUDT_ID");
            }

            PreparedStatement recAudt = (PreparedStatement) connection.prepareStatement("UPDATE `bpls_t_audit_trail` SET AUDT_LOG_OUT=NOW() WHERE  AUDT_EP_ID = ? AND AUDT_ID = ? ");
            recAudt.setInt(1, Integer.parseInt(empId));
            recAudt.setString(2, auditId);
            recAudt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
