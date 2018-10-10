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
    String d = request.getParameter("gender");
    String e = request.getParameter("bdate");
    String f = request.getParameter("status");
    String g = request.getParameter("jobdesc");
    String h = request.getParameter("contact");
    String i = request.getParameter("email");
    String j = request.getParameter("home");
//    String k = request.getParameter("username");
//    String l = request.getParameter("password");
//    String m = request.getParameter("urole");
//    String n = request.getParameter("udiv");
    String host = "jdbc:mysql://localhost:3306/lgu_paeis_db";
    Connection conn = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null && j!=null)
    {
        conn = DriverManager.getConnection(host,"root","");
        String data = "insert into bpls_r_employee_profile(EP_FNAME,EP_MNAME,EP_LNAME,EP_GENDER,EP_BIRTHDATE,EP_STATUS,EP_JOB_DESC,EP_CONTACT_NO,EP_EMAIL,EP_ADDRESS) values (?,?,?,?,?,?,?,?,?,?)";
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
        response.sendRedirect("PAEISSAUsrMgmt.jsp");
    }
%>