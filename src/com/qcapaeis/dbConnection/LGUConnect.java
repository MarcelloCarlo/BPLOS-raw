package com.qcapaeis.dbConnection;

import java.sql.*;

public class LGUConnect {
	  // Connect to MySQL
	   public Connection getConnection() throws SQLException,
	           ClassNotFoundException {
	       String hostName = "localhost";
	 
	       String dbName = "lgu_paeis_db";
	       String userName = "root";
	       String password = "";
	 
	       return getConnection(hostName, dbName, userName, password);
	   }
	 
	   public Connection getConnection(String hostName, String dbName,
	           String userName, String password) throws SQLException,
	           ClassNotFoundException {
	       // Declare the class Driver for MySQL DB
	       // This is necessary with Java 5 (or older)
	       // Java6 (or newer) automatically find the appropriate driver.
	       // If you use Java> 5, then this line is not needed.
	       //Class.forName("com.mysql.jdbc.Driver");
		   DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	       String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
	 
	       Connection conX = DriverManager.getConnection(connectionURL, userName,
	               password);
	       return conX;
	   }
	   
	
 /*   public Connection getConnection(){
        try{
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Connection conX = DriverManager.getConnection("jdbc:mysql://localhost:3306/lgu_qcpa_eis_db","root","");
            return conX;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }*/
}
