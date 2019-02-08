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
                 PAEIS
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
        <%--<li><a href="PAEISSAIndex.jsp"><i class="fa fa-calendar"></i> <span>Records</span></a></li>--%>
        <li>
            <a href="PAEISSAUsrMgmt.jsp"><i class="fa fa-users"></i> <span>User Management</span></a>
        </li>
        <li class="has-sub">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-gears"></i>
                <span>Configurables</span>
            </a>
            <ul class="sub-menu">
                <li><a href="PAEISSAFee.jsp">Fees</a></li>
                <li><a href="PAEISSAReq.jsp">Requirements</a></li>
                <li><a href="PAEISSADvsion.jsp">Division</a></li>
                <li><a href="PAEISSABusNat.jsp">Business Nature</a></li>
                <li><a href="PAEISSAToda.jsp">TODA</a></li>
            </ul>
        </li>
        <li class="has-sub">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-text"></i>
                <span>Reports</span>
            </a>
            <ul class="sub-menu">
                <li><a href="PAEISSATermRep.jsp">Termination Reports</a></li>
                <li><a href="PAEISSAAccomRep.jsp">Accomplishment Reports</a></li>
                <li><a href="PAEISSAAdtLgs.jsp">Audit Logs</a></li>
            </ul>
        </li>
    </ul>
    <!-- end top-menu nav -->
</div>
<!-- end #top-menu -->

