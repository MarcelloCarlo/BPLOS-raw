<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 27 Mar 2019
  Time: 10:17 PM
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
    <title>RPT | Tax</title>
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
        Float flRate = Float.valueOf(0);
        LGUConnect connect = new LGUConnect();
        Connection connection = connect.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM rpt_t_rp_land LN JOIN rpt_t_rp_owner rtro on LN.RPO_ID = rtro.RPO_ID JOIN rpt_r_actual_use rrau on LN.AU_ID = rrau.AU_ID JOIN rpt_r_property_class rrpc on LN.PC_ID = rrpc.PC_ID JOIN rpt_r_property_type rrpt on LN.PT_ID = rrpt.PT_ID JOIN rpt_t_assessment rta on LN.RPL_ID = rta.RPL_ID  WHERE RPL_STAT = 'TAXING'");
        Statement statement1 = connection.createStatement();
        ResultSet resultSet1 = statement1.executeQuery("SELECT * FROM rpt_r_rate");
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
            <li class="active">Tax</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">List of Tax</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">Tax</h4>
                    </div>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                            <thead>
                            <tr>
                                <th class="hidden">ID</th>
                                <th class="hidden">ID</th>
                                <th>Owner</th>
                                <th>Assessed Value (PHP)</th>
                                <th>ARP Number</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                while (resultSet.next()) {
                                    String assessLink = "location.href='RPTTaxDec.jsp?rplId=" + resultSet.getString("RPL_ID") + "'";
                            %>
                            <tr>
                                <td class="hidden"><%=resultSet.getString("RPTA_ID")%>
                                </td>
                                <td class="hidden"><%=resultSet.getString("RPL_ID")%>
                                </td>
                                <td><%=resultSet.getString("RPO_FNAME") + " " + resultSet.getString("RPO_SNAME")%>
                                </td>
                                <td><%=resultSet.getString("ASSESSED_VAL")%>
                                </td>
                                <td><%=resultSet.getString("ARP_NO")%>
                                </td>
                                <td>
                                    <a href="#modal-taxing" class="btn btn-sm btn-primary modalTax" data-toggle="modal">Action</a>
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

    <!-- #modal-add -->
    <div class="modal fade" id="modal-taxing">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Tax</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data" name="addRPTPropTaxForm" id="addRPTPropTaxForm">
                                <%--<form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">--%>
                                <input class="hidden" type="hidden" name="EP_ID"
                                       value='<%=session.getAttribute("empid")%>'>
                                <input class="hidden" type="hidden" name="RPL_ID" id="RPL_ID">
                                <input class="hidden" type="hidden" name="RPTA_ID" id="RPTA_ID">
                                <div>
                                    <fieldset>
                                        <legend class="pull-left width-full">Tax & Payment</legend>
                                        <!-- begin row -->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Installment Type</label>
                                                    <div class="controls">
                                                        <select name="optInstallment" class="form-control">
                                                            <option value='FULL' selected>Full</option>
                                                            <option value='SEMI ANNUAL' selected>Semi Annual</option>
                                                            <option value='QUARTERLY' selected>Quarterly</option>

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Payment Method</label>
                                                    <div class="controls">
                                                        <select name="optPayMethod" class="form-control">
                                                            <option value="Cash" selected>Cash</option>
                                                            <option value="Check" selected>Check</option>
                                                            <option value="Money Order" selected>Money Order</option>
                                                            <option value="Treasury Warrant" selected>Treasury Warrant
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Property Rate</label>
                                                    <div class="controls">


                                                        <select id="test" name="taxRateId" class="form-control">


                                                            <option value='' selected>-Select One-</option>
                                                            <%
                                                                while (resultSet1.next()) {
                                                                    flRate = Float.parseFloat(resultSet1.getString("RPTR_RATE"));

                                                                    String functionX = "var assVal = " + flRate + " * $('#assessedVal').val(); var perC = " + flRate + " * 100; $('#percentageStr').val(perC.toFixed(2)); $('#percentageStrHide').val(" + flRate + "); $('#totAmt').val(assVal.toFixed(2)); $('#totAmtHide').val(assVal.toFixed(2));";
                                                            %>
                                                            <option onclick="<%=functionX%>"
                                                                    value='<%=resultSet1.getString("RPTR_ID")%>'><%=resultSet1.getString("RPTR_LOC")%>
                                                            </option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Percentage (%)</label>
                                                    <div class="controls">
                                                        <input type="text" name="percentageStr" id="percentageStr"
                                                               placeholder=""
                                                               class="form-control" disabled/>
                                                        <input type="hidden" name="percentageStrHide"
                                                               id="percentageStrHide"
                                                               placeholder="Input 1"
                                                               class="form-control hidden"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Assessed Value (PHP)</label>
                                                    <div class="controls">
                                                        <input type="text" name="assessedVal" id="assessedVal"
                                                               placeholder="Input 2"
                                                               class="form-control" disabled/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Amount (PHP)</label>
                                                    <div class="controls">
                                                        <input type="text" name="totAmt" id="totAmt"
                                                               placeholder=""
                                                               class="form-control" disabled/>
                                                        <input type="hidden" name="totAmtHide" id="totAmtHide"
                                                               placeholder=""
                                                               class="form-control hidden"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                        <input
                                                                type="checkbox"
                                                                id="chkIdleStat"
                                                                name="chkIdleStat"
                                                                class="flat"
                                                                value="Pass"
                                                        > The Property Is Idle
                                            </div>

                                        </div>

                                        <br>

                                        <div class="modal-footer">
                                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" id="btnTaxRPT" class="btn btn-sm btn-success">Add
                                            </button>
                                        </div>
                                        <!-- end row -->
                                    </fieldset>
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
<script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="assets/plugins/select2/dist/js/select2.min.js"></script>
<script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();

        $(".modalTax").click(function () {
            // $("#assessedVal").val(parseFloat($(this).closest("tbody tr").find("td:eq(3)").html()));
            document.getElementById('RPL_ID').value = $(this).closest("tbody tr").find("td:eq(1)").html().trim();
            document.getElementById('assessedVal').value = $(this).closest("tbody tr").find("td:eq(3)").html();
            document.getElementById('RPTA_ID').value = $(this).closest("tbody tr").find("td:eq(0)").html().trim();
        });

        $("#modal-taxing").on('hidden.bs.modal', function () {
            $("#assessedVal").val(0.00);
            $("#totAmt").val(0.00);
            $("#percentageStr").val(0.00);
            $("#percentageStrHide").val(0.00);

        });

        $("#btnTaxRPT").click(function () {
            var addRPTPropTaxForm = new FormData($('#addRPTPropTaxForm')[0]);
            swal({
                title: "Are you sure?",
                text: "You will save your current changes",
                type: "warning",
                confirmButtonColor: "#62a3cb",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then(function (result) {
                if (result.value) {
                    $.ajax({
                        type: "POST",
                        url: "insertRPTTax",
                        data: addRPTPropTaxForm,
                        enctype: "multipart/form-data",
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            swal({
                                type: 'success',
                                title: 'DONE!.',
                                text: 'Succesfully Processed',
                                confirmButtonText: 'OK'
                            }).then(function (result) {
                                if (result.value) {
                                    window.location.replace("RPTPrprty.jsp");
                                    //$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
                                    //window.location.replace("BPLSORf.jsp"+oRX);
                                }
                            })
                            ;

                        }
                    });
                } else if (result.dismiss === swal.DismissReason.cancel) {
                    swalWithBootstrapButtons(
                        'Cancelled',
                        'Operation Halted',
                        'error'
                    )

                }
            });
        });
    });
</script>
</body>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</html>