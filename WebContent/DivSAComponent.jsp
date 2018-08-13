<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="index.jsp" class="site_title">
                <i class="fa fa-building-o"></i> <span>QCPAEIS</span></a>
        </div>

        <div class="clearfix"></div>


        <br/>

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-bolt"></i> System Configurations <span
                            class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="#"> Requirements </a></li>
                            <li><a href="#"> User Roles </a></li>
                        </ul>
                    </li>
                    <li><a href="DivSAUserManagement.jsp"><i class="fa fa-users"></i> User Management </a></li>
                </ul>
            </div>

        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class=""><a href="javascript:;"
                                class="user-profile dropdown-toggle" data-toggle="dropdown"
                                aria-expanded="false"> <img src="images/img.jpg" alt="">Ms.
                    Vanjie <span class=" fa fa-angle-down"></span>
                </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="javascript:;">Help</a></li>
                        <li><a href="login.jsp"><i
                                class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->
