package com.qcapaeis.dbConnection;

import java.sql.*;

public class LGUConnect {
    public Connection getConnection(){
        try{
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Connection conX = DriverManager.getConnection("jdbc:mysql://localhost:3306/lgu_qcpa_eis_db","root","");
            return conX;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
