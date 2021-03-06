<%--
  Created by IntelliJ IDEA.
  User: jcgutierrez0102
  Date: 4/5/19
  Time: 12:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <link rel="icon" href="extras/logo1.png">
    <title>RPT | All Tax Bills</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="icon" href="extras/logo1.png">

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
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
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<%
    try {
        LGUConnect connect = new LGUConnect();
        Connection connection = connect.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM rpt_t_rp_land LN JOIN rpt_t_rp_owner rtro on LN.RPO_ID = rtro.RPO_ID JOIN rpt_r_actual_use rrau on LN.AU_ID = rrau.AU_ID JOIN rpt_r_property_class rrpc on LN.PC_ID = rrpc.PC_ID JOIN rpt_r_property_type rrpt on LN.PT_ID = rrpt.PT_ID JOIN rpt_t_assessment rta on LN.RPL_ID = rta.RPL_ID JOIN rpt_t_taxbill rtt on LN.RPL_ID = rtt.RPL_ID WHERE RPL_STAT = 'TAXBILL' OR RPL_STAT = 'RECEIPT' ");
%>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="RPTComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li>RPT</li>
            <li class="active">Tax Bills</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">List of Tax Bills</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">Tax Bills</h4>
                    </div>
                    <%--<div class="panel-body">--%>
                    <%--<a href="#modal-adduser" class="btn btn-sm btn-primary" data-toggle="modal">Add Fee</a>--%>
                    <%--</div>--%>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                            <thead>
                            <tr>
                                <th>Property Type</th>
                                <th>Property Class</th>
                                <th>Actual Use</th>
                                <th>Property Area</th>
                                <th>Owner</th>
                                <th>Assess Property</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%while (resultSet.next()){
                                String taxBill = "location.href='RPTTaxBill.jsp?tb_Id=" + resultSet.getString("RPTTB_ID")+ "&taxBillNo="+resultSet.getString("RPTTB_BILL_NO")+"'";
                                String receipt = "location.href='PAEISOfclRcp.jsp?tb_Id=" + resultSet.getString("RPTTB_ID")+"'";
                                String actif = "";
                                String passif = "disabled";
                                if(!resultSet.getString("RPL_STAT").equalsIgnoreCase("RECEIPT")){
                                    actif = "disabled";
                                    passif = "";

                                }
                            %>
                            <tr>
                                <td><%=resultSet.getString("PT_DESC")%></td>
                                <td><%=resultSet.getString("PC_DESC")%></td>
                                <td><%=resultSet.getString("AU_DESC")%></td>
                                <td><%=resultSet.getString("RPL_AREA")%></td>
                                <td><%=resultSet.getString("RPO_FNAME")+" "+resultSet.getString("RPO_SNAME")%></td>
                                <td>
                                    <button  type="button" onclick="<%=taxBill%>" class="btn btn-sm btn-primary" <%=passif%>>Tax Bill</button>
                                    <button  type="button" onclick="<%=receipt%>" class="btn btn-sm btn-primary" <%=actif%>>Receipt</button>
                                </td>
                            </tr>
                            <%}%>
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
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<jsp:include page="RPTFooter.jsp"></jsp:include>

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
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="assets/plugins/select2/dist/js/select2.min.js"></script>
<script src="assets/plugins/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
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
	});
</script>
</body>
<%} catch (Exception e){
    e.printStackTrace();
}
%>
</html>