<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>PAEIS | User Management</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="assets/css/animate.min.css" rel="stylesheet"/>
    <link href="assets/css/style.min.css" rel="stylesheet"/>
    <link href="assets/css/style-responsive.min.css" rel="stylesheet"/>
    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme"/>
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-wizard/css/bwizard.min.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="PAEISSAComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li><a href="javascript:;">System Admin</a></li>
            <li class="active">User Management</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">User Management</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success"
                               data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                        </div>
                        <h4 class="panel-title">Users Table</h4>
                    </div>
                    <div class="panel-body">
                        <a href="#modal-adduser" id="addUserbtn" class="btn btn-sm btn-primary" data-toggle="modal">Add User</a>
                    </div>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                            <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Username</th>
                                <th>User Type</th>
                                <th>Department</th>
                                <th>User Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                LGUConnect conX = new LGUConnect();
                                Connection conn3 = conX.getConnection();
                                Statement ss3 = conn3.createStatement();
                                ResultSet res = ss3.executeQuery("select * from lgu_r_user order by U_ID desc");
                                while (res.next()) {
                            %>
                            <tr>
                                <td><%=res.getString("U_FIRSTNAME")%>
                                </td>
                                <td><%=res.getString("U_USERNAME")%>
                                </td>
                                <td><%=res.getString("U_TYPE")%>
                                </td>
                                <td><%=res.getString("U_ROLE")%>
                                </td>
                                <td><%=res.getString("U_STATUS")%>
                                </td>
                                <%--<td>--%>
                                <%--<a href="#" class="btn btn-success btn-xs">Edit</a>--%>
                                <%--</td>--%>
                                <td>
                                    <a href="PAEISSAUsrUpdate.jsp?u=<%=res.getString("U_ID")%>" class="btn btn-success">Edit</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end panel -->
            </div>
        </div>
    </div>
    <!-- end #content -->

    <!-- #modal-adduser -->
    <div class="modal fade" id="modal-adduser">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Add User</h4>
                        </div>
                        <div class="panel-body">
                            <form action="PAEISSAUsrInsert.jsp" method="POST">
                                <div id="wizard">
                                    <ol>
                                        <li>
                                            Identification
                                        </li>
                                        <li>
                                            Contact Information
                                        </li>
                                        <li>
                                            Login Information
                                        </li>
                                    </ol>
                                    <!-- begin wizard step-1 -->
                                    <div>
                                        <fieldset>
                                            <legend class="pull-left width-full">Identification</legend>
                                            <!-- begin row -->
                                            <div class="row">

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>First Name</label>
                                                        <input type="text" name="firstname" placeholder="First Name"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Middle Name</label>
                                                        <input type="text" name="middle" placeholder="Middle Name"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <input type="text" name="lastname" placeholder="Last Name"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Gender</label>
                                                        <div class="controls">
                                                            <select name="gender" class="form-control">
                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Birthdate</label>
                                                        <input type="text" name="bdate" placeholder="Birthdate"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                        <input type="text" name="status" placeholder="Status"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Job Description</label>
                                                        <input type="text" name="jobdesc" placeholder="Job Description"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>


                                            </div>
                                    <!-- end row -->
                                    </fieldset>
                                </div>
                                <!-- end wizard step-1 -->
                                <!-- begin wizard step-2 -->
                                <div>
                                    <fieldset>
                                        <legend class="pull-left width-full">Contact Information</legend>
                                        <!-- begin row -->
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Contact Number</label>
                                                    <input type="text" name="contact" placeholder="123-456-7890"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Email Address</label>
                                                    <input type="text" name="email" placeholder="someone@example.com"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" name="home" placeholder="Current Address"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- end row -->
                                    </fieldset>
                                </div>
                                <!-- end wizard step-2 -->
                                <!-- begin wizard step-3 -->
                                <div>
                                    <fieldset>
                                        <legend class="pull-left width-full">Login</legend>
                                        <!-- begin row -->
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Username</label>
                                                    <div class="controls">
                                                        <input type="text" name="username" placeholder="Your username"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Pasword</label>
                                                    <div class="controls">
                                                        <input type="password" name="password"
                                                               value="Bplo_user111" class="form-control"
                                                               disabled/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>User Role</label>
                                                    <div class="controls">
                                                        <select name="urole" class="form-control">
                                                            <%
                                                                LGUConnect con = new LGUConnect();
                                                                Connection con1 = con.getConnection();
                                                                Statement aa = con1.createStatement();
                                                                ResultSet ss = aa.executeQuery("SELECT * FROM `lgu_r_role`");
                                                                while (ss.next()){
                                                            %>
                                                            <option value="<%out.print(ss.getInt("ROLE_ID"));%>">
                                                                <%out.print(ss.getString("ROLE_NAME"));%>
                                                            </option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Division</label>
                                                    <div class="controls">
                                                        <select name="udiv" class="form-control">
                                                            <%
                                                                LGUConnect conn = new LGUConnect();
                                                                Connection conn1 = conn.getConnection();
                                                                Statement aaa = conn1.createStatement();
                                                                ResultSet sss = aaa.executeQuery("SELECT * FROM `lgu_r_division`");
                                                                while (sss.next()){
                                                            %>
                                                            <option value="<%out.print(sss.getInt("DIV_ID"));%>">
                                                                <%out.print(sss.getString("DIV_NAME"));%>
                                                            </option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <br>

                                        <div class="modal-footer">
                                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-sm btn-success">Add</button>
                                        </div>
                                        <!-- end row -->
                                    </fieldset>
                                </div>
                                <!-- end wizard step-3 -->
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- begin scroll to top btn -->
<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
        class="fa fa-angle-up"></i></a>
<!-- end scroll to top btn -->
</div>
<!-- end page container -->

<jsp:include page="PAEISSAFooter.jsp"></jsp:include>

<!-- ================== BEGIN BASE JS ================== -->
<script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script src="assets/crossbrowserjs/html5shiv.js"></script>
<script src="assets/crossbrowserjs/respond.min.js"></script>
<script src="assets/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
<script src="assets/js/form-wizards.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script>
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();
        FormWizard.init();
        /*$("#addUserbtn").click( function () {
            var ok = "ok";
            $.ajax({
                type: "POST",
                url: "generateDivisions",
                data: {ok:ok},
                success: function(response){
                    $("#role").append(response)
                }
            });
        })*/
    });
</script>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-53034621-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
</html>