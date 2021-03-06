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
    <title>RPT | Add Owner </title>
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
<%
LGUConnect connect = new LGUConnect();
try{
    Connection connection = connect.getConnection();
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("SELECT * FROM rpt_t_rp_owner");
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
            <li><a href="javascript:;">Setup</a></li>
            <li class="active">Owner</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Owner</h1>
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
                        <h4 class="panel-title">Owner Tables</h4>
                    </div>
                    <div class="panel-body">
                        <a href="#modal-addcont" id="addContbtn" class="btn btn-sm btn-primary" data-toggle="modal">Add Owner</a>
                    </div>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                            <thead>
                            <tr>
                                <th class="hidden">ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>TIN</th>
                                <%--<th>Action</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <%while(resultSet.next()){%>
                            <tr>
                                <td class="hidden"><%=resultSet.getInt("RPO_ID")%></td>
                                <td><%=resultSet.getString("RPO_FNAME") +" "+ resultSet.getString("RPO_SNAME")%></td>
                                <td><%=resultSet.getString("RPO_ADDR")%></td>
                                <td><%=resultSet.getString("RPO_TIN")%></td>
                               <%-- <td>
                                    <a href="#modal-editcont" id="editContbtn" class="btn btn-sm btn-primary editActUse"
                                       data-toggle="modal">Edit</a>
                                </td>--%>
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
    <div class="modal fade" id="modal-addcont">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Owner</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data" name="addOwnerForm" id="addOwnerForm">
                                <%--<form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">--%>
                                <div>
                                    <fieldset>
                                        <!-- begin row -->
                                       <%-- <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>PIN:</label>
                                                    <input type="text" name="pin" placeholder="PIN"
                                                           class="form-control" required/>
                                                </div>
                                            </div>
                                        </div>
--%>
                                        <div class="row">
                                          <%--  <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>OCT/TCT/CLOA No.</label>
                                                    <input type="text" name="oct" placeholder="OCT/TCT/CLOA No."
                                                           class="form-control" required/>
                                                </div>
                                            </div>--%>

                                          <%--  <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Dated:</label>
                                                    <input type="text" class="form-control date" name="dated" id=" " required placeholder="DD-MM-YYYY"/>
                                                </div>
                                            </div>--%>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <input type="text" name="addOwnFname" placeholder=""
                                                           class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Middle Name</label>
                                                    <input type="text" name="addOwnMname" placeholder=""
                                                           class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input type="text" name="addOwnSname" placeholder=""
                                                           class="form-control" required/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" name="addOwnEmail" placeholder="name@example.com"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Tel No:</label>
                                                    <input type="text" name="addOwnTel" id="addOwnTel"
                                                           placeholder="Tel No:"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>TIN:</label>
                                                    <input type="text" name="addOwnTin"
                                                           placeholder="TIN"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" name="addOwnAddr" placeholder="Address"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                        </div>
                                        <%--<div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Administrative/Beneficial User:</label>
                                                    <input type="text" name="admben" placeholder="Administrative/Beneficial User"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Tel No:</label>
                                                    <input type="text" name="admbentel"
                                                           placeholder="Tel No."
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>TIN:</label>
                                                    <input type="text" name="admbentin"
                                                           placeholder="Tin"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" name="admbenadd" placeholder="Address"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                        </div>--%>

                                        <br>

                                        <div class="modal-footer">
                                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" id="btnAddOwner" class="btn btn-sm btn-success">Add</button>
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
                            <h4 class="panel-title">Edit Owner</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data" name="editOwnerForm" id="editOwnerForm">
                                <%--<form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">--%>
                                <input type="text" id="editRPO_id" name="editRPO_id" class="hide">
                                <div>
                                    <fieldset>
                                        <!-- begin row -->

                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <input type="text" name="editOwnFname" placeholder=""
                                                           class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Middle Name/Initial</label>
                                                    <input type="text" name="editOwnMname" placeholder=""
                                                           class="form-control" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input type="text" name="editOwnSname" placeholder=""
                                                           class="form-control" required/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" name="editOwnEmail" placeholder="Owner"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Tel No:</label>
                                                    <input type="text" name="editOwnTel"
                                                           placeholder="Tel No:"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>TIN:</label>
                                                    <input type="text" name="editOwnTin"
                                                           placeholder="TIN"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" name="editOwnAddr" placeholder="Address"
                                                           class="form-control"/>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="modal-footer">
                                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" id="btnEditActualUse" class="btn btn-sm btn-success">Edit</button>

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
<script src="assets/plugins/jQuery-Mask-Plugin-master/src/jquery.mask.js"></script>
<script src="assets/plugins/plentz-jquery-maskmoney/dist/jquery.maskMoney.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script>
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();

        $('#addOwnTel').mask('000-0000');

        $("#btnAddOwner").click(function () {
            swal({
                title: "Are you sure?",
                text: "You will save your current changes",
                type: "warning",
                confirmButtonColor: "#1a8ecb",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then(function (result) {
                if(result.value){
                    var addOwnerForm = new FormData($('#addOwnerForm')[0]);
                    $.ajax({
                        type: "POST",
                        url: "insertOwnerProperty",
                        data: addOwnerForm,
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
                confirmButtonColor: "#1a8ecb",
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

</body>
<%} catch (Exception e){
    e.printStackTrace();
}%>
</html>