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


@WebServlet("/insertPropertyType")
@MultipartConfig
public class insertPropertyType extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public insertPropertyType() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect conn = new LGUConnect();
        String ptcode = request.getParameter("addptypecode");
        String ptdesc = request.getParameter("addptypedesc");

        try {
            Connection connection = conn.getConnection();
            PreparedStatement insert = (PreparedStatement) connection.prepareStatement("INSERT INTO `rpt_r_property_type` (`PT_CODE`, `PT_DESC`) VALUES (?,?)");
            insert.setString(1, ptcode);
            insert.setString(2, ptdesc);
            insert.executeUpdate();
            request.getRequestDispatcher("/RPTSetupPprtyType.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }



}
