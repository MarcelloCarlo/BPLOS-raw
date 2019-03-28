package com.paeis.rptTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/insertAssessRPT")
@MultipartConfig
public class insertAssessRPT extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public insertAssessRPT(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String RPL_ID = request.getParameter("RPL_ID"), PC_ID = request.getParameter("PC_ID"), AU_ID = request.getParameter("AU_ID"), AL_ID = request.getParameter("AL_ID"), EP_ID = request.getParameter("EP_ID"), marketVal = request.getParameter("marketVal"),assessValX = request.getParameter("assessValX"), PT_ID = request.getParameter("PT_ID"), optAssessType = request.getParameter("optAssessType"), opt = "";

        if (optAssessType.equalsIgnoreCase("TX")) {
            opt = "TAXABLE";
        } else if (optAssessType.equalsIgnoreCase("EX")){
            opt = "EXEMPT";
        } else {
            opt = "TAXABLE";
        }
        LGUConnect connect = new LGUConnect();
        try {
            Connection connection = connect.getConnection();
            PreparedStatement assessRPT = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_assessment (RPL_ID, PC_ID, MRKT_VAL, AU_ID, AL_ID, ASSESSED_VAL, ASSESSED_BY, APPROVED_BY, ARP_NO,FLAG,TAX_DEC_NO) VALUES (?,?,?,?,?,?,?,?,CONCAT('RPT',?,?,?,REPLACE(CURRENT_DATE,'-','')),?,CONCAT('RPT','-','TD',?,?,?,'-',REPLACE(CURRENT_DATE,'-','')))");
            assessRPT.setInt(1, Integer.parseInt(RPL_ID));
            assessRPT.setInt(2,Integer.parseInt(PC_ID));
            assessRPT.setFloat(3,Float.parseFloat(marketVal));
            assessRPT.setInt(4,Integer.parseInt(AU_ID));
            assessRPT.setInt(5,Integer.parseInt(AL_ID));
            assessRPT.setFloat(6,Float.parseFloat(assessValX));
            assessRPT.setInt(7, Integer.parseInt(EP_ID));
            assessRPT.setInt(8, Integer.parseInt(EP_ID));
            assessRPT.setString(9,PT_ID);
            assessRPT.setString(10,PC_ID);
            assessRPT.setString(11,AU_ID);
            assessRPT.setString(12,opt);
            assessRPT.setString(13,PT_ID);
            assessRPT.setString(14,PC_ID);
            assessRPT.setString(15,AU_ID);
            assessRPT.executeUpdate();

            PreparedStatement setRPLStat = (PreparedStatement) connection.prepareStatement("UPDATE rpt_t_rp_land SET RPL_STAT = 'TAXING' WHERE RPL_ID = ?");
            setRPLStat.setInt(1,Integer.parseInt(RPL_ID));
            setRPLStat.executeUpdate();

        } catch (Exception e){
            e.printStackTrace();
        }

    }
}
