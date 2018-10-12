<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.WeakHashMap" %>
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

    String k = request.getParameter("username");
    String l = request.getParameter("password");
    String n = request.getParameter("udiv");
    Connection conn = null;
    LGUConnect conx = new LGUConnect();
    int epId = 0;
    if (a != null && b != null && c != null && d != null && e != null && f != null && g != null && h != null && i != null && j != null) {
        try {
            conn = conx.getConnection();
            String data = "insert into bpls_t_employee_profile(EP_FNAME,EP_MNAME,EP_LNAME,EP_GENDER,EP_BIRTHDATE,EP_STATUS,EP_JOB_DESC,EP_CONTACT_NO,EP_EMAIL,EP_ADDRESS) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stat = (PreparedStatement) conn.prepareStatement(data);
            stat.setString(1, a);
            stat.setString(2, b);
            stat.setString(3, c);
            stat.setString(4, d);
            stat.setDate(5, Date.valueOf(e));
            stat.setString(6, f);
            stat.setString(7, g);
            stat.setString(8, h);
            stat.setString(9, i);
            stat.setString(10, j);
            stat.executeUpdate();

            PreparedStatement getEmpID = (PreparedStatement) conn.prepareStatement("SELECT MAX(EP_ID) FROM bpls_t_employee_profile");
            ResultSet rsEpId = getEmpID.executeQuery();
            while (rsEpId.next()){
                epId = rsEpId.getInt("EP_ID");
            }

            PreparedStatement setUser = (PreparedStatement) conn.prepareStatement("INSERT INTO bpls_t_user(U_USERNAME, U_PASSWORD, U_ROLE, EP_ID) VALUES (CONCAT(?,?,REPLACE(?,'-','')),CONCAT(REPLACE(?,'-',''),?),?,?)");
            setUser.setString(1,n);
            setUser.setString(2,String.valueOf(epId));
            setUser.setString(3,e);
            setUser.setString(4,e);
            setUser.setString(5,n);
            setUser.setString(6,n);
            setUser.setInt(7,epId);
            setUser.executeUpdate();

            response.sendRedirect("PAEISSAUsrMgmt.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>