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
    <meta charset="utf-8"/>
    <title>BPLS | Application Form</title>
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

<jsp:include page="BPLSAplSglBusComponent.jsp"></jsp:include>

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
                        <h4 class="panel-title">Business Permit Application Form For Single
                            Proprietorship</h4>
                    </div>
                    <div class="panel-body">
                        <form data-parsley-validate="" novalidate="" enctype="multipart/form-data" name="applicationFormSingle" id="applicationFormSingle">
                            <div id="wizard">
                                <ol>
                                    <li>
                                        Applicant's Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Business' Information
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
                                        Other Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Existing Business Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Business Nature and Attachment
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
                                                    <label>Taxpayer's Name*</label>
                                                    <input type="text" id="txtNSingTaxPayLName"
                                                           name="txtNSingTaxPayLName" placeholder="Last Name"
                                                           class="form-control" required data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingTaxPayFName"
                                                           name="txtNSingTaxPayFName" placeholder="First Name"
                                                           class="form-control" data-parsley-group="wizard-st-1" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingTaxPayMName"
                                                           name="txtNSingTaxPayMName" placeholder="Middle Name"
                                                           class="form-control" data-parsley-group="wizard-st-1" required/>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Address--%>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Taxpayer's Address*</label>
                                                    <input type="text" id="txtNSingBussOwnHsNum"
                                                           name="txtNSingBussOwnHsNum" placeholder="House No."
                                                           class="form-control" data-parsley-group="wizard-st-1" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussOwnStrt"
                                                           name="txtNSingBussOwnStrt" placeholder="Street"
                                                           class="form-control" data-parsley-group="wizard-st-1" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussOwnBrgy"
                                                           name="txtNSingBussOwnBrgy" placeholder="Barangay"
                                                           class="form-control" data-parsley-group="wizard-st-1" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussOwnCity"
                                                           name="txtNSingBussOwnCity" placeholder="City"
                                                           class="form-control" data-parsley-group="wizard-st-1" required/>
                                                </div>
                                            </div>
                                        </div>

                                        <%--TIN--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Taxpayer's Identification Number (TIN)*</label>
                                                    <input type="text" id="txtNSingTaxPayTINNo"
                                                           name="txtNSingTaxPayTINNo" placeholder="TIN (9-12 Digits)"
                                                           class="form-control" data-parsley-group="wizard-st-1" required/>
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
                                        <legend class="pull-left width-full">Business' Information</legend>

                                        <%--Business Name--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Business Name/Trade Name*</label>
                                                    <input type="text" id="txtNSingBussName"
                                                           name="txtNSingBussName"
                                                           placeholder="Business Name/Trade Name" class="form-control"
                                                           data-parsley-group="wizard-st-2" required/>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Business Address--%>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Business Location (Indicate exact address)*</label>
                                                    <input type="text" id="txtNSingBussFlrNo"
                                                           name="txtNSingBussFlrNo"
                                                           placeholder="If within a bldg.., specify stall, room, floor number"
                                                           class="form-control" data-parsley-group="wizard-st-2" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussStrtNo"
                                                           name="txtNSingBussStrtNo" placeholder="Street No."
                                                           class="form-control" data-parsley-group="wizard-st-2" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussStrtName"
                                                           name="txtNSingBussStrtName" placeholder="Street Name"
                                                           class="form-control" data-parsley-group="wizard-st-2" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtNSingBussBrgyName"
                                                           name="txtNSingBussBrgyName" placeholder="Barangay"
                                                           class="form-control" data-parsley-group="wizard-st-2" required/>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Property Index + Lot N Block--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Property Index No.*</label>
                                                    <input type="text" id="txtNSingPropIdxNo"
                                                           name="txtNSingPropIdxNo" placeholder="Property Index No. (14 Digits)"
                                                           class="form-control" data-parsley-group="wizard-st-2" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Lot & Block No.*</label>
                                                    <input type="text" id="txtNSingLotBlckNo"
                                                           name="txtNSingLotBlckNo" placeholder="Lot & Block No."
                                                           class="form-control" data-parsley-group="wizard-st-2" required/>
                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>
                                </div>
                                <!-- end wizard step-2 -->
                                <!-- begin wizard step-3 -->
                                <div class="wizard-st-3">
                                    <fieldset>
                                        <legend class="pull-left width-full">Additional Information</legend>
                                        <!-- begin row -->

                                        <%--First Part--%>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>DTI (Business Name)
                                                        Registration Number*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussDTIRegNo"
                                                               name="txtNSingBussDTIRegNo" placeholder="Registration Number (8 Digits)" class="form-control" data-parsley-group="wizard-st-3" required />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Telephone Number*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussTelNo"
                                                               name="txtNSingBussTelNo" placeholder="Telephone Number"
                                                               class="form-control" data-parsley-group="wizard-st-3" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Fax Number*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussFaxNo"
                                                               name="txtNSingBussFaxNo" placeholder="Fax Number"
                                                               class="form-control" data-parsley-group="wizard-st-3" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Date*</label>
                                                    <input type="text" class="form-control date" id="dateNSingBussDTIReg"
                                                           name="dateNSingBussDTIReg" data-parsley-group="wizard-st-3" required/>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Second Part--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>If Employer, Employer's Social Security Number (SSS)</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingEmpSSSNo"
                                                               name="txtNSingEmpSSSNo" placeholder="SSS Number (9 Digits)"
                                                               class="form-control" data-parsley-group="wizard-st-3" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>No of Employees*</label>
                                                    <div class="controls">
                                                        <input type="number" id="numNSingBussEmpQTY"
                                                               name="numNSingBussEmpQTY" placeholder="No of Employees"
                                                               class="form-control" data-parsley-group="wizard-st-3" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end row -->
                                    </fieldset>
                                </div>
                                <!-- end wizard step-3 -->
                                <!-- begin wizard step-4 -->
                                <div class="wizard-st-4">
                                    <fieldset>
                                        <legend class="pull-left width-full">Additional Information</legend>

                                        <%--Representative--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Name of Authorized Representative*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussRepLName"
                                                               name="txtNSingBussRepLName" placeholder="Last Name"
                                                               class="form-control" data-parsley-group="wizard-st-4" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussRepFName"
                                                               name="txtNSingBussRepFName" placeholder="First Name"
                                                               class="form-control" data-parsley-group="wizard-st-4" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussRepMName"
                                                               name="txtNSingBussRepMName" placeholder="Middle Name"
                                                               class="form-control" data-parsley-group="wizard-st-4" required/>
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
                                                           class="form-control" data-parsley-group="wizard-st-4" required/>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- end wizard step-4 -->
                                <!-- begin wizard step-5 -->
                                <div class="wizard-st-5">
                                    <fieldset>
                                        <legend class="pull-left width-full">Other Information</legend>

                                        <%--If Business Establishment is Rented--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>If Business Establishment is Rented</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control date"
                                                               id="dateNSingBussEstRentStart"
                                                               name="dateNSingBussEstRentStart" placeholder="Since when"
                                                               class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" id="numNSingBussEstRentMonth"
                                                               name="numNSingBussEstRentMonth"
                                                               placeholder="Monthly Rental" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingBussEstRentName"
                                                               name="txtNSingBussEstRentName" placeholder="From Whom"
                                                               class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Signboard--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label> <input type="checkbox" class=""
                                                                   id="chkSignboard"
                                                                   onclick="document.getElementById('numNSingBussEstSignbrdArea').disabled=!this.checked;">
                                                        Using A Signboard
                                                    </label> <input type="text" id="numNSingBussEstSignbrdArea"
                                                                    name="numNSingBussEstSignbrdArea"
                                                                    class="form-control col-md-3"
                                                                    placeholder="Area of Signboard"
                                                                    disabled>
                                                </div>
                                            </div>
                                        </div>


                                    </fieldset>
                                </div>
                                <!-- end wizard step-5 -->
                                <!-- begin wizard step-6 -->
                                <div class="wizard-st-6">
                                    <fieldset>
                                        <legend class="pull-left width-full">If You Have Other Existing Businesss
                                            Permits
                                        </legend>

                                        <%--Other exisiting table--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Existing Kind of Business</label>
                                                    <div class="controls">
                                                        <input type="text" class="form-control" id="txtNSingExBuss"
                                                               name="txtNSingExBuss" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Business Permit No.</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingExBussNo"
                                                               name="txtNSingExBussNo" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Business Location</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingExBussLoc"
                                                               name="txtNSingExBussLoc" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <input type="text" class="form-control" id="txtNSingExBuss1"
                                                               name="txtNSingExBuss1" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingExBussNo1"
                                                               name="txtNSingExBussNo1" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingExBussLoc1"
                                                               name="txtNSingExBussLoc1" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <input type="text" class="form-control" id="txtNSingExBuss2"
                                                               name="txtNSingExBuss2" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingExBussNo2"
                                                               name="txtNSingExBussNo2" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <input type="text" id="txtNSingExBussLoc2"
                                                               name="txtNSingExBussLoc2" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- end wizard step-6 -->
                                <!-- begin wizard step-7 -->
                                <div class="wizard-st-7">
                                    <fieldset>
                                        <legend class="pull-left width-full">Business Nature and Attachment</legend>

                                        <%--Other exisiting table--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Kind/Nature of Business or Activity</label>
                                                    <div class="controls">
                                                        <select class="selectpicker form-control" data-style="btn-white"
                                                                id="txtNSBussAct" name="txtNSBussAct" tabindex="-1" data-parsley-group="wizard-st-7" required>
                                                            <%
                                                                String natureSt = "";
                                                                LGUConnect conX = new LGUConnect();
                                                                try {
                                                                Connection conn3 = conX.getConnection();
                                                                Statement ss3 = conn3.createStatement();
                                                                ResultSet gg3 = ss3.executeQuery("SELECT * FROM `bpls_r_business_nature`");
                                                                while (gg3.next()) {
                                                                    String classification = gg3.getString("BN_CLASSIFICATION");
                                                                    if (classification.equalsIgnoreCase("S")) {
                                                                        natureSt = "Small Scale";
                                                                    } else if (classification.equalsIgnoreCase("L")) {
                                                                        natureSt = "Large Scale";
                                                                    } else {
                                                                        natureSt = "Unidentified";
                                                                    }
                                                            %>
                                                            <option data-subtext="<%=natureSt%>"
                                                                    value="<%out.print(gg3.getInt("BN_ID"));%>">
                                                                <%out.print(gg3.getString("BN_NAME"));%>
                                                            </option>
                                                            <%
                                                                } } catch(SQLException | ClassNotFoundException e){
                                                                    e.printStackTrace();
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label>Unit No./Qty</label>
                                                    <div class="controls">
                                                        <input type="text" id="numNSingBussUnitNo"
                                                               name="numNSingBussUnitNo" class="form-control" data-parsley-group="wizard-st-7" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label>Area (Sq. Mts.)</label>
                                                    <div class="controls">
                                                        <input type="text" id="numNSingBussAreaSqmts"
                                                               name="numNSingBussAreaSqmts" class="form-control" data-parsley-group="wizard-st-7" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Capitalization Subscribed
                                                        or Paid-Up (PHP)</label>
                                                    <div class="controls">
                                                        <input type="currency"
                                                               id="numNSingBussCapitalization"
                                                               name="numNSingBussCapitalization" class="form-control" data-parsley-group="wizard-st-7" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls fileupload-buttonbar">

                                    <span>Add files...</span>
                                    <input type="file" name="fileUnifiedRequirements"
                                           id="fileUnifiedRequirements" accept=".doc,.docx,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf" data-parsley-group="wizard-st-7" required>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- end wizard step-7 -->
                                <!-- begin wizard step-8 -->
                                <div>
                                    <div class="jumbotron m-b-0 text-center">
                                        <h1>Finished!</h1>
                                        <p>Click the "Continue" button to proceed to the next step. Make sure you fill out all of the requirements right to move forward :-)</p>
                                        <p>
                                            <button type="submit" id="submitBtn" class="btn btn-success btn-lg">Continue</button></p>
                                    </div>
                                </div>
                                <!-- end wizard step-8 -->
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

<jsp:include page="BPLSAplSglBusFooter.jsp"></jsp:include>

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
<script src="assets/js/newSingleBussForm.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>