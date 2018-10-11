package com.paeis.bplsTransactions;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import java.sql.Connection;
import java.sql.ResultSet;

@WebServlet("/reEvaluateApplForm")
@MultipartConfig
public class reEvaluateApplForm extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        String refNo = request.getParameter("reRefNoh");
        String remarks = request.getParameter("AP_Remarks");
        LGUConnect conX = new LGUConnect();
        String divCode = "", divName = "";
        try{

            Connection connection = conX.getConnection();
            PreparedStatement revAP = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_DATE_ACCESSED = CURRENT_TIMESTAMP(), AP_DIV_CODE_TO = 'DIV-REV',AP_DIV_CODE_FROM = 'DIV-EV', AP_REMARKS = ? WHERE AP_REFERENCE_NO = ?");
            revAP.setString(1,remarks);
            revAP.setString(2,refNo);
            revAP.executeUpdate();

            //Record

            PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getAPinfo.setString(1,refNo);
            ResultSet rsAP = getAPinfo.executeQuery();
            while (rsAP.next()){
                divCode = rsAP.getString("AP_DIV_CODE_TO");
            }

            PreparedStatement getDivName = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_r_division WHERE DIV_CODE = ?");
            getDivName.setString(1, divCode);
            ResultSet rsDivName = getDivName.executeQuery();
            while (rsDivName.next()) {
                divName = rsDivName.getString("DIV_NAME");
            }

            PreparedStatement recHist = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_ap_history(TL_AP_NO, TL_DIV_CODE, TL_DIV_NAME,TL_REMARKS) VALUES (?,?,?,?)");
            recHist.setString(1, refNo);
            recHist.setString(2, divCode);
            recHist.setString(3, divName);
            recHist.setString(4,remarks);
            recHist.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

}
