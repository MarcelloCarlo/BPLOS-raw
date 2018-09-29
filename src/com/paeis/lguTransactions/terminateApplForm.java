package com.paeis.lguTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/terminateApplForm")
public class terminateApplForm extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String REFERENCE_NO = String.valueOf(request.getParameter("tRefNoh"));
        String REMARKS = String.valueOf(request.getParameter("AP_Remarks"));
        LGUConnect conX = new LGUConnect();

        try {
            Connection connection = conX.getConnection();
            PreparedStatement terminateApplicationForm = (PreparedStatement) connection.prepareStatement("UPDATE lgu_r_bp_application SET AP_STATUS = 'Terminated', AP_DATE_ACCESSED = CURRENT_TIMESTAMP(), AP_REMARKS = ? WHERE AP_REFERENCE_NO = ?");
            terminateApplicationForm.setString(1, REMARKS);
            terminateApplicationForm.setString(2, REFERENCE_NO);
            terminateApplicationForm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
