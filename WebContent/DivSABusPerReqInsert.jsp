<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 9/27/2018
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%
    String a = request.getParameter("bnc");
    String b = request.getParameter("req");
//    String c = request.getParameter("bnrc");
    String host = "jdbc:mysql://localhost:3306/lgu_paeis_db";
    Connection conn = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null)
//    if(a!=null && b!=null && c!=null)
    {
        conn = DriverManager.getConnection(host,"root","");
        String data = "insert into lgu_r_buspereq(BPR_BNRC,BPR_REQ) values (?,?)";
//        String data = "insert into lgu_r_business_nature(BN_NAME,BN_CLASSIFICATION,BNR_CODE) values (?,?,?)";
        stat = conn.prepareStatement(data);
        stat.setString(1,a);
        stat.setString(2,b);
//        stat.setString(3,c);
        stat.executeUpdate();
        response.sendRedirect("DivSABusPerReq.jsp");
    }
%>