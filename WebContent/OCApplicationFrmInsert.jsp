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
    String a = request.getParameter("afname");
    String b = request.getParameter("amname");
    String c = request.getParameter("alname");

    String d = request.getParameter("aaddre");
    String e = request.getParameter("abday");
    String f = request.getParameter("asex");
    String g = request.getParameter("acstat");
    String h = request.getParameter("acomp");
    String i = request.getParameter("aworkplace");
    String j = request.getParameter("acedula");
    String k = request.getParameter("anbi");
    String l = request.getParameter("ahealth");
    String m = request.getParameter("acnum");

    String n = request.getParameter("ajdesc");
    String o = request.getParameter("areq");


    String host = "jdbc:mysql://localhost:3306/lgu_paeis_db";
    Connection conn = null;
    PreparedStatement stat = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    if(a!=null && b!=null)
//    if(a!=null && b!=null && c!=null)
    {
        conn = DriverManager.getConnection(host,"root","");
 //       String data = "insert into oc_t_application_frm (,BN_CLASSIFICATION) values (?,?)";
       String data = "insert into oc_t_application_frm(`OAF_FNAME`, `OAF_MNAME`, `OAF_LNAME`, `OAF_ADDRESS`, `OAF_BIRTHDATE`, `OAF_SEX`, `OAF_CIVIL_STATUS`, `OAF_COMPANY`, `OAF_PLC_ASSIGNED`, `OAF_CEDULA_NO`, `OAF_NBI_POLICE_CLR`, `OAF_HEALTH_RCPT_NO`, `OAF_CONTACT_NO`, `JD_ID, `OAF_UNIFIED_FILE`, `OAF_UNIFIED_FILE_NAME`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
        stat.setString(11,k);
        stat.setString(12,l);
        stat.setString(13,m);
        stat.setString(14,n);
        stat.setString(15,o);
        stat.executeUpdate();
        response.sendRedirect("OCApplicationFrm.jsp");
    }
%>