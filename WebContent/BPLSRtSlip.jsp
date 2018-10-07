<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: John Carlo Villar
  Date: 09/23/2018
  Time: 05:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% LGUConnect conX = new LGUConnect();
    try {
        Connection connection = conX.getConnection();
        String refNo= request.getParameter("refNo");
        PreparedStatement getAssess = connection.prepareStatement("SELECT * FROM view_routeslip WHERE AP_REFERENCE_NO = ?");
        getAssess.setString(1,refNo);
        ResultSet rs = getAssess.executeQuery();
        while (rs.next()){%>
<html>
<head>
    <title>BPLS | Route Slip</title>

    <meta
            http-equiv="Content-Type"
            content="text/html; charset=UTF-8"
    >
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta
            http-equiv="X-UA-Compatible"
            content="IE=edge"
    >
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
    >
    <meta charset="ISO-8859-1">
    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <%-- <link
             href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
             rel="stylesheet"
     >--%>
    <link
            href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/plugins/font-awesome/css/font-awesome.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/css/animate.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/css/style.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/css/style-responsive.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/css/theme/default.css"
            rel="stylesheet"
            id="theme"
    />
    <!-- ================== END BASE CSS STYLE ================== -->
    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link
            href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css"
            rel="stylesheet"
    />
    <!-- ================== END PAGE LEVEL STYLE ================== -->
    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
    <!-- clippy -->
    <!-- <link href="assets/plugins/smore-inc-clippy.js/build/clippy.css"
        rel="stylesheet"> -->
</head>
<body>
<jsp:include page="BPLSRtSlipComponent.jsp"/>
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <%--<ol class="breadcrumb pull-right">--%>
            <%--<li><a href="javascript:;">System Admin</a></li>--%>
            <%--<li class="active">User Management</li>--%>
        <%--</ol>--%>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <%--<h1 class="page-header">User Management</h1>--%>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">Route Slip</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <h5>Business Name/Corporate Name: <label><%out.print(rs.getString("BU_NAME"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Name of Sole Proprietor/Partnership/President: <label><%out.print(rs.getString("BU_PRESIDENT"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Business Address: <label><%out.print(rs.getString("BU_LOCATION"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Tel No.: <label><%out.print(rs.getString("BU_LOCATION"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Authorized Representative: <label><%out.print(rs.getString("TP_FNAME"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Address: <label><%out.print(rs.getString("TP_HOME_ADDRESS"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Business Nature: <label><%out.print(rs.getString("BN_NAME"));%></label></h5>
                        </div>
                    </div>

                    <hr>

                    <div class="panel-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Reference Number</th>
                                <th>Status</th>
                                <th>Phase</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td><%out.print(rs.getString("AP_REFERENCE_NO"));%></td>
                                <td><%out.print(rs.getString("AP_STATUS"));%></td>
                                <td><%out.print(rs.getString("AP_DIV_CODE_TO"));%></td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end panel -->
            </div>
        </div>
    </div>
    <!-- end #content -->



    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%}}catch(SQLException | ClassNotFoundException e){
    out.print(e);
}%>
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