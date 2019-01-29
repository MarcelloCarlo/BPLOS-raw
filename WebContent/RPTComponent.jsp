<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 1/29/2019
  Time: 9:15 AM
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
                <a href='LogoutServlet?id=<%=session.getAttribute("empid")%>' class="fa fa-sign-out" style="color: black">Log Out</a>
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
        <li><a href="RPTReg.jsp"><i class="fa fa-file-text-o"></i> <span>Registration</span></a></li>
        <li><a href="RPTAment.jsp"><i class="fa fa-check-square-o"></i> <span>Assessment</span></a></li>
        <li><a href="RPTTaxBill.jsp"><i class="fa fa-money"></i> <span>Tax Bill</span></a></li>
    </ul>
    <!-- end top-menu nav -->
</div>
<!-- end #top-menu -->
