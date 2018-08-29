<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%
    String a = request.getParameter("username");
    String b = request.getParameter("password");
    String c = request.getParameter("type");
    String d = request.getParameter("role");
    String host = "jdbc:mysql://localhost:3306/lgu_paeis_db";
    Connection conn = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null && c!=null && d!=null)
    {
        conn = DriverManager.getConnection(host,"root","");
        String data = "insert into lgu_r_user(U_USERNAME,U_PASSWORD,U_TYPE,U_ROLE) values (?,?,?,?)";
        stat = conn.prepareStatement(data);
        stat.setString(1,a);
        stat.setString(2,b);
        stat.setString(3,c);
        stat.setString(4,d);
        stat.executeUpdate();
        response.sendRedirect("DivSAUserManagement.jsp");
    }
%>