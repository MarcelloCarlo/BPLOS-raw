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

@WebServlet("/editPropertyType")
@MultipartConfig
public class editPropertyType extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public editPropertyType()  {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect conn = new LGUConnect();
        String ptID = request.getParameter("pt_id");
        String ptecode = request.getParameter("editptypecode");
        String ptedesc = request.getParameter("editptypedesc");

        try {
            Connection connection = conn.getConnection();
            PreparedStatement edit = (PreparedStatement) connection.prepareStatement("UPDATE rpt_r_property_type SET PT_CODE=?,PT_DESC= ? WHERE PT_ID = ?");
            edit.setString(1, ptecode);
            edit.setString(2, ptedesc);
            edit.setInt(3, Integer.parseInt(ptID));
            edit.executeUpdate();
            request.getRequestDispatcher("/RPTSetupPprtyType.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
