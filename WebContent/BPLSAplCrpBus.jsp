<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 9/23/2018
  Time: 2:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
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

<jsp:include page="BPLSAplCrpBusComponent.jsp"></jsp:include>

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
                        <h4 class="panel-title">Business Permit Application Form For Partnership &
                            Corporation</h4>
                    </div>
                    <div class="panel-body">
                        <form enctype="multipart/form-data" id="applicationFormCorp" name="applicationFormCorp"
                              novalidate="" data-parsley-validate="">
                            <div id="wizard">
                                <ol>
                                    <li>
                                        Business' Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Applicant's Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Representative Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Additional Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Other Information
                                        <small></small>
                                    </li>
                                    <li>
                                        Business Nature and Attachement
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
                                        <legend class="pull-left width-full">Business' Information</legend>

                                        <%--Business Name--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Business Name/Trade Name*</label>
                                                    <input type="text" name="txtNCorpBussName"
                                                           id="txtNCorpBussName"
                                                           placeholder="Business Name/Trade Name"
                                                           data-parsley-group="wizard-st-1" class="form-control"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>President*</label>
                                                    <input type="text" name="txtNCorpPresidentName"
                                                           id="txtNCorpPresidentName"
                                                           placeholder="Business Name/Trade Name" class="form-control"
                                                           required data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Business Address--%>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Business Location (Indicate exact address)*</label>
                                                    <input type="text" name="txtNCorpBussFlrNo"
                                                           id="txtNCorpBussFlrNo"
                                                           placeholder="If within a bldg.., specify stall, room, floor number"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" name="txtNCorpBussStrtNo"
                                                           placeholder="Street No."
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" name="txtNCorpBussStrtName"
                                                           placeholder="Street Name"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" name="txtNCorpBussBrgyName"
                                                           placeholder="Barangay"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Property Index + Lot N Block--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Property Index No.*</label>
                                                    <input type="text" name="txtNCorpPropIdxNo"
                                                           placeholder="Property Index No."
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Lot & Block No.*</label>
                                                    <input type="text" name="txtNCorpLotBlckNo"
                                                           placeholder="Lot & Block No."
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>
                                </div>
                                <!-- end wizard step-1 -->
                                <!-- begin wizard step-2 -->
                                <div class="wizard-st-2">
                                    <fieldset>
                                        <legend class="pull-left width-full">Applicant's Information</legend>
                                        <!-- begin row -->

                                        <%--Name--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Taxpayer's Name*</label>
                                                    <input type="text" id="txtNSingTaxPayLName"
                                                           name="txtNSingTaxPayLName" placeholder="Taxpayer's Name"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-2"/>
                                                </div>
                                            </div>
                                            <%--<div class="col-md-4">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>&nbsp</label>--%>
                                            <%--<input type="text" name="txtNCorpTaxPayName"--%>
                                            <%--id="txtNCorpTaxPayName" placeholder="First Name"--%>
                                            <%--class="form-control" required/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--<div class="col-md-4">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>&nbsp</label>--%>
                                            <%--<input type="text" id="txtNSingTaxPayMName"--%>
                                            <%--name="txtNSingTaxPayMName" placeholder="Middle Name"--%>
                                            <%--class="form-control" required/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                        </div>

                                        <%--TIN--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Taxpayer's Identification Number (TIN)*</label>
                                                    <input type="text" name="txtNCorpTaxPayTINNo" placeholder="TIN"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-2"/>
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
                                        <legend class="pull-left width-full">Additional Information</legend>

                                        <%--Representative--%>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label>Name of Authorized Representative*</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNCorpAuthRepName"
                                                               placeholder="Last Name"
                                                               class="form-control" data-parsley-group="wizard-st-3"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="col-md-4">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>&nbsp</label>--%>
                                            <%--<div class="controls">--%>
                                            <%--<input type="text" id="txtNSingBussRepFName"--%>
                                            <%--name="txtNSingBussRepFName" placeholder="First Name"--%>
                                            <%--class="form-control"/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--<div class="col-md-4">--%>
                                            <%--<div class="form-group">--%>
                                            <%--<label>&nbsp</label>--%>
                                            <%--<div class="controls">--%>
                                            <%--<input type="text" id="txtNSingBussRepMName"--%>
                                            <%--name="txtNSingBussRepMName" placeholder="Middle Name"--%>
                                            <%--class="form-control"/>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Position (Official Capacity)*</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNCorpAuthRepPos"
                                                               placeholder="Position"
                                                               class="form-control" data-parsley-group="wizard-st-3"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Address--%>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Home Address of Representative*</label>
                                                    <input type="text" name="txtNCorpAuthRepStrtNo"
                                                           placeholder="Street No."
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-3"/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" name="txtNCorpAuthRepStrtName"
                                                           placeholder="Street Name"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-3"/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" name="txtNCorpAuthRepBrgyName"
                                                           placeholder="Barangay"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-3"/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" name="txtNCorpAuthRepCity" placeholder="City"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-3"/>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- end wizard step-3 -->
                                <!-- begin wizard step-4 -->
                                <div class="wizard-st-4">
                                    <fieldset>
                                        <legend class="pull-left width-full">Additional Information</legend>
                                        <!-- begin row -->

                                        <%--First Part--%>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>SEC Registration Number*</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNCorpBussSECRegNo" placeholder="SEC
                                                        Registration Number" class="form-control"
                                                               data-parsley-group="wizard-st-4" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Date Issued*</label>
                                                    <input type="text" class="form-control" id="dateNCorpBussSECReg"
                                                           name="dateNCorpBussSECReg" required
                                                           data-parsley-group="wizard-st-4"/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Telephone Number*</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNCorpTelNo"
                                                               placeholder="Telephone Number"
                                                               class="form-control" data-inputmask="'mask': '999-9999'"
                                                               required data-parsley-group="wizard-st-4"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Fax Number*</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNCorpFaxNo" placeholder="Fax Number"
                                                               class="form-control" data-inputmask="'mask': '999-9999'"
                                                               required data-parsley-group="wizard-st-4"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Second Part--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>If Employer, Employer's Social Security Number (SSS)</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNCorpEmpSSSNo"
                                                               placeholder="SSS Number"
                                                               class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>No of Employees*</label>
                                                    <div class="controls">
                                                        <input type="number" name="numNCorpEmpQTY"
                                                               placeholder="No of Employees"
                                                               class="form-control" data-parsley-group="wizard-st-4"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end row -->
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
                                                        <input type="text" class="form-control"
                                                               id="dateNCorpBussEstRentStart"
                                                               name="dateNCorpBussEstRentStart" placeholder="Since when"
                                                               class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" name="numNCorpBussEstRentMonth"
                                                               placeholder="Monthly Rental" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" name="txtNCorpBussEstRentName"
                                                               placeholder="From Whom"
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
                                                                   onclick="document.getElementById('numNCorpBussEstSignbrdArea').disabled=!this.checked;">
                                                        Using A Signboard
                                                    </label> <input type="text" name="numNCorpBussEstSignbrdArea"
                                                                    id="numNCorpBussEstSignbrdArea"
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
                                        <legend class="pull-left width-full">Business Nature and Attachement</legend>

                                        <%--Other exisiting table--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Kind/Nature of Business or Activity</label>
                                                    <div class="controls">
                                                        <select class="selectpicker form-control" data-style="btn-white"
                                                                id="txtNCBussAct" name="txtNCBussAct" tabindex="-1"
                                                                required data-parsley-group="wizard-st-7">
                                                            <%
                                                                String natureSt = "";
                                                                LGUConnect conX = new LGUConnect();
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
                                                        <input type="text" id="numNCorpBussUnitNo"
                                                               name="numNCorpBussUnitNo" class="form-control" required
                                                               data-parsley-group="wizard-st-7"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label>Area (Sq. Mts.)</label>
                                                    <div class="controls">
                                                        <input type="text" id="numNCorpBussAreaSqmts"
                                                               name="numNCorpBussAreaSqmts" class="form-control"
                                                               required data-parsley-group="wizard-st-7"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Capitalization Subscribed
                                                        or Paid-Up (PHP)</label>
                                                    <div class="controls">
                                                        <input type="currency"
                                                               id="numNCorpBussCapitalization"
                                                               name="numNCorpBussCapitalization" required
                                                               data-parsley-group="wizard-st-7" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="controls fileupload-buttonbar">
                                                       <span class="btn btn-success fileinput-button">
                                    <i class="fa fa-plus"></i>
                                    <span>Add files...</span>
                                    <input type="file" name="fileUnifiedRequirements"
                                           id="fileUnifiedRequirements" required="required"
                                           accept=".doc,.docx,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf"
                                           data-parsley-group="wizard-st-7">
                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- end wizard step-6 -->
                                <!-- begin wizard step-7 -->
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
                                <!-- end wizard step-7 -->
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

<jsp:include page="BPLSAplCrpBusFooter.jsp"></jsp:include>

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
<script src="assets/plugins/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/parsleyjs/dist/parsley.min.js"></script>
<script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/newSingleFormApplValidation.js"></script>
<script src="assets/js/form-plugins.demo.min.js"></script>
<script src="assets/js/form-multiple-upload.demo.min.js"></script>
<script src="assets/js/newCorpBussForm.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>