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


@WebServlet("/insertActualUse")
@MultipartConfig
public class insertActualUse extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public insertActualUse() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect conn = new LGUConnect();
        String aucode = request.getParameter("addactusecode");
        String audesc = request.getParameter("addactusedesc");

        try {
            Connection connection = conn.getConnection();
            PreparedStatement insert = (PreparedStatement) connection.prepareStatement("INSERT INTO `rpt_r_actual_use` (`AU_CODE`, `AU_DESC`) VALUES (?,?)");
            insert.setString(1, aucode);
            insert.setString(2, audesc);
            insert.executeUpdate();
            request.getRequestDispatcher("/RPTSetupActUse.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
