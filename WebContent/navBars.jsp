<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="index.jsp" class="site_title">
                <i class="fa fa-building-o"></i> <span>QCPAEIS</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,</span>
                <h2>Ms. Vanjie</h2>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- /menu profile quick info -->

        <br/>

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>Evaluated Forms</h3>
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-bolt"></i> One Stop Shop <span
                            class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="ossSingleForms.jsp"> Single Proprietorship</a></li>
                            <li><a href="index2.html"> Partnership/Corporation</a></li>
                        </ul>
                    </li>
                    <li><a href="bplEvaluation.jsp"><i class="fa fa-clock-o"></i> Evaluation</a></li>
                    <li><a><i class="fa fa-search"></i> Investigation <span class="fa fa-chevron-down"></span></a></li>
                    <li><a><i class="fa fa-upload"></i> Releasing <span class="fa fa-chevron-down"></span></a></li>
                    <li><a href="UserManagement.jsp"><i class="fa fa-users"></i> User Management</a></li>
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

                <li role="presentation" class="dropdown">
                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list"
                        role="menu">
                        <li><a> <span class="image"><img
                                src="images/img.jpg" alt="Profile Image"/></span> <span> <span>John
										Smith</span> <span class="time">3 mins ago</span>
							</span> <span class="message"> Film festivals used to be
									do-or-die moments for movie makers. They were where... </span>
                        </a></li>
                        <li><a> <span class="image"><img
                                src="images/img.jpg" alt="Profile Image"/></span> <span> <span>John
										Smith</span> <span class="time">3 mins ago</span>
							</span> <span class="message"> Film festivals used to be
									do-or-die moments for movie makers. They were where... </span>
                        </a></li>
                        <li><a> <span class="image"><img
                                src="images/img.jpg" alt="Profile Image"/></span> <span> <span>John
										Smith</span> <span class="time">3 mins ago</span>
							</span> <span class="message"> Film festivals used to be
									do-or-die moments for movie makers. They were where... </span>
                        </a></li>
                        <li><a> <span class="image"><img
                                src="images/img.jpg" alt="Profile Image"/></span> <span> <span>John
										Smith</span> <span class="time">3 mins ago</span>
							</span> <span class="message"> Film festivals used to be
									do-or-die moments for movie makers. They were where... </span>
                        </a></li>
                        <li>
                            <div class="text-center">
                                <a> <strong>See All Alerts</strong> <i
                                        class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->
