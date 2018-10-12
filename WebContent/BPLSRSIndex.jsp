<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<%
    LGUConnect conX = new LGUConnect();
    try {
        Connection conn = conX.getConnection();
        PreparedStatement getReltbl = (PreparedStatement) conn.prepareStatement("SELECT * FROM view_applicationformsrel");
        ResultSet rsRel = getReltbl.executeQuery();
        PreparedStatement getEmp = (PreparedStatement) conn.prepareStatement("SELECT * FROM bpls_t_employee_profile");
        ResultSet rsEmp = getEmp.executeQuery();
%>
<head>
    <meta charset="utf-8"/>
    <title>BPLS | Releasing</title>
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
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="BPLSRSComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li><a href="javascript:;">Releasing</a></li>
            <li class="active">Permit Processing</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Permit Processing</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">Permit Processing Table</h4>
                    </div>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                            <thead>
                            <tr>
                                <th>Reference Number</th>
                                <th>Business Name</th>
                                <th>Business Nature</th>
                                <th>Taxpayer Name</th>
                                <th>Date Billed</th>
                                <th class="hide">TB_ID</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%while (rsRel.next()) {%>
                            <tr>
                                <td><%=rsRel.getString("AP_REFERENCE_NO")%>
                                </td>
                                <td><%=rsRel.getString("BU_NAME")%>
                                </td>
                                <td><%=rsRel.getString("BN_NAME")%>
                                </td>
                                <td><%=rsRel.getString("TP_NAME")%>
                                </td>
                                <td><%=rsRel.getString("TB_DATE_BILLED")%>
                                </td>
                                <td class="hide"><%=rsRel.getInt("TB_ID")%>
                                </td>
                                <td>
                                    <button
                                            type="button"
                                            class="btn btn-success modalRel"
                                            data-toggle="modal"
                                            data-target="#modal-processpayment" title="Release of Business Permit"
                                    ><i class="fa fa-lg fa-paper-plane-o"></i>
                                    </button>
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

    <!-- #modal-processpayment -->
    <div class="modal fade" id="modal-processpayment">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Paid Permit</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="relApplForm" name="relApplForm">
                        <input type="text" id="AP_REF" name="AP_REF" class="hide">
                        <input type="text" name="tbId" id="tbId" class="hide">
                        <div class="panel-body col-md-12">
                            <h5>Reference Number: <label class="control-label" id="rRefno"></label></h5>

                            <h5>Business Name: <label class=" control-label" id="rBuNa"></label></h5>

                            <h5>Business Nature: <label class=" control-label" id="rBuN"></label></h5>

                            <h5>Taxpayer Name: <label class=" control-label" id="rTPN"></label></h5>

                            <h5>Date Billed: <label class="control-label" id="rDB"></label></h5>
                        </div>
                        <div class="panel-body">
                           <label class="col-md-4 control-label">Treasurer: </label>
                            <div class="col-md-5">
                                <select name="optTreasurer" class="form-control" data-style="btn-white"
                                        tabindex="-1">
                                    <%while (rsEmp.next()) {%>
                                    <option data-subtext="<%=rsEmp.getString("EP_JOB_DESC")%>"
                                            title="<%=rsEmp.getString("EP_JOB_DESC")%>"
                                            value="<%=rsEmp.getInt("EP_ID")%>">
                                            <%out.print(rsEmp.getString("EP_FNAME") + " " + rsEmp.getString("EP_MNAME")+ " " + rsEmp.getString("EP_LNAME"));%></option>
                                        <%} rsEmp.close();%>
                                </select>
                            </div>
                            </div>
                <div class="panel-body">
                    <div class="col-md-12">
											<textarea
                                                    class="form-control"
                                                    placeholder="Remarks"
                                                    id="txtMISC_REMARKS"
                                                    name="AP_REMARKS"
                                                    rows="2"
                                            ></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                    <button type="button" id="btnRelNewAppl" class="btn btn-sm btn-success">Process</button>
                </div>
                </form>
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

<jsp:include page="BPLSRSFooter.jsp"></jsp:include>

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
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/divReleasing.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
<%
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>
</html>