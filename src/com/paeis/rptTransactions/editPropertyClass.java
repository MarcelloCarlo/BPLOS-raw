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

@WebServlet("/editPropertyClass")
@MultipartConfig
public class editPropertyClass extends HttpServlet{

    private static final long serialVersionUID = 1L;

    public editPropertyClass()  {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect conn = new LGUConnect();
        String pcID = request.getParameter("pc_id");
        String pcecode = request.getParameter("editpclasscode");
        String pcedesc = request.getParameter("editpclassdesc");

        try {
            Connection connection = conn.getConnection();
            PreparedStatement edit = (PreparedStatement) connection.prepareStatement("UPDATE rpt_r_property_class SET PC_CODE=?,PC_DESC= ? WHERE PC_ID = ?");
            edit.setString(1, pcecode);
            edit.setString(2, pcedesc);
            edit.setInt(3, Integer.parseInt(pcID));
            edit.executeUpdate();
            request.getRequestDispatcher("/RPTSetupPprtyClass.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
