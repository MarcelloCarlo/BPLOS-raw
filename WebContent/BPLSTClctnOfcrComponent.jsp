<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/26/2018
  Time: 11:27 AM
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
                BPLS
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
                <a href='LogoutServlet?id=<%=session.getAttribute("empid")%>'  style="color: black;" class="fa fa-sign-out"></a>
                <a href='LogoutServlet?id=<%=session.getAttribute("empid")%>'  style="color: black;">Log Out</a>
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
        <li><a href="BPLSTClctnOfcr.jsp"><i class="fa fa-money"></i> <span>Payment Audit</span></a></li>
    </ul>
    <!-- end top-menu nav -->
</div>
<!-- end #top-menu -->

