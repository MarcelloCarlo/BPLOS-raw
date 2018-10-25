package com.paeis.mtopsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

@MultipartConfig
@WebServlet("/inspectionMtops")
public class inspectMtops extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;

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

        try {
            connection = connect.getConnection();


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
