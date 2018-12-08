package com.paeis.mtopsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;

@MultipartConfig
@WebServlet("/inspectMtops")
public class inspectMtops extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;
    private int cnt = 0;
    private int skip = 0;

    public inspectMtops() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

        String _AP_REFERENCE_NO = String.valueOf(request.getParameter("_AP_REFERENCE_NO"));
        String hwTires = String.valueOf(request.getParameter("hwTires"));
        String hwWheels = String.valueOf(request.getParameter("hwWheels"));
        String hwBrakes = String.valueOf(request.getParameter("hwBrakes"));
        String hwLevPed = String.valueOf(request.getParameter("hwLevPed"));
        String hwCables = String.valueOf(request.getParameter("hwCables"));
        String hwHoses = String.valueOf(request.getParameter("hwHoses"));
        String hwThrottle = String.valueOf(request.getParameter("hwThrottle"));
        String hwBattery = String.valueOf(request.getParameter("hwBattery"));
        String hwHeadlamp = String.valueOf(request.getParameter("hwHeadlamp"));
        String hwTBLamp = String.valueOf(request.getParameter("hwTBLamp"));
        String hwTSignals = String.valueOf(request.getParameter("hwTSignals"));
        String hwMirrors = String.valueOf(request.getParameter("hwMirrors"));
        String hwRefl = String.valueOf(request.getParameter("hwRefl"));
        String hwWiring = String.valueOf(request.getParameter("hwWiring"));
        String hwLevels = String.valueOf(request.getParameter("hwLevels"));
        String hwLeaks = String.valueOf(request.getParameter("hwLeaks"));
        String hwFrame = String.valueOf(request.getParameter("hwFrame"));
        String hwSusp = String.valueOf(request.getParameter("hwSusp"));
        String hwBelt = String.valueOf(request.getParameter("hwBelt"));
        String hwFastn = String.valueOf(request.getParameter("hwFastn"));
        String hwCStand = String.valueOf(request.getParameter("hwCStand"));
        String hwSStand = String.valueOf(request.getParameter("hwSStand"));

        response.setContentType("text/html;charset=UTF-8");

        getCheckboxCount(hwTires);
        getCheckboxCount(hwWheels);
        getCheckboxCount(hwBrakes);
        getCheckboxCount(hwLevPed);
        getCheckboxCount(hwCables);
        getCheckboxCount(hwHoses);
        getCheckboxCount(hwThrottle);
        getCheckboxCount(hwBattery);
        getCheckboxCount(hwHeadlamp);
        getCheckboxCount(hwTBLamp);
        getCheckboxCount(hwTSignals);
        getCheckboxCount(hwMirrors);
        getCheckboxCount(hwRefl);
        getCheckboxCount(hwWiring);
        getCheckboxCount(hwLevels);
        getCheckboxCount(hwLeaks);
        getCheckboxCount(hwFrame);
        getCheckboxCount(hwSusp);
        getCheckboxCount(hwBelt);
        getCheckboxCount(hwFastn);
        getCheckboxCount(hwCStand);
        getCheckboxCount(hwSStand);

        if (cnt == 22) {
            setAssess(_AP_REFERENCE_NO, response);
        } else {
            termApl(_AP_REFERENCE_NO, response);
        }

    }

    private void setAssess(String _AP_REFERENCE_NO, HttpServletResponse response) {
        try {
            connection = connect.getConnection();
            PreparedStatement setAssess = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS = 'Assessing',APF_DATEACCESSED = CURRENT_TIMESTAMP() WHERE APF_ID = ? ");
            setAssess.setInt(1, Integer.parseInt(_AP_REFERENCE_NO));
            setAssess.executeUpdate();
            response.getWriter().print("Inspection Success, Please Proceed to Assessment");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void termApl(String _AP_REFERENCE_NO, HttpServletResponse response) {
        try {
            connection = connect.getConnection();
            PreparedStatement termAppl = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS = 'Terminated', APF_DATEACCESSED = CURRENT_TIMESTAMP() WHERE APF_ID = ? ");
            termAppl.setInt(1, Integer.parseInt(_AP_REFERENCE_NO));
            termAppl.executeUpdate();
            response.getWriter().print("Inspection Failed, Please Return again with complete requirements");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void getCheckboxCount(String chkbox) {
        if (chkbox.isEmpty() || chkbox.equals("Fail") || chkbox.equalsIgnoreCase("null")) {
            skip++;
        } else {
            cnt++;
        }
    }
}
