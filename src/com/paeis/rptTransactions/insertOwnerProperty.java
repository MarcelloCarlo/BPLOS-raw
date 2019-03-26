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

@WebServlet("/insertOwnerProperty")
@MultipartConfig
public class insertOwnerProperty extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public insertOwnerProperty(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect connect = new LGUConnect();

        String addOwnFname = request.getParameter("addOwnFname"), addOwnMname = request.getParameter("addOwnMname"), addOwnSname = request.getParameter("addOwnSname"), addOwnEmail = request.getParameter("addOwnEmail"), addOwnTel = request.getParameter("addOwnTel"), addOwnTin = request.getParameter("addOwnTin"), addOwnAddr = request.getParameter("addOwnAddr");

        try{
            Connection connection = connect.getConnection();
            PreparedStatement insertOwnerInf = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_rp_owner(RPO_SNAME, RPO_FNAME, RPO_MNAME, RPO_ADDR, RPO_CONT, RPO_EMAIL, RPO_TIN) VALUES (?,?,?,?,?,?,?)");
            insertOwnerInf.setString(1,addOwnSname);
            insertOwnerInf.setString(2,addOwnFname);
            insertOwnerInf.setString(3,addOwnMname);
            insertOwnerInf.setString(4,addOwnAddr);
            insertOwnerInf.setString(5,addOwnTel);
            insertOwnerInf.setString(6,addOwnEmail);
            insertOwnerInf.setString(7,addOwnTin);
            insertOwnerInf.executeUpdate();


        } catch (Exception e){
            e.printStackTrace();
        }
    }

}
