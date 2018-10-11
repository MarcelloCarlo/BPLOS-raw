package com.paeis.bplsTransactions;

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
import java.sql.ResultSet;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/terminateApplForm")
public class terminateApplForm extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String REFERENCE_NO = String.valueOf(request.getParameter("tRefNoh"));
        String REMARKS = String.valueOf(request.getParameter("AP_Remarks"));
        LGUConnect conX = new LGUConnect();
        String divCode = "", divName = "";
        try {
            Connection connection = conX.getConnection();
            PreparedStatement terminateApplicationForm = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_STATUS = 'Terminated', AP_DATE_ACCESSED = CURRENT_TIMESTAMP(), AP_REMARKS = ? WHERE AP_REFERENCE_NO = ?");
            terminateApplicationForm.setString(1, REMARKS);
            terminateApplicationForm.setString(2, REFERENCE_NO);
            terminateApplicationForm.executeUpdate();

            //Record

            PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getAPinfo.setString(1, REFERENCE_NO);
            ResultSet rsAP = getAPinfo.executeQuery();
            while (rsAP.next()) {
                divCode = rsAP.getString("AP_DIV_CODE_TO");
            }

            PreparedStatement getDivName = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_r_division WHERE DIV_CODE = ?");
            getDivName.setString(1, divCode);
            ResultSet rsDivName = getDivName.executeQuery();
            while (rsDivName.next()) {
                divName = rsDivName.getString("DIV_NAME");
            }

            PreparedStatement recHist = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_ap_history(TL_AP_NO, TL_DIV_CODE, TL_DIV_NAME,TL_REMARKS) VALUES (?,?,?,?)");
            recHist.setString(1, REFERENCE_NO);
            recHist.setString(2, divCode);
            recHist.setString(3, divName);
            recHist.setString(4, REMARKS);
            recHist.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
