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
@WebServlet("/setOfficialReceipt")
public class setOfficialReceipt extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String divCode="", divName="";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        int tbId = Integer.parseInt(request.getParameter("tbId"));
        String paymentType = String.valueOf(request.getParameter("optPaymentType"));
        int optTreasurer = Integer.parseInt(request.getParameter("optTreasurer"));
        String ap_ref_no = String.valueOf(request.getParameter("AP_REF"));
        LGUConnect conX = new LGUConnect();
        try {


            Connection connection = conX.getConnection();

            PreparedStatement upAPB = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_DIV_CODE_TO = 'DIV-REL' , AP_DIV_CODE_FROM = 'DIV-TRE', AP_DATE_ACCESSED = CURRENT_TIMESTAMP WHERE AP_REFERENCE_NO = ?");
            upAPB.setString(1,ap_ref_no);
            upAPB.executeUpdate();

            PreparedStatement genOR = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_official_receipt (OR_DATE, OR_PYMT_TYPE, OR_TW_CH_MO_NO, OR_TW_CH_MO_DATE, OIC_CITY_TREASURER, TB_ID) VALUES (NOW(),?,CONCAT(?,'-',REPLACE(CURRENT_TIMESTAMP,'-','')),NOW(),?,?)");
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

            //Record

            PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getAPinfo.setString(1, ap_ref_no);
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
            recHist.setString(1, ap_ref_no);
            recHist.setString(2, divCode);
            recHist.setString(3, divName);
            recHist.executeUpdate();

            response.sendRedirect(request.getContextPath()+"/BPLSTIndex.jsp");
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
