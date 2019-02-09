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


@WebServlet("/editAssessmentLvl")
@MultipartConfig
public class editAssessmentLvl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public editAssessmentLvl() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect conn = new LGUConnect();
        String alid = request.getParameter("al_id");
        String eptid = request.getParameter("editamentptype");
        String epcid = request.getParameter("editamentpclass");
        String ealvl = request.getParameter("editamentlvl");

        try {
            Connection connection = conn.getConnection();
            PreparedStatement edit = (PreparedStatement) connection.prepareStatement("UPDATE rpt_r_assessment_lvl SET PT_ID=?,PC_ID= ?,AL_VAL= ? WHERE AL_ID = ?");
            edit.setString(1, eptid);
            edit.setString(2, epcid);
            edit.setString(3, ealvl);
            edit.setInt(4, Integer.parseInt(alid));
            edit.executeUpdate();
            request.getRequestDispatcher("/RPTSetupAmentLvls.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
