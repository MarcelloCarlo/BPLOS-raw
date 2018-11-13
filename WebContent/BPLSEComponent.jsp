<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!-- begin #header -->
<div id="header" class="header navbar navbar-default navbar-fixed-top">
    <!-- begin container-fluid -->
    <div class="container-fluid">
        <!-- begin mobile sidebar expand / collapse button -->
        <div class="navbar-header">
            <a href="#" class="navbar-brand"><span class="navbar-logo"></span> BPLS</a>
            <button type="button" class="navbar-toggle" data-click="top-menu-toggled">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- end mobile sidebar expand / collapse button -->

        <!-- begin header navigation right -->
        <div class="nav navbar-nav navbar-right">
                <label>
                    <span class="hidden-xs"><%
                        if (null != session.getAttribute("empname")) {
                            out.println(session.getAttribute("empname"));
                        }
                    %></span>
                    <a href='LogoutServlet?id=<%=session.getAttribute("empid")%>' class="fa fa-sign-out"></a>
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
        <li><a href="BPLSEIndex.jsp"><i class="fa fa-file-text"></i> <span>Application Processing</span></a></li>
        <li class="has-sub">
            <a href="javascript:;">
                <b class="caret pull-right"></b>
                <i class="fa fa-gears"></i>
                <span>Reports</span>
            </a>
            <ul class="sub-menu">
                <li><a href="BPLSETerReports.jsp"><i class="fa fa-file-excel-o"></i>
                    <span>Termination Reports</span></a></li>
                <li><a href="BPLSEEndReports.jsp"><i class="fa fa-file-excel-o"></i> <span>Evaluated Reports</span></a>
                </li>
                <li><a href="BPLSESSReports.jsp"><i class="fa fa-file-excel-o"></i> <span>Small Scale Reports</span></a>
                </li>
                <li><a href="BPLSELSReports.jsp"><i class="fa fa-file-excel-o"></i> <span>Large Scale Reports</span></a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- end top-menu nav -->
</div>
<!-- end #top-menu -->

