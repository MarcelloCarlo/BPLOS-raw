package com.paeis.bplsTransactions;

import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.*;

@MultipartConfig
@WebServlet("/releasePermit")
public class releasePermit extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String divCode = "", divName = "", bpNo = "";
    public releasePermit() {
        super();
    }

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ap_ref_no = String.valueOf(request.getParameter("AP_REF"));
        String ap_remarks = String.valueOf((request.getParameter("AP_REMARKS")));
        int tbId = Integer.parseInt(request.getParameter("tbId"));
        int empId = Integer.parseInt(request.getParameter("currId"));
        LGUConnect conx = new LGUConnect();

        try {
            int bu_id = 0, ap_id = 0;
            Connection connect = conx.getConnection();
            PreparedStatement getBUxAP = (PreparedStatement) connect.prepareStatement("SELECT BU_ID,AP_ID  FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getBUxAP.setString(1, ap_ref_no);
            ResultSet rsx = getBUxAP.executeQuery();
            while (rsx.next()) {
                bu_id = rsx.getInt("BU_ID");
                ap_id = rsx.getInt("AP_ID");
            }

            PreparedStatement genBuPerm = (PreparedStatement) connect.prepareStatement("INSERT INTO bpls_t_business_permit (BP_NUMBER, BP_ISSUED_DATE, BP_VALID_YEARS, BP_REMARKS, BU_ID, AP_ID) VALUES (CONCAT(?,'-',REPLACE(CURRENT_DATE,'-','')),NOW(),DATE_ADD(CURRENT_TIMESTAMP,INTERVAL 1 YEAR ),?,?,?)");
            genBuPerm.setInt(1, tbId);
            genBuPerm.setString(2, ap_remarks);
            genBuPerm.setInt(3, bu_id);
            genBuPerm.setInt(4, ap_id);
            genBuPerm.executeUpdate();

            PreparedStatement updBP = (PreparedStatement) connect.prepareStatement("UPDATE bpls_t_bp_application SET AP_STATUS = 'Success', AP_DIV_CODE_TO = 'END', AP_DIV_CODE_FROM = 'DIV-REL', AP_DATE_ACCESSED = CURRENT_TIMESTAMP, AP_REMARKS = ?, U_REL_ID = ? WHERE AP_REFERENCE_NO = ?");
            updBP.setString(1,ap_remarks);
            updBP.setInt(2,empId);
            updBP.setString(3,ap_ref_no);
            updBP.executeUpdate();


            //Record

            PreparedStatement getAPinfo = (PreparedStatement) connect.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getAPinfo.setString(1,ap_ref_no);
            ResultSet rsAP = getAPinfo.executeQuery();
            while (rsAP.next()){
                divCode = rsAP.getString("AP_DIV_CODE_TO");
            }

            PreparedStatement getDivName = (PreparedStatement) connect.prepareStatement("SELECT * FROM bpls_r_division WHERE DIV_CODE = ?");
            getDivName.setString(1, divCode);
            ResultSet rsDivName = getDivName.executeQuery();
            while (rsDivName.next()) {
                divName = rsDivName.getString("DIV_NAME");
            }

            PreparedStatement recHist = (PreparedStatement) connect.prepareStatement("INSERT INTO bpls_t_ap_history(TL_AP_NO, TL_DIV_CODE, TL_DIV_NAME,TL_REMARKS) VALUES (?,?,?,?)");
            recHist.setString(1, ap_ref_no);
            recHist.setString(2, divCode);
            recHist.setString(3, divName);
            recHist.setString(4, ap_remarks);
            recHist.executeUpdate();


            PreparedStatement getBPNo = (PreparedStatement) connect.prepareStatement("SELECT * FROM bpls_t_business_permit WHERE BU_ID = ? AND AP_ID = ?");
            getBPNo.setInt(1,bu_id);
            getBPNo.setInt(2,ap_id);
            ResultSet BPno = getBPNo.executeQuery();
            while (BPno.next()){
                bpNo = BPno.getString("BP_NUMBER");
            }

            response.getWriter().print(bpNo);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
