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
        <li class="has-sub">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-gears"></i>
                <span>Setup</span>
            </a>
            <ul class="sub-menu">
                <li><a href="RPTSetupPprtyType.jsp">Property Type</a></li>
                <li><a href="RPTSetupPprtyClass.jsp">Property Class</a></li>
                <li><a href="RPTSetupAmentLvls.jsp">Assessment Levels</a></li>
                <li><a href="RPTSetupActUse.jsp">Actual Use</a></li>
                <li><a href="RPTSetupMrktValLnd.jsp">Market Value (Land)</a></li>
                <li><a href="RPTSetupMrktValBldng.jsp">Market Value (Building)</a></li>
                <li><a href="RPTSetupMrktValAgrl.jsp">Market Value (Agricultural)</a></li>
            </ul>
        </li>
        <li><a href="RPTTaxDec.jsp"><i class="fa fa-check-square-o"></i> <span>Tax Declaration</span></a></li>
        <li><a href="RPTTaxBill.jsp"><i class="fa fa-money"></i> <span>Tax Bill</span></a></li>
    </ul>
    <!-- end top-menu nav -->
</div>
<!-- end #top-menu -->
