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
import java.sql.Connection;
import java.sql.ResultSet;

@MultipartConfig
@WebServlet("/evaluateMtops")
public class evaluateMtops extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public evaluateMtops() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int AP_ID = Integer.parseInt(request.getParameter("_AP_ID"));
        int AT_ID = Integer.parseInt(request.getParameter("_AT_ID"));
        String AP_REF_N0 = String.valueOf(request.getParameter("_AP_REFERENCE_NO"));
        String AT_COMM_TAX_CERT = String.valueOf(request.getParameter("AT_COMM_TAX_CERT"));
        String AT_LTO_REG_CERT = String.valueOf(request.getParameter("AT_LTO_REG_CERT"));
        String AT_TRICUNIT_PURCH = String.valueOf(request.getParameter("AT_TRICUNIT_PURCH"));
        String AT_BRGY_CLEAR = String.valueOf(request.getParameter("AT_BRGY_CLEAR"));
        String AT_TODA_LTR_CERT = String.valueOf(request.getParameter("AT_TODA_LTR_CERT"));
        String AT_ID_PIC = String.valueOf(request.getParameter("AT_ID_PIC"));
        LGUConnect connect = new LGUConnect();

        try {
            Connection connection = connect.getConnection();
            //Take it here

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private String getCheckboxtatus(String chkbox) {

        if (chkbox.equals("Pass")) {
            return "Pass";
        } else if (chkbox.isEmpty() || chkbox.equals("Fail") || chkbox.equalsIgnoreCase("null")) {
            return "Fail";
        }

        return null;
    }
}
