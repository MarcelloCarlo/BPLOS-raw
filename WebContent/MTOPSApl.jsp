<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/7/2018
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>MTOPS | Application Form</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <%--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">--%>
    <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="assets/css/animate.min.css" rel="stylesheet"/>
    <link href="assets/css/style.min.css" rel="stylesheet"/>
    <link href="assets/css/style-responsive.min.css" rel="stylesheet"/>
    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme"/>
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet"/>
    <link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.css" rel="stylesheet"/>
    <link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.skinNice.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet"/>
    <link href="assets/plugins/password-indicator/css/password-indicator.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-combobox/css/bootstrap-combobox.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css"
          rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-fontawesome.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-glyphicons.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/bootstrap-wizard/css/bwizard.min.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="MTOPSAplComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <div class="row">
            <!-- begin col-12 -->
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                        </div>
                        <h4 class="panel-title">Tricycle Operator Permit Application Form</h4>
                    </div>
                    <div class="panel-body">
                        <form data-parsley-validate="" novalidate="" enctype="multipart/form-data"
                              name="applicationFormSingle" id="applicationFormSingle">
                            <div id="wizard">
                                <ol>
                                    <li>
                                        Applicant's Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Additional Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Representative Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Requirement Attachments
                                        <small></small>
                                    </li>
                                    <li>
                                        Done!
                                        <small></small>
                                    </li>
                                </ol>
                                <!-- begin wizard step-1 -->
                                <div class="wizard-st-1">
                                    <fieldset>
                                        <legend class="pull-left width-full">Applicant's Information</legend>
                                        <!-- begin row -->

                                        <%--Name--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Applicant's Name*</label>
                                                    <input type="text" id="txtNSingTaxPayLName"
                                                           name="txtNSingTaxPayLName" placeholder="Last Name"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingTaxPayFName"
                                                           name="txtNSingTaxPayFName" placeholder="First Name"
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingTaxPayMName"
                                                           name="txtNSingTaxPayMName" placeholder="Middle Name"
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Birthdate*</label>
                                                    <input type="text" class="form-control date"
                                                           id="dateNSingBussDTIReg"
                                                           name="dateNSingBussDTIReg" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Sex</label>
                                                    <div class="controls">
                                                        <select name="gender" class="form-control">
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Address--%>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Applicant's Address*</label>
                                                    <input type="text" id="txtNSingBussOwnHsNum"
                                                           name="txtNSingBussOwnHsNum" placeholder="House No."
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussOwnStrt"
                                                           name="txtNSingBussOwnStrt" placeholder="Street"
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussOwnBrgy"
                                                           name="txtNSingBussOwnBrgy" placeholder="Barangay"
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussOwnCity"
                                                           name="txtNSingBussOwnCity" placeholder="City"
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end row -->
                                    </fieldset>
                                </div>
                                <!-- end wizard step-1 -->
                                <!-- begin wizard step-2 -->
                                <div class="wizard-st-2">
                                    <fieldset>
                                        <legend class="pull-left width-full">Additional Information</legend>
                                        <!-- begin row -->

                                        <%--First Part--%>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Telephone Number*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussTelNo"
                                                               name="txtNSingBussTelNo" placeholder="Telephone Number"
                                                               class="form-control" data-parsley-group="wizard-st-2"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Mailing Address*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussFaxNo"
                                                               name="txtNSingBussFaxNo" placeholder="Mailing Address"
                                                               class="form-control" data-parsley-group="wizard-st-2"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Email*</label>
                                                    <div class="controls">
                                                        <input type="text" id=" "
                                                               name="txtNSingBussFaxNo" placeholder="Email"
                                                               class="form-control" data-parsley-group="wizard-st-2"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Plate Number*</label>
                                                    <div class="controls">
                                                        <input type="text" id="dd"
                                                               name="txtNSingBussFaxNo" placeholder="Plate Number"
                                                               class="form-control" data-parsley-group="wizard-st-2"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Second Part--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>TODA</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingEmpSSSNo"
                                                               name="txtNSingEmpSSSNo" placeholder="TODA"
                                                               class="form-control" data-parsley-group="wizard-st-2"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="col-md-6">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>No of Employees*</label>--%>
                                            <%--<div class="controls">--%>
                                            <%--<input type="number" id="numNSingBussEmpQTY"--%>
                                            <%--name="numNSingBussEmpQTY" placeholder="No of Employees"--%>
                                            <%--class="form-control" data-parsley-group="wizard-st-3" required/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                        </div>

                                        <%--Cards--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>TIN No.*</label>
                                                    <input type="text" id="txtNSingTaxPayTINNo"
                                                           name="txtNSingTaxPayTINNo" placeholder="TIN (9-12 Digits)"
                                                           class="form-control" data-parsley-group="wizard-st-2"
                                                           required/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Driver's Licence*</label>
                                                    <input type="text" id="licenceee"
                                                           name="txtNSingTaxPayTINNo" placeholder="Driver's Licence"
                                                           class="form-control" data-parsley-group="wizard-st-2"
                                                           required/>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end row -->
                                    </fieldset>
                                </div>
                                <!-- end wizard step-2 -->
                                <!-- begin wizard step-3 -->
                                <div class="wizard-st-3">
                                    <fieldset>
                                        <legend class="pull-left width-full">Representative Information</legend>

                                        <%--Representative--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Name of Authorized Representative*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussRepLName"
                                                               name="txtNSingBussRepLName" placeholder="Last Name"
                                                               class="form-control" data-parsley-group="wizard-st-3"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussRepFName"
                                                               name="txtNSingBussRepFName" placeholder="First Name"
                                                               class="form-control" data-parsley-group="wizard-st-3"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussRepMName"
                                                               name="txtNSingBussRepMName" placeholder="Middle Name"
                                                               class="form-control" data-parsley-group="wizard-st-3"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Address--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Home Address of Authorized Representative*</label>
                                                    <input type="text" id="txtNSingBussRepAddr"
                                                           name="txtNSingBussRepAddr" placeholder="Home Address"
                                                           class="form-control" data-parsley-group="wizard-st-3"
                                                           required/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Birthdate*</label>
                                                    <input type="text" class="form-control date1" id="dateNdate"
                                                           name="dateNdate" data-parsley-group="wizard-st-3" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Sex</label>
                                                    <div class="controls">
                                                        <select name="gender" class="form-control">
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" name="bdate" placeholder="Email"
                                                           class="form-control" data-parsley-group="wizard-st-3"
                                                           required/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Phone Number</label>
                                                    <input type="text" name="bdate" placeholder="Phone Number"
                                                           class="form-control" data-parsley-group="wizard-st-3"
                                                           required/>
                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>
                                </div>
                                <!-- end wizard step-3 -->
                                <!-- begin wizard step-4 -->
                                <div class="wizard-st-4">
                                    <fieldset>
                                        <legend class="pull-left width-full">Requirement Attachment</legend>

                                        <%--Other exisiting table--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls fileupload-buttonbar">

                                                        <span>Add files...</span>
                                                        <input type="file" name="fileUnifiedRequirements"
                                                               id="fileUnifiedRequirements"
                                                               accept=".doc,.docx,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf"
                                                               data-parsley-group="wizard-st-7" required>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- end wizard step-4 -->
                                <!-- begin wizard step-5 -->
                                <div>
                                    <div class="jumbotron m-b-0 text-center">
                                        <h1>Finished!</h1>
                                        <p>Click the "Continue" button to proceed to the next step. Make sure you fill
                                            out all of the requirements right to move forward :-)</p>
                                        <p>
                                            <button type="submit" id="submitBtn" class="btn btn-success btn-lg">
                                                Continue
                                            </button>
                                        </p>
                                    </div>
                                </div>
                                <!-- end wizard step-4 -->
                            </div>
                        </form>
                    </div>
                </div>
                <!-- end panel -->
            </div>
            <!-- end col-12 -->
        </div>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<jsp:include page="MTOPSAplFooter.jsp"></jsp:include>

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
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
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

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/ionRangeSlider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
<script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script src="assets/plugins/masked-input/masked-input.min.js"></script>
<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="assets/plugins/password-indicator/js/password-indicator.js"></script>
<script src="assets/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
<script src="assets/plugins/jquery-tag-it/js/tag-it.min.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="assets/plugins/select2/dist/js/select2.min.js"></script>
<script src="assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/plugins/bootstrap-show-password/bootstrap-show-password.js"></script>
<script src="assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
<script src="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.js"></script>
<script src="assets/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
<script src="assets/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
<script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
<script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
<script src="assets/plugins/parsleyjs/dist/parsley.min.js"></script>
<script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
<script src="assets/plugins/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/newSingleFormApplValidation.js"></script>
<script src="assets/js/form-plugins.demo.min.js"></script>
<script src="assets/js/form-multiple-upload.demo.min.js"></script>
<script src="assets/js/mtops.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>