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

@MultipartConfig
@WebServlet("/updateNewAppEvaluationForm")
public class updateNewAppEvaluationForm extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateNewAppEvaluationForm() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int _AT_ID = Integer.parseInt(request.getParameter("_AT_ID"));
        int _AP_ID = Integer.parseInt(request.getParameter("_AP_ID"));
        String AT_BRGY_CLEARANCE = String.valueOf(request.getParameter("AT_BRGY_CLEARANCE"));
        String AT_DTI_REGISTRATION = String.valueOf(request.getParameter("AT_DTI_REGISTRATION"));
        String AT_SEC_REGISTRATION = String.valueOf(request.getParameter("AT_SEC_REGISTRATION"));
        String AT_TITLE_TO_PROPERTY = String.valueOf(request.getParameter("AT_TITLE_TO_PROPERTY"));
        String AT_CONTRACT_OF_LEASE = String.valueOf(request.getParameter("AT_CONTRACT_OF_LEASE"));
        String AT_AUTHORIZATION = String.valueOf(request.getParameter("AT_AUTHORIZATION"));
        String AT_MISC_DOCUMENTS = String.valueOf(request.getParameter("AT_MISC_DOCUMENTS"));
        String AP_Remarks = String.valueOf(request.getParameter("AP_Remarks"));
        String AP_REFERENCE_NO = String.valueOf(request.getParameter("_AP_REFERENCE_NO"));
        String BN_CLASSIFICATION = String.valueOf(request.getParameter("_BN_CLASSIFICATION"));

        LGUConnect conX = new LGUConnect();
        String currBN = "";
        String divCode = "", divName = "";
        if (BN_CLASSIFICATION.equals("S")) {
            currBN = "UPDATE bpls_t_bp_application SET AP_STATUS = 'Assess', AP_DATE_ACCESSED = CURRENT_TIMESTAMP() WHERE AP_REFERENCE_NO = ?";
        } else if (BN_CLASSIFICATION.equals("L")) {
            currBN = "UPDATE bpls_t_bp_application SET AP_DIV_CODE_TO = 'DIV-INS', AP_DIV_CODE_FROM = 'DIV-EV', AP_DATE_ACCESSED = CURRENT_TIMESTAMP() WHERE AP_REFERENCE_NO = ?";
        }

        try {
            Connection connection = conX.getConnection();
            PreparedStatement updateRequirements = (PreparedStatement) connection.prepareStatement(
                    "UPDATE bpls_t_attachments SET AT_BRGY_CLEARANCE = ?, AT_DTI_REGISTRATION = ?, AT_SEC_REGISTRATION = ?,AT_TITLE_TO_PROPERTY = ?, AT_CONTRACT_OF_LEASE = ?, AT_AUTHORIZATION = ?, AT_MISC_DOCUMENTS = ?, AP_Remarks = ? WHERE AT_ID = ? AND AP_ID = ?; ");
            updateRequirements.setString(1, getCheckboxtatus(AT_BRGY_CLEARANCE));
            updateRequirements.setString(2, getCheckboxtatus(AT_DTI_REGISTRATION));
            updateRequirements.setString(3, getCheckboxtatus(AT_SEC_REGISTRATION));
            updateRequirements.setString(4, getCheckboxtatus(AT_TITLE_TO_PROPERTY));
            updateRequirements.setString(5, getCheckboxtatus(AT_CONTRACT_OF_LEASE));
            updateRequirements.setString(6, getCheckboxtatus(AT_AUTHORIZATION));
            updateRequirements.setString(7, getCheckboxtatus(AT_MISC_DOCUMENTS));
            updateRequirements.setString(8, AP_Remarks);
            updateRequirements.setInt(9, _AT_ID);
            updateRequirements.setInt(10, _AP_ID);
            updateRequirements.executeUpdate();

            PreparedStatement changeDiv = (PreparedStatement) connection.prepareStatement(currBN);
            changeDiv.setString(1, AP_REFERENCE_NO);
            changeDiv.executeUpdate();

            //Record

            PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getAPinfo.setString(1, AP_REFERENCE_NO);
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

            PreparedStatement recHist = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_ap_history(TL_AP_NO, TL_DIV_CODE, TL_DIV_NAME) VALUES (?,?,?)");
            recHist.setString(1, AP_REFERENCE_NO);
            recHist.setString(2, divCode);
            recHist.setString(3, divName);
            recHist.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        }

        response.getWriter().print(AP_Remarks);
    }

    private String getCheckboxtatus(String chkbox) {

        if (chkbox.equals("Pass")) {
            return "Pass";
        } else if (chkbox.isEmpty() || chkbox.equals("Fail") || chkbox.equalsIgnoreCase("null")) {
            return "Fail";
        }

        return null;
    }
}