package com.paeis.bplsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Objects;

@MultipartConfig
@WebServlet("/updateNewAppEvaluationForm")
public class updateNewAppEvaluationForm extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String currBN = "UPDATE bpls_t_bp_application SET AP_DIV_CODE_TO = 'DIV-INS', AP_DIV_CODE_FROM = 'DIV-EV', AP_DATE_ACCESSED = CURRENT_TIMESTAMP() WHERE AP_REFERENCE_NO = ?";
    private String divCode = "", divName = "", AP_REFERENCE_NO, AP_Remarks;
    private int _AT_ID, _AP_ID;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;

    {
        try {
            connection = connect.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public updateNewAppEvaluationForm() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

        _AT_ID = Integer.parseInt(request.getParameter("_AT_ID"));
        _AP_ID = Integer.parseInt(request.getParameter("_AP_ID"));
        boolean isRenew = String.valueOf(request.getParameter("isRenew")).equals("T");
        //New
        String AT_BRGY_CLEARANCE = String.valueOf(request.getParameter("AT_BRGY_CLEARANCE"));
        String AT_DTI_REGISTRATION = String.valueOf(request.getParameter("AT_DTI_REGISTRATION"));
        String AT_SEC_REGISTRATION = String.valueOf(request.getParameter("AT_SEC_REGISTRATION"));
        String AT_TITLE_TO_PROPERTY = String.valueOf(request.getParameter("AT_TITLE_TO_PROPERTY"));
        String AT_CONTRACT_OF_LEASE = String.valueOf(request.getParameter("AT_CONTRACT_OF_LEASE"));
        String AT_AUTHORIZATION = String.valueOf(request.getParameter("AT_AUTHORIZATION"));
        String AT_MISC_DOCUMENTS = String.valueOf(request.getParameter("AT_MISC_DOCUMENTS"));
        AP_Remarks = String.valueOf(request.getParameter("AP_Remarks"));
        AP_REFERENCE_NO = String.valueOf(request.getParameter("_AP_REFERENCE_NO"));
        String BN_CLASSIFICATION = String.valueOf(request.getParameter("_BN_CLASSIFICATION"));
        //Renew
        String AT_PREV_BP = String.valueOf(request.getParameter("AT_PREV_BP"));
        String AT_TAX_BILL = String.valueOf(request.getParameter("AT_TAX_BILL"));
        String AT_BRGY_CLR = String.valueOf(request.getParameter("AT_BRGY_CLR"));
        String AT_LOC_CLR = String.valueOf(request.getParameter("AT_LOC_CLR"));
        String AT_FSIC = String.valueOf(request.getParameter("AT_FSIC"));
        String AT_SH_CERT = String.valueOf(request.getParameter("AT_SH_CERT"));
        String AT_CTAO_CERT = String.valueOf(request.getParameter("AT_CTAO_CERT"));
        String AT_E_INSP = String.valueOf(request.getParameter("AT_E_INSP"));
        String AT_LESSORS_BP = String.valueOf(request.getParameter("AT_LESSORS_BP"));
        String AT_PCAB_LICENSE = String.valueOf(request.getParameter("AT_PCAB_LICENSE"));

        if (isRenew) {
            evalRenew(AT_PREV_BP, AT_TAX_BILL, AT_BRGY_CLR, AT_LOC_CLR, AT_FSIC, AT_SH_CERT, AT_CTAO_CERT, AT_E_INSP, AT_LESSORS_BP, AT_PCAB_LICENSE);
        } else {
            evalNew(AT_BRGY_CLEARANCE, AT_DTI_REGISTRATION, AT_SEC_REGISTRATION, AT_TITLE_TO_PROPERTY, AT_CONTRACT_OF_LEASE, AT_AUTHORIZATION, AT_MISC_DOCUMENTS);
        }

    }

//    private boolean isPass(String chkStr) {
//        return Objects.equals(chkStr, "Pass");
//    }

    private String getCheckboxtatus(String chkbox) {

        if (chkbox.equals("Pass")) {
            return "Pass";
        } else if (chkbox.isEmpty() || chkbox.equals("Fail") || chkbox.equalsIgnoreCase("null")) {
            return "Fail";
        }

        return null;
    }

    private void evalNew(String AT_BRGY_CLEARANCE, String AT_DTI_REGISTRATION, String AT_SEC_REGISTRATION, String AT_TITLE_TO_PROPERTY, String AT_CONTRACT_OF_LEASE, String AT_AUTHORIZATION, String AT_MISC_DOCUMENTS) {
        try {
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
            while (rsAP.next()) {
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

    }

    private void evalRenew(String AT_PREV_BP, String AT_TAX_BILL, String AT_BRGY_CLR, String AT_LOC_CLR, String AT_FSIC, String AT_SH_CERT, String AT_CTAO_CERT, String AT_E_INSP, String AT_LESSORS_BP, String AT_PCAB_LICENSE) {
        try {
            PreparedStatement updateRequirements = (PreparedStatement) connection.prepareStatement(
                    "UPDATE bpls_t_attachments SET AT_PREV_BP = ?, AT_TAX_BILL = ?, AT_BRGY_CLEARANCE = ?, AT_LOCATIONAL_CLR = ?, AT_FSIC = ?, AT_SANITARY_HEALTH_CERT = ?, AT_CTAO_CLEARANCE_CERT = ?, AT_ELECTRICAL_INSP = ?, AT_LESSORS_BP = ?, AT_PCAB_LICENSE = ? WHERE AT_ID = ? AND AP_ID = ?; ");
            updateRequirements.setString(1, getCheckboxtatus(AT_PREV_BP));
            updateRequirements.setString(2, getCheckboxtatus(AT_TAX_BILL));
            updateRequirements.setString(3, getCheckboxtatus(AT_BRGY_CLR));
            updateRequirements.setString(4, getCheckboxtatus(AT_LOC_CLR));
            updateRequirements.setString(5, getCheckboxtatus(AT_FSIC));
            updateRequirements.setString(6, getCheckboxtatus(AT_SH_CERT));
            updateRequirements.setString(7, getCheckboxtatus(AT_CTAO_CERT));
            updateRequirements.setString(8, getCheckboxtatus(AT_E_INSP));
            updateRequirements.setString(9, getCheckboxtatus(AT_LESSORS_BP));
            updateRequirements.setString(10, getCheckboxtatus(AT_PCAB_LICENSE));
            updateRequirements.setInt(11, _AT_ID);
            updateRequirements.setInt(12, _AP_ID);
            updateRequirements.executeUpdate();

            PreparedStatement changeDiv = (PreparedStatement) connection.prepareStatement(currBN);
            changeDiv.setString(1, AP_REFERENCE_NO);
            changeDiv.executeUpdate();

            //Record

            PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getAPinfo.setString(1, AP_REFERENCE_NO);
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

            PreparedStatement recHist = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_ap_history(TL_AP_NO, TL_DIV_CODE, TL_DIV_NAME) VALUES (?,?,?)");
            recHist.setString(1, AP_REFERENCE_NO);
            recHist.setString(2, divCode);
            recHist.setString(3, divName);
            recHist.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
