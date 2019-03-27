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

@WebServlet("/insertProperty")
@MultipartConfig
public class insertProperty extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public insertProperty(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String addPropOwner = request.getParameter("addPropOwner"), addPropClass = request.getParameter("addPropClass"), addPropType = request.getParameter("addPropType"), addPropActualUse = request.getParameter("addPropActualUse"), addPropStreet = request.getParameter("addPropStreet"), addPropBrgy = request.getParameter("addPropBrgy"), addPropMunic = request.getParameter("addPropMunic"), addPropProv = request.getParameter("addPropProv"), addPropNorth = request.getParameter("addPropNorth"), addPropEast = request.getParameter("addPropEast"), addPropSouth = request.getParameter("addPropSouth"), addPropWest = request.getParameter("addPropWest"), addProPIN = request.getParameter("addProPIN"), addProArea = request.getParameter("addProArea");

        LGUConnect connect = new LGUConnect();

        try {
            Connection connection = connect.getConnection();
            PreparedStatement insertProp = (PreparedStatement) connection.prepareStatement("INSERT rpt_t_rp_land(RPO_ID, RPL_L_STREET, RPL_L_BRGY, RPL_L_DIST_MUNI, RPL_L_CITY_PROV, RPL_B_NORTH, RPL_B_EAST, RPL_B_SOUTH, RPL_B_WEST, PC_ID, PT_ID, AU_ID,RPL_PIN,RPL_AREA) VALUE (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            insertProp.setInt(1,Integer.parseInt(addPropOwner));
            insertProp.setString(2,addPropStreet);
            insertProp.setString(3,addPropBrgy);
            insertProp.setString(4,addPropMunic);
            insertProp.setString(5,addPropProv);
            insertProp.setString(6,addPropNorth);
            insertProp.setString(7,addPropEast);
            insertProp.setString(8,addPropSouth);
            insertProp.setString(9,addPropWest);
            insertProp.setInt(10,Integer.parseInt(addPropClass));
            insertProp.setInt(11,Integer.parseInt(addPropType));
            insertProp.setInt(12,Integer.parseInt(addPropActualUse));
            insertProp.setString(13,addProPIN);
            insertProp.setFloat(14, Float.parseFloat(addProArea));
            insertProp.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
