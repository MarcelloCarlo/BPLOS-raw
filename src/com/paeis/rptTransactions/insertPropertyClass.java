package com.paeis.rptTransactions;


import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class LoginServlet
 */


@WebServlet("/insertPropertyClass")
@MultipartConfig
public class insertPropertyClass extends HttpServlet{

    private static final long serialVersionUID = 1L;

    public insertPropertyClass() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect conn = new LGUConnect();
        String pccode = request.getParameter("addpclasscode");
        String pcdesc = request.getParameter("addpclassdesc");

        try {
            Connection connection = conn.getConnection();
            PreparedStatement insert = (PreparedStatement) connection.prepareStatement("INSERT INTO `rpt_r_property_class` (`PC_CODE`, `PC_DESC`) VALUES (?,?)");
            insert.setString(1, pccode);
            insert.setString(2, pcdesc);
            insert.executeUpdate();
            request.getRequestDispatcher("/RPTSetupPprtyClass.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

}
