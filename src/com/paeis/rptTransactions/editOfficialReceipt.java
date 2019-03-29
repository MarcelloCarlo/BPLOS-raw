package com.paeis.rptTransactions;

import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/editOfficialReceipt")
@MultipartConfig
public class editOfficialReceipt extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public editOfficialReceipt(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txbId = request.getParameter("txbId");
        LGUConnect connect = new LGUConnect();

        try {
            Connection connection = connect.getConnection();
            PreparedStatement editRPLStat = (PreparedStatement) connection.prepareStatement("UPDATE rpt_t_rp_land SET RPL_STAT = 'RECEIPT' WHERE RPL_ID = ?");
            editRPLStat.setInt(1,Integer.parseInt(txbId));
            editRPLStat.executeUpdate();

        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
