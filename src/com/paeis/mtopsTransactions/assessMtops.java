package com.paeis.mtopsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.ref.PhantomReference;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/assessMtops")
public class assessMtops extends HttpServlet {
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

    private int TB_ID = 0;

    public assessMtops() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        String _AP_REFERENCE_NO = String.valueOf(request.getParameter("_AP_REFERENCE_NO"));
       // String aId = String.valueOf(request.getParameter("aId"));
        int MFF = Integer.parseInt(request.getParameter("MFF") != null ? request.getParameter("MFF") : "0");
        int IF = Integer.parseInt(request.getParameter("IF") != null ? request.getParameter("IF") : "0");
        int PF = Integer.parseInt(request.getParameter("PF") != null ? request.getParameter("PF") : "0");
        int FE = Integer.parseInt(request.getParameter("FE") != null ? request.getParameter("FE") : "0");
        int FAE = Integer.parseInt(request.getParameter("FAE") != null ? request.getParameter("FAE") : "0");
        int RF = Integer.parseInt(request.getParameter("RF") != null ? request.getParameter("RF") : "0");
        int PPF = Integer.parseInt(request.getParameter("PPF") != null ? request.getParameter("PPF") : "0");


        try{

            PreparedStatement taxBill = (PreparedStatement) connection.prepareStatement("INSERT INTO mtops_t_assessment (TB_BILL_NO,TB_DATE_BILLED) VALUES (CONCAT('0',REPLACE(CURRENT_TIMESTAMP(),'-','')),CURRENT_TIMESTAMP())");
            //taxBill.setInt(1,Integer.parseInt(aId));
            taxBill.executeUpdate();
            PreparedStatement getTBID = (PreparedStatement) connection.prepareStatement("SELECT MAX(TB_ID) AS TB_ID FROM mtops_t_assessment");
            ResultSet rsTbId = getTBID.executeQuery();
            while (rsTbId.next()){
                TB_ID = rsTbId.getInt("TB_ID");
            }

            setTaxFeeList(MFF);
            setTaxFeeList(IF);
            setTaxFeeList(PF);
            setTaxFeeList(FE);
            setTaxFeeList(FAE);
            setTaxFeeList(RF);
            setTaxFeeList(PPF);

            PreparedStatement setTre = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS='Treasury',APF_DATEACCESSED=CURRENT_TIMESTAMP, TB_ID = ? WHERE APF_ID = ?");
            setTre.setInt(1,TB_ID);
            setTre.setInt(2,Integer.parseInt(_AP_REFERENCE_NO));
            setTre.executeUpdate();
            response.getWriter().print("Assessment Success!");
        }catch (Exception ex){
            ex.printStackTrace();
        }

    }

    private void setTaxFeeList(int feeName) throws SQLException {
        if (feeName != 0){
            PreparedStatement getF1 = (PreparedStatement) connection.prepareStatement("SELECT * FROM mtops_r_fee_list WHERE FL_ID = ?");
            getF1.setInt(1, feeName);
            ResultSet frs1 = getF1.executeQuery();
            while (frs1.next()){
                PreparedStatement setF1 = (PreparedStatement) connection.prepareStatement("INSERT INTO mtops_t_fl_tb(TB_ID, FL_ID, AMOUNT) VALUES (?,?,?)");
                setF1.setInt(1,TB_ID);
                setF1.setInt(2,frs1.getInt("FL_ID"));
                setF1.setDouble(3,frs1.getDouble("FL_AMOUNT"));
                setF1.executeUpdate();
            }frs1.close();
        } else if (feeName == 0){
            PreparedStatement getF2 = (PreparedStatement) connection.prepareStatement("SELECT * FROM mtops_r_fee_list WHERE FL_ID = ?");
            getF2.setInt(1, feeName);
            ResultSet frs2 = getF2.executeQuery();
            while (frs2.next()){
                PreparedStatement setF2 = (PreparedStatement) connection.prepareStatement("INSERT INTO mtops_t_fl_tb(TB_ID, FL_ID, AMOUNT) VALUES (?,?,?)");
                setF2.setInt(1,TB_ID);
                setF2.setInt(2,frs2.getInt("FL_ID"));
                setF2.setDouble(3,0.00);
                setF2.executeUpdate();
            }frs2.close();
        }
    }
}
