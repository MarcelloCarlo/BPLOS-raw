package com.paeis.mtopsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.ref.PhantomReference;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/releaseMtops")
public class releasingMtops extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public releasingMtops() {
        super();
    }
    LGUConnect conx = new LGUConnect();
    private String perIdNo = "";


    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response) throws IOException {
        String apfId = request.getParameter("_AP_REFERENCE_NO");
        String txtMotorNum = request.getParameter("txtMotorNum");
        String txtChaNum = request.getParameter("txtChaNum");
        String txtBikeLName = request.getParameter("txtBikeLName");
        String txtPlateNum = request.getParameter("txtPlateNum");

        try {
            Connection connection = conx.getConnection();
            PreparedStatement insertPermit = (PreparedStatement) connection.prepareStatement("INSERT INTO `mtops_t_permit`( `PERMIT_NO`, `PERMIT_DATE`, `PERMIT_VALIDITY`, `MOTOR_NUMBER`, `CHASSIS_NUMBER`, `BIKE_NAME`, `PLATE_NUMBER`, `APF_ID`) VALUES (CONCAT(?,'-',REPLACE(CURRENT_DATE,'-','')),NOW(),DATE_ADD(CURRENT_TIMESTAMP,INTERVAL 1 YEAR ),?,?,?,?,?)");
            insertPermit.setString(1,apfId);
            insertPermit.setString(2,txtMotorNum);
            insertPermit.setString(3,txtChaNum);
            insertPermit.setString(4,txtBikeLName);
            insertPermit.setString(5,txtPlateNum);
            insertPermit.setInt(6, Integer.parseInt(apfId));
            insertPermit.executeUpdate();

            PreparedStatement setRel = (PreparedStatement) connection.prepareStatement("UPDATE mtops_t_application_frm SET APF_STATUS = 'Done',APF_DATEACCESSED = CURRENT_TIMESTAMP() WHERE APF_ID = ? ");
            setRel.setInt(1, Integer.parseInt(apfId));
            setRel.executeUpdate();

            PreparedStatement getPerID = (PreparedStatement) connection.prepareStatement("SELECT * FROM mtops_t_permit WHERE APF_ID = ?");
            getPerID.setInt(1, Integer.parseInt(apfId));
            ResultSet perID = getPerID.executeQuery();
            while (perID.next()){
                perIdNo = perID.getString("PERMIT_ID");
            }
            response.getWriter().print(perIdNo);

        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
