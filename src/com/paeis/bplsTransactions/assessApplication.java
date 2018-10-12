package com.paeis.bplsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/assessNewApplForm")
@MultipartConfig
public class assessApplication extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String divCode = "", divName ="";

    public assessApplication() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String AP_REFERENCE_NO = String.valueOf(request.getParameter("_AP_REFERENCE_NO"));
        String aId = String.valueOf(request.getParameter("aId"));
        String verId = String.valueOf(request.getParameter("verId"));
        String recId = String.valueOf(request.getParameter("recId"));
        String aprId = String.valueOf(request.getParameter("aprId"));
        int mayorsPerm = Integer.parseInt(request.getParameter("Mayors_Perm") != null ? request.getParameter("Mayors_Perm") : "0");
        int cityTax = Integer.parseInt(request.getParameter("City_Tax") != null ? request.getParameter("City_Tax") : "0");
        int garbageFee = Integer.parseInt(request.getParameter("Garbage_Fee") != null ? request.getParameter("Garbage_Fee") : "0");
        int sanitaryFee = Integer.parseInt(request.getParameter("Sanitary_Fee") != null ? request.getParameter("Sanitary_Fee") : "0");
        int bldgFee = Integer.parseInt(request.getParameter("BLDG_Fee") != null ? request.getParameter("BLDG_Fee") : "0");
        int elecIFee = Integer.parseInt(request.getParameter("ELECI_Fee") != null ? request.getParameter("ELECI_Fee") : "0");
        int plumIFee = Integer.parseInt(request.getParameter("PLUMI_Fee") != null ? request.getParameter("PLUMI_Fee") : "0");
        int signbrdFee = Integer.parseInt(request.getParameter("SIGNBRD_Fee") != null ? request.getParameter("SIGNBRD_Fee") : "0");
        int fsFee = Integer.parseInt(request.getParameter("FS_Fee")  != null ? request.getParameter("FS_Fee") : "0");
        int nrpsFee = Integer.parseInt(request.getParameter("NRPS_Fee") != null ? request.getParameter("NRPS_Fee") : "0");
        int zoningFee = Integer.parseInt(request.getParameter("Zoning_Fee") != null ? request.getParameter("Zoning_Fee") : "0");
        int peniFee = Integer.parseInt(request.getParameter("PENI_Fee") != null ? request.getParameter("PENI_Fee") : "0");
        int tourismFee = Integer.parseInt(request.getParameter("Tourism_Fee") != null ? request.getParameter("Tourism_Fee") : "0");
        int qcbrdFee = Integer.parseInt(request.getParameter("QCBRD_Fee") != null ? request.getParameter("QCBRD_Fee") : "0");
        int adjFee = Integer.parseInt(request.getParameter("ADJ_Fee") != null ? request.getParameter("ADJ_Fee") : "0");
        int discFee = Integer.parseInt(request.getParameter("DISC_Fee") != null ? request.getParameter("DISC_Fee") : "0");
        int pendelFee = Integer.parseInt(request.getParameter("PENDEL_Fee") != null ? request.getParameter("PENDEL_Fee") : "0");
        int adjTourFee = Integer.parseInt(request.getParameter("ADJTOUR_Fee") != null ? request.getParameter("ADJTOUR_Fee") : "0");
        int specperFee = Integer.parseInt(request.getParameter("SPECPER_Fee") != null ? request.getParameter("SPECPER_Fee") : "0");
        int addFee = Integer.parseInt(request.getParameter("ADD_Fee") != null ? request.getParameter("ADD_Fee") : "0");
        int ctcFee = Integer.parseInt(request.getParameter("CTC_Fee") != null ? request.getParameter("CTC_Fee") : "0" ) ;

        LGUConnect conX = new LGUConnect();
        int TB_ID = 0;

        try {
            Connection connection = conX.getConnection();
            PreparedStatement taxBill = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_taxbill (TB_BILL_NO,TB_DATE_BILLED, ASSESSED_BY, VERIFIED_BY, REC_APPROVAL_BY, APPROVED_BY) VALUES (CONCAT('0',TB_ID,REPLACE(?,'-','')),CURRENT_TIMESTAMP(),?,?,?,?)");
            taxBill.setString(1,AP_REFERENCE_NO);
            taxBill.setInt(2,Integer.parseInt(aId));
            taxBill.setInt(3,Integer.parseInt(verId));
            taxBill.setInt(4,Integer.parseInt(recId));
            taxBill.setInt(5,Integer.parseInt(aprId));
            taxBill.executeUpdate();
            PreparedStatement getTBID = (PreparedStatement) connection.prepareStatement("SELECT MAX(TB_ID) AS TB_ID FROM bpls_t_taxbill");
            ResultSet rsTbId = getTBID.executeQuery();
            while (rsTbId.next()){
                TB_ID = rsTbId.getInt("TB_ID");
            }

            setTaxFeeList(mayorsPerm, TB_ID, connection);
            setTaxFeeList(cityTax, TB_ID, connection);
            setTaxFeeList(garbageFee,TB_ID,connection);
            setTaxFeeList(sanitaryFee,TB_ID,connection);
            setTaxFeeList(bldgFee,TB_ID,connection);
            setTaxFeeList(elecIFee,TB_ID,connection);
            setTaxFeeList(plumIFee,TB_ID,connection);
            setTaxFeeList(signbrdFee,TB_ID,connection);
            setTaxFeeList(fsFee,TB_ID,connection);
            setTaxFeeList(nrpsFee,TB_ID,connection);
            setTaxFeeList(zoningFee,TB_ID,connection);
            setTaxFeeList(peniFee,TB_ID,connection);
            setTaxFeeList(tourismFee,TB_ID,connection);
            setTaxFeeList(qcbrdFee,TB_ID,connection);
            setTaxFeeList(adjFee,TB_ID,connection);
            setTaxFeeList(discFee,TB_ID,connection);
            setTaxFeeList(pendelFee,TB_ID,connection);
            setTaxFeeList(adjTourFee,TB_ID,connection);
            setTaxFeeList(specperFee,TB_ID,connection);
            setTaxFeeList(addFee,TB_ID,connection);
            setTaxFeeList(ctcFee,TB_ID,connection);

            PreparedStatement updAppl = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_DIV_CODE_TO = 'DIV-TRE',AP_DIV_CODE_FROM = 'DIV-EV', AP_DATE_ACCESSED = CURRENT_TIMESTAMP(),TB_ID = ? WHERE AP_REFERENCE_NO = ?");
            updAppl.setInt(1,TB_ID);
            updAppl.setString(2,AP_REFERENCE_NO);
            updAppl.executeUpdate();

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
            response.getWriter().print(e);
        }
    }
    private void setTaxFeeList(int feeName, int TB_ID, Connection connection) throws SQLException {
        if (feeName != 0){
            PreparedStatement getF1 = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_r_fee_list WHERE FL_ID = ?");
            getF1.setInt(1, feeName);
            ResultSet frs1 = getF1.executeQuery();
            while (frs1.next()){
                PreparedStatement setF1 = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_fl_tb(TB_ID, FL_ID, AMOUNT) VALUES (?,?,?)");
                setF1.setInt(1,TB_ID);
                setF1.setInt(2,frs1.getInt("FL_ID"));
                setF1.setDouble(3,frs1.getDouble("FL_AMOUNT"));
                setF1.executeUpdate();
            }frs1.close();
        } else if (feeName == 0){
            PreparedStatement getF2 = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_r_fee_list WHERE FL_ID = ?");
            getF2.setInt(1, feeName);
            ResultSet frs2 = getF2.executeQuery();
            while (frs2.next()){
                PreparedStatement setF2 = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_fl_tb(TB_ID, FL_ID, AMOUNT) VALUES (?,?,?)");
                setF2.setInt(1,TB_ID);
                setF2.setInt(2,frs2.getInt("FL_ID"));
                setF2.setDouble(3,0.00);
                setF2.executeUpdate();
            }frs2.close();
        }
    }

}
