package com.paeis.bplsTransactions;

import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Objects;

import com.mysql.jdbc.PreparedStatement;

@MultipartConfig
@WebServlet("/updateNewAppInvestigationForm")
public class updateNewAppInvestigationForm extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;

    {
        try {
            connection = connect.getConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public updateNewAppInvestigationForm() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String AP_REFERENCE_NO = String.valueOf(request.getParameter("_AP_REFERENCE_NO"));
        String ZONING_INS = getCheckboxtatus(String.valueOf(request.getParameter("ZONING_INS")));
        String FIRE_INS = getCheckboxtatus(String.valueOf(request.getParameter("FIRE_INS")));
        String HS_INS = getCheckboxtatus(String.valueOf(request.getParameter("HS_INS")));
        String BLDG_INS = getCheckboxtatus(String.valueOf(request.getParameter("BLDG_INS")));
        String LABOR_INS = getCheckboxtatus(String.valueOf(request.getParameter("LABOR_INS")));
        String MISC_INS = getCheckboxtatus(String.valueOf(request.getParameter("MISC_INS")));
        String MISC_REMARKS = String.valueOf(request.getParameter("MISC_REMARKS"));
        String chkRectify = getCheckboxtatus(String.valueOf(request.getParameter("Rectify")));


        if (Objects.equals(ZONING_INS, "Pass") && Objects.equals(FIRE_INS, "Pass") && Objects.equals(HS_INS, "Pass") && Objects.equals(BLDG_INS, "Pass") && Objects.equals(LABOR_INS, "Pass") && Objects.equals(MISC_INS, "Pass") && !Objects.equals(chkRectify, "Pass")) {

            passedInvestigation(AP_REFERENCE_NO, MISC_REMARKS);
        } else if (Objects.equals(chkRectify, "Pass")) {
            int numRecMonths = Integer.parseInt(request.getParameter("numMonths"));
            rectifyInvestigation(AP_REFERENCE_NO, MISC_REMARKS, numRecMonths);
        } else {
            System.out.println("Incomplete Elements");
        }
    }

    private String getCheckboxtatus(String chkbox) {

        if (chkbox.equals("Pass")) {
            return "Pass";
        } else if (chkbox.isEmpty() || chkbox.equals("Fail") || chkbox.equalsIgnoreCase("null")) {
            return "Fail";
        }

        return null;
    }

    private void passedInvestigation(String AP_REFERENCE_NO, String MISC_REMARKS) {
        try {
            PreparedStatement passInv = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_inspections SET ZONING_INS = 'Pass', FIRE_INS = 'Pass' , HEALTH_SANITATION_INS = 'Pass', BUILDING_INS = 'Pass', LABOR_INS = 'Pass', MISC_INS = 'Pass', INS_REMARKS = 'Pass', INS_REMARKS = ? WHERE INS_AP_REFERENCE_NO = ? ");
            passInv.setString(1, MISC_REMARKS);
            passInv.setString(2, AP_REFERENCE_NO);
            passInv.executeUpdate();
            PreparedStatement assessInv = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_STATUS ='Assess', AP_DIV_CODE_TO = 'DIV-EV', AP_DIV_CODE_FROM = 'DIV-INV', AP_DATE_ACCESSED = CURRENT_TIMESTAMP(), AP_REMARKS = ? WHERE AP_REFERENCE_NO = ?");
            assessInv.setString(1, MISC_REMARKS);
            assessInv.setString(2, AP_REFERENCE_NO);
            assessInv.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void rectifyInvestigation(String AP_REFERENCE_NO, String MISC_REMARKS, int numMonths) {
        try {
            PreparedStatement insertRem = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_inspections SET INS_REMARKS = ? WHERE INS_AP_REFERENCE_NO = ?");
            insertRem.setString(1, MISC_REMARKS);
            insertRem.setString(2, AP_REFERENCE_NO);
            insertRem.executeUpdate();
            PreparedStatement rectAppl = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_DIV_CODE_FROM = 'DIV-INV', AP_DATE_ACCESSED = CURRENT_TIMESTAMP(), AP_DATE_RE_INS = CURRENT_TIMESTAMP + INTERVAL ? MONTH, AP_REMARKS = ? WHERE AP_REFERENCE_NO = ?");
            rectAppl.setInt(1, numMonths);
            rectAppl.setString(2, MISC_REMARKS);
            rectAppl.setString(3, AP_REFERENCE_NO);
            rectAppl.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
