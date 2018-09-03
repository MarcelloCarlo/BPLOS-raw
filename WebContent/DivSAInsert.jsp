<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%
    String a = request.getParameter("firstname");
    String b = request.getParameter("middle");
    String c = request.getParameter("lastname");
    String d = request.getParameter("type");
    String e = request.getParameter("role");
    String f = request.getParameter("phone");
    String g = request.getParameter("email");
    String h = request.getParameter("home");
    String i = request.getParameter("username");
    String j = request.getParameter("password");
    String host = "jdbc:mysql://localhost:3306/lgu_paeis_db";
    Connection conn = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null && j!=null)
    {
        conn = DriverManager.getConnection(host,"root","");
        String data = "insert into lgu_r_user(U_FIRSTNAME,U_MIDDLENAME,U_LASTNAME,U_TYPE,U_ROLE,U_PHONE,U_EMAIL,U_ADDRESS,U_USERNAME,U_PASSWORD) values (?,?,?,?,?,?,?,?,?,?)";
        stat = conn.prepareStatement(data);
        stat.setString(1,a);
        stat.setString(2,b);
        stat.setString(3,c);
        stat.setString(4,d);
        stat.setString(5,e);
        stat.setString(6,f);
        stat.setString(7,g);
        stat.setString(8,h);
        stat.setString(9,i);
        stat.setString(10,j);
        stat.executeUpdate();
        response.sendRedirect("DivSAUserManagement.jsp");
    }
%>