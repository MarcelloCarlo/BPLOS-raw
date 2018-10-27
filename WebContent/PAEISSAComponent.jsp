<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!-- begin #header -->
<div id="header" class="header navbar navbar-default navbar-fixed-top">
    <!-- begin container-fluid -->
    <div class="container-fluid">
        <!-- begin mobile sidebar expand / collapse button -->
        <div class="navbar-header">
            <img src="extras/logo1.png" style="width:30px;height:30px;"> PAEIS</a>
        </div>
        <!-- end mobile sidebar expand / collapse button -->

        <!-- begin header navigation right -->
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown navbar-user">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <img src="assets/img/user-13.jpg" alt=""/>
                    <span class="hidden-xs">Sample User</span> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu animated fadeInLeft">
                    <li class="arrow"></li>
                    <li><a href="javascript:;">Log Out</a></li>
                </ul>
            </li>
        </ul>
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
                <%--<li><a href="PAEISSAMdle.jsp">Module</a></li>--%>
            </ul>
        </li>
        <li class="has-sub">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-text"></i>
                <span>Reports</span>
            </a>
            <ul class="sub-menu">
                <li><a href="">Termination Reports</a></li>
                <li><a href="">Accomplishment Reports</a></li>
                <li><a href="PAEISSAAdtLgs.jsp">Audit Logs</a></li>
            </ul>
        </li>
    </ul>
    <!-- end top-menu nav -->
</div>
<!-- end #top-menu -->

