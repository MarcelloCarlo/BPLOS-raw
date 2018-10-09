package com.paeis.lguTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/assessNewApplForm")
@MultipartConfig
public class assessApplication extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public assessApplication() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String AP_REFERENCE_NO = String.valueOf(request.getParameter("_AAP_REFERENCE_NO"));
        int mayorsPerm = Integer.parseInt(request.getParameter("Mayors_Perm"));
        int cityTax = Integer.parseInt(request.getParameter("City_Tax"));
        int garbageFee = Integer.parseInt(request.getParameter("Garbage_Fee"));
        int sanitaryFee = Integer.parseInt(request.getParameter("Sanitary_Fee"));
        int bldgFee = Integer.parseInt(request.getParameter("BLDG_Fee"));
        int elecIFee = Integer.parseInt(request.getParameter("ELECI_Fee"));
        int plumIFee = Integer.parseInt(request.getParameter("PLUMI_Fee"));
        int signbrdFee = Integer.parseInt(request.getParameter("SIGNBRD_Fee"));
        int fsFee = Integer.parseInt(request.getParameter("FS_Fee"));
        int nrpsFee = Integer.parseInt(request.getParameter("NRPS_Fee"));
        int zoningFee = Integer.parseInt(request.getParameter("Zoning_Fee"));
        int peniFee = Integer.parseInt(request.getParameter("PENI_Fee"));
        LGUConnect conX = new LGUConnect();
        String currBN = "";
            currBN = "UPDATE bpls_t_bp_application SET AP_STATUS = 'Assess', AP_DATE_ACCESSED = CURRENT_TIMESTAMP() WHERE AP_REFERENCE_NO = ?";


        try {
            Connection connection = conX.getConnection();
            PreparedStatement taxBill = (PreparedStatement) connection.prepareStatement("INSERT bpls_t_taxbill (TB_DATE_BILLED, ASSESSED_BY, VERIFIED_BY, REC_APPROVAL_BY, APPROVED_BY) SET (CURRENT_TIMESTAMP(),)");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print(e);
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
