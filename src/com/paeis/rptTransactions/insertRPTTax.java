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

    public insertRPTTax(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String EP_ID = request.getParameter("EP_ID"), RPL_ID = request.getParameter("RPL_ID"),RPTA_ID = request.getParameter("RPTA_ID"), taxRateId = request.getParameter("taxRateId"), totAmt = request.getParameter("totAmt"),optInstallment = request.getParameter("optInstallment");

        int RPTAX_ID, RPO_ID;
        LGUConnect connect = new LGUConnect();

        try {
            Connection connection = connect.getConnection();
            PreparedStatement rptTax = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_rptax(RPTA_ID, RPTR_ID, RPT_AMOUNT) VALUES (?,?,?)");
            rptTax.setInt(1,Integer.parseInt(RPTA_ID));
            rptTax.setInt(2,Integer.parseInt(taxRateId));
            rptTax.setFloat(3,Float.parseFloat(totAmt));
            rptTax.executeUpdate();

            PreparedStatement getRPOId = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_rp_land WHERE RPL_ID = ?");
            getRPOId.setInt(1,Integer.parseInt(RPL_ID));
            ResultSet getRPOIdRs = getRPOId.executeQuery();
            while (getRPOIdRs.next()){
                RPO_ID = getRPOIdRs.getInt("RPO_ID");
            }

            PreparedStatement getRPTAXId = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_rptax WHERE RPTA_ID = ? AND RPTR_ID = ?");
            getRPTAXId.setInt(1,Integer.parseInt(RPTA_ID));
            getRPTAXId.setInt(2,Integer.parseInt(taxRateId));
            ResultSet getRPTAXIdRs = getRPTAXId.executeQuery();
            while (getRPTAXIdRs.next()){
                RPTAX_ID = getRPTAXIdRs.getInt("RPTAX_ID");
            }

            PreparedStatement setTaxBill = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_taxbill( RPTTB_BILL_NO, RPTTB_DATE_BILLED, RPTAX_ID, RPL_ID, RPO_ID, RPTA_ID, TAX_YEAR, AMOUNT_DUE) VALUES (CONCAT('RPTB',REPLACE(CURRENT_DATE,'-','')),CURRENT_DATE,?,?,?,?,YEAR(CURRENT_DATE),?)");


            rptTax.executeUpdate();
            ;
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
