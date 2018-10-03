<%@ page import="java.sql.*" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>PAEIS | Treasury</title>
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
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="DivTComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li><a href="javascript:;">Treasury</a></li>
            <li class="active">Payment Processing</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Payment Processing</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">Payment Processing Table</h4>
                    </div>
                    <div class="panel-body">
                        <table
                                id="data-table"
                                class="table table-striped table-bordered nowrap"
                                width="100%"
                        >
                            <thead>
                            <tr>
                                <th>Business Name</th>
                                <th>Business Nature</th>
                                <th>Ownership Type</th>
                                <th>Application Type</th>
                                <th>Status</th>
                                <th>Date Received</th>
                                <th>President/Representative</th>
                                <th>Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                                <th class="hide">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                LGUConnect conX = new LGUConnect();
                                try {
                                    Connection conn3 = conX.getConnection();
                                    Statement ss3 = conn3.createStatement();
                                    ResultSet gg3 = ss3.executeQuery("SELECT * FROM `view_applicationformstre`");
                                    while (gg3.next()) {
                                        String apType = gg3.getString("AP_TYPE");
                                        String modalMode = "";
                                        String modalClass = "";
                                        if (apType.equals("New")) {
                                            modalMode = ".investigation-modal-new";
                                            modalClass = "newModal";
                                        } else if (apType.equals("Renew")) {
                                            modalMode = ".investigation-modal-renew";
                                            modalClass = "renewModal";
                                        } else {
                                            modalMode = ".investigation-modal-new";
                                        }
                            %>
                            <tr>
                                <td><%=gg3.getString("BU_NAME")%>
                                </td><!--0-->
                                <td><%=gg3.getString("BN_NAME")%>
                                </td><!--1-->
                                <td><%=gg3.getString("OT_NAME")%>
                                </td><!--2-->
                                <td><%=apType%>
                                </td><!--3-->
                                <td><%=gg3.getString("AP_STATUS")%>
                                </td>
                                <td><%=gg3.getString("AP_DATE")%>
                                </td><!--5-->
                                <td><%=gg3.getString("BU_PRESIDENT")%>
                                </td>
                                <td class="hide"><%=gg3.getString("TAX_PAYERNAME")%>
                                </td>
                                <td class="hide"><%=gg3.getString("BU_LOCATION")%>
                                </td>
                                <td class="hide"><%=gg3.getString("BU_CONTACT")%>
                                </td>
                                <td class="hide"><%=gg3.getString("AUTH_REPNAME")%>
                                </td><!--10-->
                                <td class="hide"><%=gg3.getString("AR_HOME_ADDRESS")%>
                                </td>
                                <td class="hide"><%=gg3.getString("BN_NAME")%>
                                </td>
                                <td id="AP_REFERENCE_NO" class="hide"><%=gg3.getString("AP_REFERENCE_NO")%>
                                </td>
                                <td>
                                    <button
                                            type="button"
                                            class="btn btn-success <%=modalClass%>"
                                            data-toggle="modal"
                                            data-target="<%=modalMode%>" title="Comply for the Inspection"
                                    ><i class="fa fa-lg fa-list-ul"></i>
                                    </button>
                                </td>
                                <td class="hide"><%=gg3.getString("ZONING_INS")%>
                                </td><!--15-->
                                <td class="hide"><%=gg3.getString("FIRE_INS")%>
                                </td>
                                <td class="hide"><%=gg3.getString("HEALTH_SANITATION_INS")%>
                                </td>
                                <td class="hide"><%=gg3.getString("BUILDING_INS")%>
                                </td>
                                <td class="hide"><%=gg3.getString("LABOR_INS")%>
                                </td>
                                <td class="hide"><%=gg3.getString("MISC_INS")%>
                                </td>
                                <td class="hide"><%=gg3.getString("INS_REMARKS")%>
                                </td>
                            </tr>
                            <%
                                    }}catch(SQLException | ClassNotFoundException e){
                                    out.print(e);
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

    <!-- #modal-processpayment -->
    <div class="modal fade" id="modal-processpayment">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Process Payment</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="#" method="POST">
                        <div class="form-group">
                            <label class="col-md-4 control-label">Reference Number: </label>
                            <div class="col-md-8">
                                <input type="text" name=" " class="form-control" placeholder="/Reference Number/" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Business Owner: </label>
                            <div class="col-md-8">
                                <input type="text" name=" " class="form-control" placeholder="/Business Owner Name/" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Business Name: </label>
                            <div class="col-md-8">
                                <input type="text" name=" " class="form-control" placeholder="/Business Name/" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Fee: </label>
                            <div class="col-md-8">
                                <input type="text" name=" " class="form-control" placeholder="/Fee/" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-sm btn-success">Process</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<jsp:include page="DivTFooter.jsp"></jsp:include>

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
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    $(document).ready(function() {
        App.init();
        TableManageResponsive.init();
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