package com.paeis.rptTransactions;

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
import java.sql.Date;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/insertRPTTax")
@MultipartConfig
public class insertRPTTax extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private int RPTAX_ID = 0, RPO_ID = 0, RPTTB_ID = 0, feelistId = 0;
    private float taxedAmount = 0, feeListAmt = 0, amountDue = 0;
    private String flFeeCode = "", taxYear = "";


    public insertRPTTax() {
        super();
    }

    // TODO
    // The computational value of "city share" and "barangay share" are from the RPT Tax value per se: totTaxAmt
    // The rest are from the assessed value: assessedVal

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String EP_ID = request.getParameter("EP_ID"), RPL_ID = request.getParameter("RPL_ID"), RPTA_ID = request.getParameter("RPTA_ID"), taxRateId = request.getParameter("taxRateId"), totTaxAmt = request.getParameter("totAmtHide"), optInstallment = request.getParameter("optInstallment"), optPayMethod = request.getParameter("optPayMethod"), chkIdleStat = request.getParameter("chkIdleStat") != null ? request.getParameter("chkIdleStat"): "Failed", assessedVal = request.getParameter("assessedValHide");

        LGUConnect connect = new LGUConnect();

        try {
            Connection connection = connect.getConnection();

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDate localDate = LocalDate.now();
            taxYear = dtf.format(localDate);

            setRptTax(connection, RPTA_ID, taxRateId, totTaxAmt);
            getRPOId(connection, RPL_ID);
            getRPTAXId(connection, RPTA_ID, taxRateId);
            setTaxBill(connection, RPL_ID, RPTA_ID, optInstallment);
            getTaxBillId(connection, RPL_ID, RPTA_ID, optInstallment);
            flFeeCode = "CS";
            computeFeeList(connection, totTaxAmt, assessedVal, flFeeCode, "TA", true);
            flFeeCode = "BS";
            computeFeeList(connection, totTaxAmt, assessedVal, flFeeCode, "TA", true);
            flFeeCode = "SEF";
            computeFeeList(connection, totTaxAmt, assessedVal, flFeeCode, "AV", true);
            if (chkIdleStat.equalsIgnoreCase("Pass")) {
                flFeeCode = "ILT";
                computeFeeList(connection, totTaxAmt, assessedVal, flFeeCode, "AV", true);
            } else {
                flFeeCode = "ILT";
                computeFeeList(connection, totTaxAmt, assessedVal, flFeeCode, "AV", false);
            }
            flFeeCode = "SHT";
            computeFeeList(connection, totTaxAmt, assessedVal, flFeeCode, "AV", false);
            flFeeCode = "GF";
            computeFeeList(connection, totTaxAmt, assessedVal, flFeeCode, "AV", false);
            setAmountDue(connection);
            setOfficialRec(connection, RPL_ID, RPTA_ID, optPayMethod, EP_ID);
            setNewTaxBill(connection, RPL_ID);
            setRPLStatus(connection, RPL_ID);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //-------------------------- All Methods---------------------------//
    void setRptTax(Connection connection, String RPTA_ID, String taxRateId, String totTaxAmt) {
        try {
            PreparedStatement rptTax = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_rptax(RPTA_ID, RPTR_ID, RPT_AMOUNT) VALUES (?,?,?)");
            rptTax.setInt(1, Integer.parseInt(RPTA_ID));
            rptTax.setInt(2, Integer.parseInt(taxRateId));
            rptTax.setFloat(3, Float.parseFloat(totTaxAmt));
            rptTax.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    void getRPOId(Connection connection, String RPL_ID) {
        try {
            PreparedStatement getRPOId = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_rp_land WHERE RPL_ID = ?");
            getRPOId.setInt(1, Integer.parseInt(RPL_ID));
            ResultSet getRPOIdRs = getRPOId.executeQuery();
            while (getRPOIdRs.next()) {
                RPO_ID = getRPOIdRs.getInt("RPO_ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void getRPTAXId(Connection connection, String RPTA_ID, String taxRateId) {
        try {
            PreparedStatement getRPTAXId = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_rptax WHERE RPTA_ID = ? AND RPTR_ID = ?");
            getRPTAXId.setInt(1, Integer.parseInt(RPTA_ID));
            getRPTAXId.setInt(2, Integer.parseInt(taxRateId));
            ResultSet getRPTAXIdRs = getRPTAXId.executeQuery();
            while (getRPTAXIdRs.next()) {
                RPTAX_ID = getRPTAXIdRs.getInt("RPTAX_ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void setTaxBill(Connection connection, String RPL_ID, String RPTA_ID, String optInstallment) {
        try {
            PreparedStatement setTaxBill = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_taxbill( RPTTB_BILL_NO, RPTTB_DATE_BILLED, RPTAX_ID, RPL_ID, RPO_ID, RPTA_ID, INSTALLMENT,TAX_YEAR) VALUES (CONCAT('RPTB',REPLACE(CURRENT_DATE,'-','')),CURRENT_DATE,?,?,?,?,?,YEAR(CURRENT_DATE))");
            setTaxBill.setInt(1, RPTAX_ID);
            setTaxBill.setInt(2, Integer.parseInt(RPL_ID));
            setTaxBill.setInt(3, RPO_ID);
            setTaxBill.setInt(4, Integer.parseInt(RPTA_ID));
            setTaxBill.setString(5, optInstallment);
            setTaxBill.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void getTaxBillId(Connection connection, String RPL_ID, String RPTA_ID, String optInstallment) {
        try {
            PreparedStatement getTBId = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_taxbill WHERE RPTAX_ID = ? AND RPL_ID = ? AND RPO_ID = ? AND RPTA_ID = ? AND  YEAR(TAX_YEAR) = YEAR(?) AND INSTALLMENT = ?");
            getTBId.setInt(1, RPTAX_ID);
            getTBId.setInt(2, Integer.parseInt(RPL_ID));
            getTBId.setInt(3, RPO_ID);
            getTBId.setInt(4, Integer.parseInt(RPTA_ID));
            getTBId.setString(5, taxYear);
            getTBId.setString(6, optInstallment);
            ResultSet rTBIdRS = getTBId.executeQuery();
            while (rTBIdRS.next()) {
                RPTTB_ID = rTBIdRS.getInt("RPTTB_ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //-----one by one only----//
    void computeFeeList(Connection connection, String totTaxAmt, String assessedVal, String feeCode, String amtComp, boolean flag) {
        try {
            // TODO
            // I want this computation to be global, not exclusive to a specfic fee.
            //Concept: get value from the fee list where the fee code is ? then get the value for that row.
            // I need flag for this ( the City Share, Barangay Sharem, and Special Eduacation Fund is ON by default) Idle Land Tax is Optional
            // OK, use this function and every compute for this, they need to call the setFees() to record each fee computation. Stick to this plan

            PreparedStatement computeFeeList = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_r_fee_list WHERE RPTFL_CODE = ?");
            computeFeeList.setString(1, feeCode);
            ResultSet feeListRs = computeFeeList.executeQuery();
            while (feeListRs.next()) {
                feeListAmt = feeListRs.getFloat("RPTFL_AMOUNT");
                feelistId = feeListRs.getInt("RPTFL_ID");
            }

            if (flag && amtComp.equalsIgnoreCase("TA")) {
                taxedAmount = Float.parseFloat(totTaxAmt) * feeListAmt;
            } else if (flag && amtComp.equalsIgnoreCase("AV")) {
                taxedAmount = Float.parseFloat(assessedVal) * feeListAmt;
            } else {
                taxedAmount = (float) 0.00;
            }

            amountDue += taxedAmount;

            setFees(connection);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void setFees(Connection connection) {
        try {
            PreparedStatement setF1 = (PreparedStatement) connection.prepareStatement("INSERT INTO rpt_t_fl_tb(RPTTB_ID, RPTFL_ID, AMOUNT) VALUES (?,?,?)");
            setF1.setInt(1, RPTTB_ID);
            setF1.setInt(2, feelistId);
            setF1.setDouble(3, taxedAmount);
            setF1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void setAmountDue(Connection connection) {
        try {
            PreparedStatement setF1 = (PreparedStatement) connection.prepareStatement("UPDATE rpt_t_taxbill SET AMOUNT_DUE = ? WHERE RPTTB_ID = ?");
            setF1.setFloat(1, amountDue);
            setF1.setInt(2, RPTTB_ID);
            setF1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void setOfficialRec(Connection connection, String RPL_ID, String RPTA_ID, String optPayMethod, String EP_ID) {
        try {
            PreparedStatement setOR = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_official_receipt(RPTOR_NUMBER, RPTOR_TOT_AMNT, RPTOR_PYMT_TYPE, OIC_CITY_TREASURER, RPTTB_ID, RPTOR_TW_CH_MO_DATE) VALUES (CONCAT('RPT','-','OR',?,?,?,'-',REPLACE(CURRENT_DATE,'-','')),?,?,?,?,CURRENT_DATE)");
            setOR.setString(1, RPL_ID);
            setOR.setString(2, RPTA_ID);
            setOR.setString(3, String.valueOf(RPO_ID));
            setOR.setDouble(4, amountDue);
            setOR.setString(5, optPayMethod);
            setOR.setInt(6, Integer.parseInt(EP_ID));
            setOR.setInt(7, RPTTB_ID);
            setOR.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void setNewTaxBill(Connection connection, String RPL_ID) {

        try {
            PreparedStatement setNewTB = (PreparedStatement) connection.prepareStatement("INSERT INTO rpt_rpland_taxbill(RPL_ID, RPTTB_ID, TAX_YEAR) VALUES (?,?,YEAR(CURRENT_DATE))");
            setNewTB.setInt(1, Integer.parseInt(RPL_ID));
            setNewTB.setInt(2, RPTTB_ID);
            setNewTB.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    void setRPLStatus(Connection connection, String RPL_ID) {
        try {
            PreparedStatement setRPLStat = (PreparedStatement) connection.prepareStatement("UPDATE rpt_t_rp_land SET RPL_STAT = 'TAXBILL' WHERE RPL_ID = ?");
            setRPLStat.setInt(1, Integer.parseInt(RPL_ID));
            setRPLStat.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
