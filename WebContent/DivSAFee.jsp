<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>PAEIS | Fees Configuration</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <link href="assets/css/style.min.css" rel="stylesheet" />
    <link href="assets/css/style-responsive.min.css" rel="stylesheet" />
    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-wizard/css/bwizard.min.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="DivSAComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li>Configurables</li>
            <li class="active">Fees</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Fees Configuration</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
            <!-- begin panel -->
            <div class="panel panel-inverse panel-danger">
                <div class="panel-heading">
                    <h4 class="panel-title">Fees</h4>
                </div>
                <div class="panel-body">
                    <a href="#modal-adduser" class="btn btn-sm btn-primary" data-toggle="modal">Add Fee</a>
                </div>
                <div class="panel-body">
                    <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                        <thead>
                        <tr>
                            <th>Fees Code</th>
                            <th>Fees Name</th>
                            <th>Amount</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%
                                String host = "jdbc:mysql://localhost:3306/lgu_paeis_db";
                                Connection conn = null;
                                Statement stat = null;
                                ResultSet res = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection(host,"root","");
                                stat = conn.createStatement();
                                String data = "select * from lgu_r_fees order by FEES_PK desc";
                                res = stat.executeQuery(data);
                                while (res.next())
                                {
                            %>
                                    <tr>
                                        <td><%=res.getString("FEES_CODE")%></td>
                                        <td><%=res.getString("FEES_NAME")%></td>
                                        <td><%=res.getString("AMOUNT")%></td>
                                        <td>
                                            <a href="DivSAFeeUpdate.jsp?u=<%=res.getString("FEES_PK")%>" class="btn btn-success">Edit</a>
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
                            <h4 class="panel-title">Add Fee</h4>
                        </div>
                        <div class="panel-body">
                            <form action="DivSAFeeInsert.jsp" method="POST">

                                    <div>
                                        <fieldset>
                                            <legend class="pull-left width-full">Fee</legend>
                                            <!-- begin row -->
                                            <div class="row">

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Fee Code</label>
                                                        <div class="controls">
                                                            <input type="text" name="feecode" placeholder="Fee Code" class="form-control" required/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Fee Name</label>
                                                        <div class="controls">
                                                            <input type="text" name="feename" placeholder="Fee Name" class="form-control" required/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Amount</label>
                                                        <div class="controls">
                                                            <input type="text" name="feeamo" placeholder="Amount" class="form-control" required/>
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

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<jsp:include page="DivSAFooter.jsp"></jsp:include>

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
    $(document).ready(function() {
        App.init();
        TableManageResponsive.init();
        FormWizard.init();
    });
</script>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-53034621-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
</html>