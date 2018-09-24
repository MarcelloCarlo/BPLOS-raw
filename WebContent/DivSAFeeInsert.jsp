<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%
    String a = request.getParameter("feecode");
    String b = request.getParameter("feename");
    String c = request.getParameter("feeamo");
    String host = "jdbc:mysql://localhost:3306/lgu_qcpa_eis_db";
    Connection conn = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null && c!=null)
    {
        conn = DriverManager.getConnection(host,"root","");
        String data = "insert into lgu_r_fees(FEES_CODE,FEES_NAME,AMOUNT) values (?,?,?)";
        stat = conn.prepareStatement(data);
        stat.setString(1,a);
        stat.setString(2,b);
        stat.setString(3,c);
        stat.executeUpdate();
        response.sendRedirect("DivSAFee.jsp");
    }
%>