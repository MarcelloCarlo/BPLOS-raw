package com.paeis.mtopsTransactions;


import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.ref.PhantomReference;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/treasuryMtops")
public class treasuryMtops extends HttpServlet{
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;

    {
        try {
            connection = connect.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        int tbId = Integer.parseInt(request.getParameter("tbId"));
        String paymentType = String.valueOf(request.getParameter("optPaymentType"));
        int optTreasurer = Integer.parseInt(request.getParameter("optTreasurer"));
        String ap_ref_no = String.valueOf(request.getParameter("AP_REF"));
        Double total = Double.parseDouble(request.getParameter("totalAmt"));

        try {
            PreparedStatement genOR = (PreparedStatement) connection.prepareStatement("INSERT INTO mtops_t_official_receipt (OR_DATE, OR_PYMT_TYPE, OR_TW_CH_MO_NO,OR_TW_CH_MO_DATE, OIC_CITY_TREASURER, TB_ID,OR_TOTAL_AMOUNT) VALUES (NOW(),?,CONCAT(?,'-',REPLACE(CURRENT_DATE,'-','')),NOW(),?,?,?)");
            genOR.setString(1,getPayMethod(paymentType));
            genOR.setString(2,paymentType);
            genOR.setInt(3,optTreasurer);
            genOR.setInt(4,tbId);
            genOR.setDouble(5,total);
            genOR.executeUpdate();

            PreparedStatement setRel = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS = 'Releasing',APF_DATEACCESSED = CURRENT_TIMESTAMP() WHERE APF_ID = ? ");
            setRel.setInt(1, Integer.parseInt(ap_ref_no));
            setRel.executeUpdate();

        }catch (Exception e){e.printStackTrace();}

    }

    private String getPayMethod(String sel) {

        if (sel.equals("CH")) {
            return "Cash";
        } else if (sel.equals("TW")) {
            return "Treasury Warrant";
        } else if (sel.equals("CK")) {
            return "Check";
        } else if (sel.equals("MO")) {
            return "Money Order";
        } else if (sel.isEmpty() || sel.equalsIgnoreCase("null")) {
            return "Cash";
        }

        return null;
    }
}
