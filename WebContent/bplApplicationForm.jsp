<%--
  Created by IntelliJ IDEA.
  User: John Carlo Villar
  Date: 08/07/2018
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="ISO-8859-1">

    <title>Application Form | Business Permit</title>
    <!-- Bootstrap -->
    <link href="build/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="build/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="build/css/nprogress.css" rel="stylesheet">
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
        <!-- page content -->
        <div class="right_col" role="main">
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
                                                <label for="numBussEmpQTY" class="col-md-4 col-sm-4 col-xs-12">No of
                                                    Employees <span
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

