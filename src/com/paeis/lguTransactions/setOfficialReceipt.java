package com.paeis.lguTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@MultipartConfig
@WebServlet("/setOfficialReceipt")
public class setOfficialReceipt extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public setOfficialReceipt() {
        super();
    }

    protected void doPost(HttpServletResponse response, HttpServletRequest request) throws IOException {
        int tbId = Integer.parseInt(request.getParameter("tbId"));
        String paymentType = String.valueOf(request.getParameter("optPaymentType"));
        int optTreasurer = Integer.parseInt("optTreasurer");
        String ap_ref_no = String.valueOf("AP_REF_NO");
        LGUConnect conX = new LGUConnect();
        try {


            Connection connection = conX.getConnection();

            PreparedStatement upAPB = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_DIV_CODE_TO = 'DIV-REL' , AP_DIV_CODE_FROM = 'DIV-TRE', AP_DATE_ACCESSED = CURRENT_TIMESTAMP WHERE AP_REFERENCE_NO = ?");
            upAPB.setString(1,ap_ref_no);
            upAPB.executeUpdate();

            PreparedStatement genOR = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_official_receipt (OR_DATE, OR_PYMT_TYPE, OR_TW_CH_MO_NO, OR_TW_CH_MO_DATE, OIC_CITY_TREASURER, TB_ID) VALUES (NOW(),?,CONCAT(?,'-',OR_ID,REPLACE(CURRENT_TIMESTAMP,'-','')),NOW(),?,?)");
        genOR.setString(1,getPaymentMethod(paymentType));
        genOR.setString(2,paymentType);
        genOR.setInt(3,optTreasurer);
        genOR.setInt(4,tbId);
        genOR.executeUpdate();

            PreparedStatement s1 =(PreparedStatement) connection.prepareStatement("SELECT MAX(OR_ID) AS OR_ID FROM bpls_t_official_receipt");
            ResultSet r1 = s1.executeQuery();
            while (r1.next()){
                response.getWriter().print(r1.getInt("OR_ID"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().print(e);
        }
    }

    private String getPaymentMethod(String opt) {

        if (opt.equals("CH")) {
            return "Cash";
        } else if (opt.equals("TW")) {
            return "Treasury Warrant";
        } else if (opt.equals("CK")) {
            return "Check";
        } else if (opt.equals("MO")) {
            return "Money Order";
        } else if (opt.isEmpty() || opt.equalsIgnoreCase("null")) {
            return "Cash";
        }

        return null;
    }
}
