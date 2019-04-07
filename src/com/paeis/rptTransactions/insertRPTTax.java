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
import java.sql.ResultSet;

@WebServlet("/insertRPTTax")
@MultipartConfig
public class insertRPTTax extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private   int RPTAX_ID =0, RPO_ID=0, RPTTB_ID = 0;
    private float taxedAmount = 0, feeListAmt =0;

    public insertRPTTax(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String EP_ID = request.getParameter("EP_ID"), RPL_ID = request.getParameter("RPL_ID"),RPTA_ID = request.getParameter("RPTA_ID"), taxRateId = request.getParameter("taxRateId"), totAmt = request.getParameter("totAmtHide"),optInstallment = request.getParameter("optInstallment"), optPayMethod = request.getParameter("optPayMethod"), chkIdleStat = request.getParameter("chkIdleStat");

        LGUConnect connect = new LGUConnect();

        try {
            Connection connection = connect.getConnection();

            PreparedStatement getF1 = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_r_fee_list");
            ResultSet frs1 = getF1.executeQuery();
            while (frs1.next()) {
                PreparedStatement setF1 = (PreparedStatement) connection.prepareStatement("INSERT INTO rpt_t_fl_tb(RPTTB_ID, RPTFL_ID, AMOUNT) VALUES (?,?,?)");
                setF1.setInt(1, RPTTB_ID);
                setF1.setInt(2, frs1.getInt("RPTFL_ID"));
                setF1.setDouble(3, frs1.getDouble("RPTFL_AMOUNT"));
                setF1.executeUpdate();
            }

            PreparedStatement setOR = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_official_receipt(RPTOR_NUMBER, RPTOR_TOT_AMNT, RPTOR_PYMT_TYPE, OIC_CITY_TREASURER, RPTTB_ID, RPTOR_TW_CH_MO_DATE) VALUES (CONCAT('RPT','-','OR',?,?,?,'-',REPLACE(CURRENT_DATE,'-','')),?,?,?,?,CURRENT_DATE)");
            setOR.setString(1,RPL_ID);
            setOR.setString(2,RPTA_ID);
            setOR.setString(3,String.valueOf(RPO_ID));
            setOR.setDouble(4,taxedAmount);
            setOR.setString(5,optPayMethod);
            setOR.setInt(6,Integer.parseInt(EP_ID));
            setOR.setInt(7,RPTTB_ID);
            setOR.executeUpdate();

            PreparedStatement setRPLStat = (PreparedStatement) connection.prepareStatement("UPDATE rpt_t_rp_land SET RPL_STAT = 'TAXBILL' WHERE RPL_ID = ?");
            setRPLStat.setInt(1,Integer.parseInt(RPL_ID));
            setRPLStat.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //-------------------------- All Methods---------------------------//
    void setRptTax(Connection connection, String RPTA_ID, String taxRateId, String totAmt){
        try{
            PreparedStatement rptTax = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_rptax(RPTA_ID, RPTR_ID, RPT_AMOUNT) VALUES (?,?,?)");
            rptTax.setInt(1,Integer.parseInt(RPTA_ID));
            rptTax.setInt   (2,Integer.parseInt(taxRateId));
            rptTax.setFloat(3,Float.parseFloat(totAmt));
            rptTax.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }


    void getRPOId(Connection connection, String RPL_ID){
        try{
            PreparedStatement getRPOId = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_rp_land WHERE RPL_ID = ?");
            getRPOId.setInt(1,Integer.parseInt(RPL_ID));
            ResultSet getRPOIdRs = getRPOId.executeQuery();
            while (getRPOIdRs.next()){
                RPO_ID = getRPOIdRs.getInt("RPO_ID");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    void getRPTAXId(Connection connection, String RPTA_ID, String taxRateId){
        try{
            PreparedStatement getRPTAXId = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_rptax WHERE RPTA_ID = ? AND RPTR_ID = ?");
            getRPTAXId.setInt(1,Integer.parseInt(RPTA_ID));
            getRPTAXId.setInt(2,Integer.parseInt(taxRateId));
            ResultSet getRPTAXIdRs = getRPTAXId.executeQuery();
            while (getRPTAXIdRs.next()){
                RPTAX_ID = getRPTAXIdRs.getInt("RPTAX_ID");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    void computeFeeList(Connection connection, String totAmt){
        try{
            PreparedStatement computeFeeList = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_r_fee_list");
            ResultSet feeListRs = computeFeeList.executeQuery();
            while (feeListRs.next()){
                feeListAmt += feeListRs.getFloat("RPTFL_AMOUNT");
            }

            taxedAmount = Float.parseFloat(totAmt) + feeListAmt;

        } catch (Exception e){
            e.printStackTrace();
        }
    }

    void setTaxBill(Connection connection, String RPL_ID, String RPTA_ID, String optInstallment){
        try{
            PreparedStatement setTaxBill = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_taxbill( RPTTB_BILL_NO, RPTTB_DATE_BILLED, RPTAX_ID, RPL_ID, RPO_ID, RPTA_ID, TAX_YEAR, AMOUNT_DUE,INSTALLMENT) VALUES (CONCAT('RPTB',REPLACE(CURRENT_DATE,'-','')),CURRENT_DATE,?,?,?,?,CURRENT_DATE,?,?)");
            setTaxBill.setInt(1,RPTAX_ID);
            setTaxBill.setInt(2,Integer.parseInt(RPL_ID));
            setTaxBill.setInt(3,RPO_ID);
            setTaxBill.setInt(4,Integer.parseInt(RPTA_ID));
            setTaxBill.setFloat(5,taxedAmount);
            setTaxBill.setString(6,optInstallment);
            setTaxBill.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
