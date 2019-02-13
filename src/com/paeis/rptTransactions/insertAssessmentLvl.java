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


@WebServlet("/insertAssessmentLvl")
@MultipartConfig
public class insertAssessmentLvl extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public insertAssessmentLvl() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect conn = new LGUConnect();
        String ptid = request.getParameter("addamentptype");
        String pcid = request.getParameter("addamentpclass");
        String alvl = request.getParameter("addamentlvl");

        try {
            Connection connection = conn.getConnection();
            PreparedStatement insert = (PreparedStatement) connection.prepareStatement("INSERT INTO `rpt_r_assessment_lvl` (`PT_ID`, `PC_ID`, `AL_VAL`) VALUES (?,?,?)");
            insert.setString(1, ptid);
            insert.setString(2, pcid);
            insert.setString(3, alvl);
            insert.executeUpdate();
            request.getRequestDispatcher("/RPTSetupAmentLvls.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

}
