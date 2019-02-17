package com.paeis;

import com.mysql.fabric.Response;
import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/accountChangePass")
@MultipartConfig
public class accountChangePass extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;


    {
        try {
            connection = connect.getConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public accountChangePass() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        String currPass = request.getParameter("currPass");
        String newPass = request.getParameter("newPass");
        try {
            PreparedStatement updatePassword = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_user SET U_PASSWORD = ? WHERE  U_PASSWORD = ? AND EP_ID = ?");

            updatePassword.setString(1,newPass);
            updatePassword.setString(2,currPass);
            updatePassword.setInt(3,Integer.parseInt(id));
            int chkSucc = updatePassword.executeUpdate();
            if (chkSucc != 1){
                response.getWriter().print("fail");
            } else {
                response.getWriter().print("PAEISPortal.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
