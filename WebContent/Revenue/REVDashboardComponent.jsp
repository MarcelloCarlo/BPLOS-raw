<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/10/2018
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!-- begin #header -->
<div id="header" class="header navbar navbar-default navbar-fixed-top">
    <!-- begin container-fluid -->
    <div class="container-fluid">
        <!-- begin mobile sidebar expand / collapse button -->
        <div class="navbar-header">
            <a class="navbar-brand">
                <span>
                    <img src="extras/icon.png" alt="" style="margin-top: -5px"/>
                </span>
                Revenue
            </a>
        </div>
        <!-- end mobile sidebar expand / collapse button -->

        <!-- begin header navigation right -->
        <div class="nav navbar-nav navbar-right">
            <label style="margin-top: 20px;margin-right: 5px">
                <span class="hidden-xs">
                    <%
                        if (null != session.getAttribute("empname")) {
                            out.println(session.getAttribute("empname"));
                        }
                    %>
                </span>

            </label>
        </div>
        <!-- end header navigation right -->
    </div>
    <!-- end container-fluid -->
</div>
<!-- end #header -->

<!-- begin #top-menu -->
<div id="top-menu" class="top-menu">
    <!-- begin top-menu nav -->
    <ul class="nav">
        <li>
            <a href="REVDashboard.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
        </li>
        <li class="has-sub">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-text"></i>
                <span>BPLS Reports</span>
            </a>
            <ul class="sub-menu">
                <li><a href="BPLSETerReports.jsp"><span>Evaluation Termination Reports</span></a></li>
                <li><a href="BPLSEEndReports.jsp"><span>Evaluated Reports</span></a></li>
                <li><a href="BPLSESSReports.jsp"><span>Small Scale Reports</span></a></li>
                <li><a href="BPLSELSReports.jsp"><span>Large Scale Reports</span></a></li>
                <li><a href="BPLSIPReports.jsp"><span>Inspection Termination Reports</span></a></li>
                <li><a href="BPLSIVReports.jsp"><span>Investigation Termination Reports</span></a></li>
                <li><a href="BPLSTReports.jsp"><span>Treasury Reports</span></a></li>
                <li><a href="BPLSRSAcmplReports.jsp"><span>Accomplishment Reports</span></a></li>
            </ul>
        </li>
        <li class="has-sub">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-text"></i>
                <span>MTOPS Reports</span>
            </a>
            <ul class="sub-menu">
                <li><a href="MTOPSTREReports.jsp"><span>Treasury Reports</span></a></li>
                <li><a href="MTOPSAcomReports.jsp"><span>Accomplishment Reports</span></a></li>
            </ul>
        </li>
        <li class="has-sub">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-text"></i>
                <span>RPT Reports</span>
            </a>
            <ul class="sub-menu">
                <li><a href="MTOPSTREReports.jsp"><span>Treasury Reports</span></a></li>
                <li><a href="MTOPSAcomReports.jsp"><span>Accomplishment Reports</span></a></li>
            </ul>
        </li>
        <li class="has-sub pull-right">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-text"></i>
                <span>Account Settings</span>
            </a>
            <ul class="sub-menu">
                <li><a href='PAEISAccMngmt.jsp?Id=<%=session.getAttribute("empid")%>'><span>Change Password</span></a></li>
                <li><a href='LogoutServlet?id=<%=session.getAttribute("empid")%>'><span>Log Out</span></a></li>
            </ul>
        </li>
    </ul>
    <!-- end top-menu nav -->
</div>
<!-- end #top-menu -->

