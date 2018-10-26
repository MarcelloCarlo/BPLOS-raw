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
@WebServlet("/inspectionMtops")
public class inspectMtops extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;
    private int cnt = 0;

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

        getCheckboxtatus(hwTires);
        getCheckboxtatus(hwWheels);
        getCheckboxtatus(hwBrakes);
        getCheckboxtatus(hwLevPed);
        getCheckboxtatus(hwCables);
        getCheckboxtatus(hwHoses);
        getCheckboxtatus(hwThrottle);
        getCheckboxtatus(hwBattery);
        getCheckboxtatus(hwHeadlamp);
        getCheckboxtatus(hwTBLamp);
        getCheckboxtatus(hwTSignals);
        getCheckboxtatus(hwMirrors);
        getCheckboxtatus(hwRefl);
        getCheckboxtatus(hwWiring);
        getCheckboxtatus(hwLevels);
        getCheckboxtatus(hwLeaks);
        getCheckboxtatus(hwFrame);
        getCheckboxtatus(hwSusp);
        getCheckboxtatus(hwBelt);
        getCheckboxtatus(hwFastn);
        getCheckboxtatus(hwCStand);
        getCheckboxtatus(hwSStand);

        if (cnt == 22){
            setEval(_AP_REFERENCE_NO,response);
        }else{
          termApl(_AP_REFERENCE_NO,response);
        }

    }


    private int getCheckboxtatus(String chkbox) {
        int skip = 0;
        if (chkbox.equals("Pass")) {
            cnt++;
        } else if (chkbox.isEmpty() || chkbox.equals("Fail") || chkbox.equalsIgnoreCase("null")) {
            skip++;
        }
        return cnt;
    }

    private void setEval(String _AP_REFERENCE_NO, HttpServletResponse response) {
        try {
            connection = connect.getConnection();
            PreparedStatement setEvl = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS = 'Pending',APF_DATEACCESSED = CURRENT_TIMESTAMP() WHERE APF_ID = ? ");
            setEvl.setInt(1, Integer.parseInt(_AP_REFERENCE_NO));
            setEvl.executeUpdate();
            response.getWriter().print("Inspection Success, Please Proceed to Evaluation");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void termApl(String _AP_REFERENCE_NO, HttpServletResponse response) {
        try {
            connection = connect.getConnection();
            PreparedStatement setAss = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS = 'Terminated',APF_DATEACCESSED = CURRENT_TIMESTAMP() WHERE APF_ID = ? ");
            setAss.setInt(1, Integer.parseInt(_AP_REFERENCE_NO));
            setAss.executeUpdate();
            response.getWriter().print("Inspection Failed, Please Return again with complete requirements");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
