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
import java.net.IDN;
import java.sql.Connection;
import java.sql.ResultSet;

@MultipartConfig
@WebServlet("/evaluateMtops")
public class evaluateMtops extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;
    private int cnt = 0;
    private int skip = 0;

    public evaluateMtops() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String AP_REF_NO = String.valueOf(request.getParameter("_AP_REFERENCE_NO"));
        String AT_COMM_TAX_CERT = String.valueOf(request.getParameter("AT_COMM_TAX_CERT"));
        String AT_LTO_REG_CERT = String.valueOf(request.getParameter("AT_LTO_REG_CERT"));
        String AT_TRICUNIT_PURCH = String.valueOf(request.getParameter("AT_TRICUNIT_PURCH"));
        String AT_BRGY_CLEAR = String.valueOf(request.getParameter("AT_BRGY_CLEAR"));
        String AT_TODA_LTR_CERT = String.valueOf(request.getParameter("AT_TODA_LTR_CERT"));
        String AT_ID_PIC = String.valueOf(request.getParameter("AT_ID_PIC"));

        getCheckboxcount(AT_COMM_TAX_CERT);
        getCheckboxcount(AT_LTO_REG_CERT);
        getCheckboxcount(AT_TRICUNIT_PURCH);
        getCheckboxcount(AT_BRGY_CLEAR);
        getCheckboxcount(AT_TODA_LTR_CERT);
        getCheckboxcount(AT_ID_PIC);

        response.setContentType("text/html;charset=UTF-8");
        if (cnt == 6){
            setInspect(AP_REF_NO,response);
        }else{
            termApl(AP_REF_NO,response);
        }

    }

    private void termApl(String _AP_REFERENCE_NO, HttpServletResponse response) {
        try {
            connection = connect.getConnection();
            PreparedStatement setTer = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS = 'Terminated',APF_DATEACCESSED = CURRENT_TIMESTAMP() WHERE APF_ID = ? ");
            setTer.setInt(1, Integer.parseInt(_AP_REFERENCE_NO));
            setTer.executeUpdate();
            response.getWriter().print("Evaluation Failed, Please Return again with complete requirements");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setInspect(String _AP_REFERENCE_NO, HttpServletResponse response) {
        try {
            connection = connect.getConnection();
            PreparedStatement setInsp = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS = 'Inspecting',APF_DATEACCESSED = CURRENT_TIMESTAMP() WHERE APF_ID = ? ");
            setInsp.setInt(1, Integer.parseInt(_AP_REFERENCE_NO));
            setInsp.executeUpdate();
            response.getWriter().print("Evaluation Success, Please Proceed to Assessment");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void getCheckboxcount(String chkbox) {
        if (chkbox.isEmpty() || chkbox.equals("Fail") || chkbox.equalsIgnoreCase("null")) {
            skip++;
        } else {
            cnt++;
        }
    }
}
