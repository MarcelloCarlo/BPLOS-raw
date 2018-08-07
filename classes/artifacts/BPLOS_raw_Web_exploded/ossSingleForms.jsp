<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="ISO-8859-1">

    <title>BPLS | Single Proprietorship</title>

    <!-- Bootstrap -->
    <link href="build/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="build/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="build/css/nprogress.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="build/datatables.net-bs/css/dataTables.bootstrap.min.css"
          rel="stylesheet">
    <link
            href="build/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
            rel="stylesheet">
    <link
            href="buid/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
            rel="stylesheet">
    <link
            href="build/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
            rel="stylesheet">
    <link
            href="build/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
            rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="build/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="build/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="build/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="build/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="build/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="build/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="/navBars.jsp"></jsp:include>
        <!-- page content -->
        <div class="right_col" role="main">
            <form class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Single Proprietorship</h3>
                    </div>
                </div>
                <div class="clearfix"></div>
                <!-- 									START -->
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>List of Businesses</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p class="text-muted font-13 m-b-30">List of Single
                                Proprietorship Business. Click "Add New" to apply a new
                                business. Click buttons within the action column to modify
                                existing records.</p>
                            <button type="button" class="btn btn-primary"
                                    data-toggle="modal" data-target=".ossSingleFormModal">
                                <i class="fa fa-plus"></i> Add New
                            </button>
                            <table id="datatable-buttons"
                                   class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Business Name</th>
                                    <th>Taxpayer's Name</th>
                                    <th>Business Address</th>
                                    <th>Telephone</th>
                                    <th>Date Issued</th>
                                    <th>Permit Type</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>Spa Ni Mamita et. al.</td>
                                    <td>John Carlo Gutierrez</td>
                                    <td>123 Maligaya St. Quezon Avenue, Quezon City</td>
                                    <td>6396969</td>
                                    <td>2011/04/25</td>
                                    <td>New</td>
                                    <td>
                                        <button type="submit" class="btn btn-success">Edit</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Lugawan Korean</td>
                                    <td>Jennifer Sanchez</td>
                                    <td>456 Matalino St. Quezon Avenue, Quezon City</td>
                                    <td>6375757</td>
                                    <td>2012/04/25</td>
                                    <td>Renewal</td>
                                    <td>
                                        <button type="submit" class="btn btn-success">Edit</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Kanin Club</td>
                                    <td>Malene Dizon</td>
                                    <td>421 Tandang Sora Avenue, Quezon City</td>
                                    <td>6334757</td>
                                    <td>2015/04/25</td>
                                    <td>Renewal</td>
                                    <td>
                                        <button type="submit" class="btn btn-success">Edit</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%--OSS form--%>
                <form class="form-horizontal form-label-left" id="applicationFormSingle" novalidate=""
                      data-parsley-validate="" method="POST">
                    <div class="modal fade ossSingleFormModal" tabindex="-1"
                         role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="x_panel" style="width: 110% !important" role="document">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                    <h4 class="modal-title">Add New</h4>
                                </div>
                                <div class="clearfix"></div>
                                <div class="x_content">
                                    <br>
                                    <div class="row">
                                        <div class="form-group col-xs-11">
                                            <label class="control-label col-md-3" for="txtBussName">Business Name/Trade
                                                Name <span class="required">*</span>
                                            </label>
                                            <div class="col-md-7">
                                                <input type="text" id="txtBussName" required="required"
                                                       class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group col-xs-12">
                                            <label class="control-label col-md-2" for="txtTaxPayLName">Taxpayer's Name
                                                <span
                                                        class="required">*</span>
                                            </label>
                                            <div class="col-md-3">
                                                <input type="text" id="txtTaxPayLName" placeholder="Last Name"
                                                       required="required"
                                                       class="form-control col-md-3 col-sm-3 col-xs-12">
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" id="txtTaxPayFName" placeholder="First Name"
                                                       required="required"
                                                       class="form-control col-md-3 col-sm-3 col-xs-12">
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" id="txtTaxPayMName" placeholder="Middle Name"
                                                       required="required"
                                                       class="form-control col-md-3 col-sm-3 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">

                                            <div class="form-group">
                                                <label>Home Address of Business Owner <span
                                                        class="required">*</span></label>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <div class="col-md-3">
                                                    <input type="text" id="txtBussOwnHsNum"
                                                           placeholder="House No."
                                                           required="required"
                                                           class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtBussOwnStrt" placeholder="Street"
                                                           required="required"
                                                           class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtBussOwnBrgy" placeholder="Barangay"
                                                           required="required"
                                                           class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtBussOwnCity" placeholder="City/Min."
                                                           required="required"
                                                           class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label>Business Location
                                                    <small>(Indicate exact address)</small>
                                                    <span
                                                            class="required">*</span></label>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <div class="col-md-4">
                                                    <input type="text" id="txtBussFlrNo"
                                                           placeholder="If within a bldg.., specify stall, room, floor number"
                                                           required="required"
                                                           class="form-control col-md-4 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-2">
                                                    <input type="text" id="txtBussStrtNo" placeholder="Street No."
                                                           required="required"
                                                           class="form-control col-md-2 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtBussStrtName" placeholder="Street Name"
                                                           required="required"
                                                           class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtBussBrgyName" placeholder="Barangay"
                                                           required="required"
                                                           class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <label for="txtPropIdxNo">Property Index No. <span
                                                        class="required">*</span></label>
                                                <input type="text" id="txtPropIdxNo" class="form-control"
                                                       placeholder=" " required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="txtLotBlckNo">Lot & Block No. <span
                                                        class="required">*</span></label>
                                                <input type="text" id="txtLotBlckNo" class="form-control"
                                                       placeholder=" " required="required">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-4" for="txtTaxPayTINNo">Taxpayer's
                                                    Identification Number (TIN) <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" id="txtTaxPayTINNo" required="required"
                                                           class="form-control col-md-6 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <br> <br>
                                        <div class="col-xs-12 col-sm-12">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <label for="txtBussDTIRegNo">DTI
                                                        (Business Name) Registration Number
                                                        <span
                                                                class="required">*</span></label>
                                                    <input type="text" id="txtBussDTIRegNo"
                                                           class="form-control"
                                                           placeholder=" " required="required">
                                                </div>
                                                <div class="form-group">
                                                    <label for="dateXS" class="control-label">Date <span
                                                            class="required">*</span></label>
                                                    <div class="input-group date" id="dateBussDTIReg">
                                                        <input type="text" class="form-control" id="dateXS"
                                                               required="required">
                                                        <span class="input-group-addon"><span
                                                                class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-inline col-xs-12">
                                            <div class="form-group">
                                                <label for="txtPropIdxNo">Telephone Number <span
                                                        class="required">*</span></label>
                                                <input type="text" id="txtBussTelNo" class="form-control"
                                                       placeholder=" " required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="txtLotBlckNo">Fax Number <span
                                                        class="required">*</span></label>
                                                <input type="text" id="txtBussFaxNo" class="form-control"
                                                       placeholder=" " required="required">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="col-xs-12">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <label for="txtEmpSSSNo" class="col-md-7">If Employer, Employer's
                                                        Social Security Number (SSS) <span
                                                                class="required">*</span></label>
                                                    <input type="text" id="txtEmpSSSNo"
                                                           class="form-control col-md-7 col-sm-12"
                                                           placeholder=" " required="required">
                                                </div>
                                                <div class="form-group">
                                                    <label for="numBussEmpQTY" class="col-md-4 col-sm-4 col-xs-12">No of Employees <span
                                                            class="required">*</span></label>
                                                    <input type="number" id="numBussEmpQTY" class="form-control "
                                                           placeholder=" " required="required">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default"
                                            data-dismiss="modal">Close
                                    </button>
                                    <button type="submit" class="btn btn-primary">Save
                                        changes
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
        </div>
    </div>
    <!-- /page content -->

    <jsp:include page="/footer.jsp"></jsp:include>
</div>
</div>

<!-- jQuery -->
<script src="build/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="build/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="build/js/fastclick.js"></script>
<!-- NProgress -->
<script src="build/js/nprogress.js"></script>
<script src="build/iCheck/icheck.min.js"></script>
<!-- Datatables -->
<script src="build/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="build/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="build/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script
        src="build/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.print.min.js"></script>
<script
        src="build/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script
        src="build/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script
        src="build/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script
        src="build/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script
        src="build/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="build/jszip/dist/jszip.min.js"></script>
<script src="build/pdfmake/build/pdfmake.min.js"></script>
<script src="build/pdfmake/build/vfs_fonts.js"></script>
<!-- NProgress -->
<script src="build/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="build/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="build/iCheck/icheck.min.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="build/moment/min/moment.min.js"></script>
<script src="build/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-datetimepicker -->
<script src="build/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="build/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="build/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="build/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="build/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="build/switchery/dist/switchery.min.js"></script>
<!-- Select2 -->
<script src="build/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="build/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="build/autosize/dist/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script src="build/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="build/starrr/dist/starrr.js"></script>
<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>
<!-- Initialize datetimepicker -->
<script>
    $('#dateBussDTIReg').datetimepicker({
        format: 'DD.MM.YYYY'
    });
</script>
</body>
</html>
