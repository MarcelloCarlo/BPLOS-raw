<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%
    String a = request.getParameter("feename");
    String b = request.getParameter("feeamo");
    String host = "jdbc:mysql://localhost:3306/lgu_paeis_db";
    Connection conn = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if (a != null && b != null) {
        conn = DriverManager.getConnection(host, "root", "");
        String data = "insert into bpls_r_fee_list(FL_NAME,FL_AMOUNT) values (?,?)";
        stat = conn.prepareStatement(data);
        stat.setString(1, a);
        stat.setString(2, b);
        stat.executeUpdate();
        response.sendRedirect("PAEISSAFee.jsp");
    }
%>