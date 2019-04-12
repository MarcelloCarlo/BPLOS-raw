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

@WebServlet("/editRPTStatus")
@MultipartConfig
public class editRPTStatus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public editRPTStatus(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String RPL_ID = request.getParameter("RPL_ID");


        LGUConnect connect = new LGUConnect();
        try {
            Connection connection = connect.getConnection();

            PreparedStatement setRPLStat = (PreparedStatement) connection.prepareStatement("UPDATE rpt_t_rp_land SET RPL_STAT = 'TAXING' WHERE RPL_ID = ?");
            setRPLStat.setInt(1,Integer.parseInt(RPL_ID));
            setRPLStat.executeUpdate();

        } catch (Exception e){
            e.printStackTrace();
        }

    }
}
