<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 26 Mar 2019
  Time: 12:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>RPT | Add Property </title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>

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
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<%try{%>
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
            <li><a href="javascript:;">Setup</a></li>
            <li class="active">Property</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Property</h1>
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
                        <h4 class="panel-title">Property Tables</h4>
                    </div>
                    <div class="panel-body">
                        <a href="#modal-addcont" id="addContbtn" class="btn btn-sm btn-primary" data-toggle="modal">Add Property</a>
                    </div>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                            <thead>
                            <tr>
                                <th>Property</th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <a href="#modal-editcont" id="editContbtn" class="btn btn-sm btn-primary editActUse" data-toggle="modal">Edit</a>
                                </td>
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

    <!-- #modal-add -->
    <div class="modal fade" id="modal-addcont">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Property</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data"name="addActualUseForm" id="addActualUseForm">
                                <%--<form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">--%>
                                <div>
                                    <fieldset>
                                        <h4 class="pull-left width-full">Property Location</h4>
                                        <!-- begin row -->
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>No./Street:</label>
                                                    <input type="text" name="nostreet" placeholder="No./Street"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Brgy/District:</label>
                                                    <input type="text" name="brgydis"
                                                           placeholder="Brgy/District"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Municipality:</label>
                                                    <input type="text" name="munic"
                                                           placeholder="Municipality"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Province/City:</label>
                                                    <input type="text" name="procit" placeholder="Province/City"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                        </div>

                                        <h4 class="pull-left width-full">Property Boundaries</h4>

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>North:</label>
                                                    <input type="text" name="north" placeholder="North"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>East:</label>
                                                    <input type="text" name="east" placeholder="East"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>South:</label>
                                                    <input type="text" name="south" placeholder="South"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>West:</label>
                                                    <input type="text" name="west" placeholder="West"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>ID Number</label>
                                                    <div class="controls">
                                                        <input type="text" name="idnumber" placeholder="ID Number"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="col-md-6">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>PIN</label>--%>
                                            <%--<div class="controls">--%>
                                            <%--<input type="text" name="pin" placeholder="PIN"--%>
                                            <%--class="form-control" required/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--<div class="col-md-6">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>Owner</label>--%>
                                            <%--<div class="controls">--%>
                                            <%--<input type="text" name="owner" placeholder="Owner"--%>
                                            <%--class="form-control" required/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Effectivity Date</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control date" name="effectdate" id="effectdate" required placeholder="DD-MM-YYYY"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--<h4 class="pull-left width-full">Kind of Property Assessed</h4>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" value="taxable" checked />
                                                        Taxable
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" value="exempt" />
                                                        Exempt
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" value="mortgage" />
                                                        Mortgage
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Property Class</label>
                                                    <div class="controls">
                                                        <input type="text" name="pprtyclss" placeholder="Property Class"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Actual Use</label>
                                                    <div class="controls">
                                                        <input type="text" name="actluse"
                                                               placeholder="Actual Use"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Market Value</label>
                                                    <div class="controls">
                                                        <input type="text" name="mrktval" placeholder="Market Value"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Assessment Level</label>
                                                    <div class="controls">
                                                        <input type="text" name="assesslvl"
                                                               placeholder="Assessment Level"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Assessed Value</label>
                                                    <div class="controls">
                                                        <input type="text" name="assessval"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Date</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control date" name="lstdate" id="assessedDate" required placeholder="DD-MM-YYYY"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <br>--%>

                                        <div class="modal-footer">
                                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" id="btnAddActualUse" class="btn btn-sm btn-success">Add</button>
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

    <!-- #modal-edit -->
    <div class="modal fade" id="modal-editcont">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Actual Use</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data" name="editActualUseForm" id="editActualUseForm">
                                <%--<form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">--%>
                                <input type="text" id="au_id" name="au_id" class="hide">
                                <div>
                                    <fieldset>
                                        <h4 class="pull-left width-full">Property Location</h4>
                                        <!-- begin row -->
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>No./Street:</label>
                                                    <input type="text" name="nostreet" placeholder="No./Street"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Brgy/District:</label>
                                                    <input type="text" name="brgydis"
                                                           placeholder="Brgy/District"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Municipality:</label>
                                                    <input type="text" name="munic"
                                                           placeholder="Municipality"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Province/City:</label>
                                                    <input type="text" name="procit" placeholder="Province/City"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                        </div>

                                        <h4 class="pull-left width-full">Property Boundaries</h4>

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>North:</label>
                                                    <input type="text" name="north" placeholder="North"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>East:</label>
                                                    <input type="text" name="east" placeholder="East"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>South:</label>
                                                    <input type="text" name="south" placeholder="South"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>West:</label>
                                                    <input type="text" name="west" placeholder="West"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>ID Number</label>
                                                    <div class="controls">
                                                        <input type="text" name="idnumber" placeholder="ID Number"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="col-md-6">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>PIN</label>--%>
                                            <%--<div class="controls">--%>
                                            <%--<input type="text" name="pin" placeholder="PIN"--%>
                                            <%--class="form-control" required/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--<div class="col-md-6">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>Owner</label>--%>
                                            <%--<div class="controls">--%>
                                            <%--<input type="text" name="owner" placeholder="Owner"--%>
                                            <%--class="form-control" required/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Effectivity Date</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control date" name="effectdate" id="effectdateE" required placeholder="DD-MM-YYYY"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                     <%--   <h4 class="pull-left width-full">Kind of Property Assessed</h4>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-9">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" value="taxable" checked />
                                                        Taxable
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" value="exempt" />
                                                        Exempt
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="optionsRadios" value="mortgage" />
                                                        Mortgage
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Property Class</label>
                                                    <div class="controls">
                                                        <input type="text" name="pprtyclss" placeholder="Property Class"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Actual Use</label>
                                                    <div class="controls">
                                                        <input type="text" name="actluse"
                                                               placeholder="Actual Use"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Market Value</label>
                                                    <div class="controls">
                                                        <input type="text" name="mrktval" placeholder="Market Value"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Assessment Level</label>
                                                    <div class="controls">
                                                        <input type="text" name="assesslvl"
                                                               placeholder="Assessment Level"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Assessed Value</label>
                                                    <div class="controls">
                                                        <input type="text" name="assessval"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Date</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control date" name="lstdate" id="assessedDateE" required placeholder="DD-MM-YYYY"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>--%>

                                        <!-- end row -->
                                    </fieldset>
                                </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                        <button type="button" id="btnEditActualUse" class="btn btn-sm btn-success">Edit</button>

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
<script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/form-wizards.demo.min.js"></script>
<script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="assets/plugins/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/js/form-plugins.demo.min.js"></script>
<script src="assets/plugins/masked-input/masked-input.min.js"></script>
<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
<script src="assets/plugins/jquery-tag-it/js/tag-it.min.js"></script>
<script src="assets/plugins/select2/dist/js/select2.min.js"></script>
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();

        $("#btnAddActualUse").click(function () {
            swal({
                title: "Are you sure?",
                text: "You will save your current changes",
                type: "warning",
                confirmButtonColor: "#4fcfff",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then(function (result) {
                if(result.value){
                    var addActualUseForm = new FormData($('#addActualUseForm')[0]);
                    $.ajax({
                        type: "POST",
                        url: "insertActualUse",
                        data: addActualUseForm,
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
                                if(result.value){
                                    location.reload(true);
                                }
                            });}
                    });
                }
                else
                if (result.dismiss === swal.DismissReason.cancel) {
                    swalWithBootstrapButtons(
                        'Cancelled',
                        'Operation Halted',
                        'error'
                    )

                }
            });
        });

        $('.editActUse').click(function () {
            document.getElementById('pt_id').value = $(this).closest("tbody tr").find("td:eq(0)").html().trim();
        });

        $("#btnEditActualUse").click(function () {
            swal({
                title: "Are you sure?",
                text: "Current changes will be saved.",
                type: "warning",
                confirmButtonColor: "#4fcfff",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then(function (result) {
                if(result.value){
                    var editActualUseForm = new FormData($('#editActualUseForm')[0]);
                    $.ajax({
                        type: "POST",
                        url: "editActualUse",
                        data: editActualUseForm,
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
                                if(result.value){
                                    location.reload(true);
                                }
                            });}
                    });
                }
                else
                if (result.dismiss === swal.DismissReason.cancel) {
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
<%} catch (Exception e){
    e.printStackTrace();
}
%>
</html>