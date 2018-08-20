<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String username=request.getParameter("username");
String password=request.getParameter("password");
String type=request.getParameter("type");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lgu_qcpa_eis_db", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into lgu_r_user(U_USERNAME,U_PASSWORD,U_TYPE)values('"+username+"','"+password+"','"+type+"')");
out.println("Data is successfully inserted!");
response.sendRedirect("sucess.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
response.sendRedirect("failed.jsp");
}
%>