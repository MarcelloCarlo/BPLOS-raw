<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
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
    <link rel="icon" href="extras/logo1.png">

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
                        <h4 class="panel-title">Motorized Tricycle Operator Permit Application Form</h4>
                    </div>
                    <div class="panel-body">
                        <form data-parsley-validate="" novalidate="" enctype="multipart/form-data"
                              name="applicationFormMtops" id="applicationFormMtops">
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
                                        <div class="form-group">
                                            <p>By proceeding in this step. You agreed to the <a data-toggle="modal" data-target="#modal_tc">Terms & Conditions and Privacy Policy</a> of the system.</p>
                                        </div>
                                        <%--Name--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Applicant's Name*</label>
                                                    <input type="text" id="txtApplicantLName"
                                                           name="txtApplicantLName" placeholder="Last Name"
                                                           class="form-control" required
                                                           data-parsley-group="wizard-st-1"/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtApplicantFName"
                                                           name="txtApplicantFName" placeholder="First Name"
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtApplicantMName"
                                                           name="txtApplicantMName" placeholder="Middle Name"
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
                                                           name="BDateApplicant" data-parsle-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Sex</label>
                                                    <div class="controls">
                                                        <select name="genderApplicant" class="form-control">
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                            <option value="Other">Other</option>
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
                                                    <input type="text" id="txtApplicantOwnHsNum"
                                                           name="txtApplicantOwnHsNum" placeholder="House No."
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtApplicantOwnStrt"
                                                           name="txtApplicantOwnStrt" placeholder="Street"
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtApplicantOwnBrgy"
                                                           name="txtApplicantOwnBrgy" placeholder="Barangay"
                                                           class="form-control" data-parsley-group="wizard-st-1"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <input type="text" id="txtApplicantOwnCity"
                                                           name="txtApplicantOwnCity" placeholder="City"
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
                                                        <input type="text" id="txtApplicantTelNo"
                                                               name="txtApplicantTelNo" placeholder="Telephone Number"
                                                               class="form-control" data-parsley-group="wizard-st-2"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Mailing Address*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtApplicantMailAdd"
                                                               name="txtApplicantMailAdd" placeholder="Mailing Address"
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
                                                               name="txtApplicantEmail" placeholder="Email"
                                                               class="form-control" data-parsley-group="wizard-st-2"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                           <%-- <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Plate Number*</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtApplicantPlateNo"
                                                               name="txtApplicantPlateNo" placeholder="Plate Number"
                                                               class="form-control" data-parsley-group="wizard-st-2"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>

                                        <%--Second Part--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>TODA</label>
                                                    <div class="controls">
                                                        <select class="selectpicker form-control" data-style="btn-white"
                                                                id="txtApplicantTODA" name="txtApplicantTODA" tabindex="-1"
                                                                data-parsley-group="wizard-st-7" required>
                                                            <%
                                                                String natureSt = "";
                                                                LGUConnect conX = new LGUConnect();
                                                                try {
                                                                    Connection conn3 = conX.getConnection();
                                                                    Statement ss3 = conn3.createStatement();
                                                                    ResultSet gg3 = ss3.executeQuery("SELECT * FROM mtops_r_toda");
                                                                    while (gg3.next()) {
                                                            %>
                                                            <option value="<%out.print(gg3.getInt("TODA_ID"));%>">
                                                                <%out.print(gg3.getString("TODA_NAME"));%>
                                                            </option>
                                                            <%
                                                                    }
                                                                } catch (SQLException | ClassNotFoundException e) {
                                                                    e.printStackTrace();
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Cards--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>TIN No.*</label>
                                                    <input type="text" id="txtApplicantTINNo"
                                                           name="txtApplicantTINNo" placeholder="TIN (9-12 Digits)"
                                                           class="form-control" data-parsley-group="wizard-st-2"
                                                           required/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Driver's Licence*</label>
                                                    <input type="text" id="txtApplicantDriverLic"
                                                           name="txtApplicantDriverLic" placeholder="Driver's Licence"
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
                                                        <input type="text" id="txtApplicantRepLName"
                                                               name="txtApplicantRepLName" placeholder="Last Name"
                                                               class="form-control" data-parsley-group="wizard-st-3"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtApplicantRepFName"
                                                               name="txtApplicantRepFName" placeholder="First Name"
                                                               class="form-control" data-parsley-group="wizard-st-3"
                                                               required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>&nbsp</label>
                                                    <div class="controls">
                                                        <input type="text" id="txtApplicantRepMName"
                                                               name="txtApplicantRepMName" placeholder="Middle Name"
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
                                                    <input type="text" id="txtApplicantRepAddr"
                                                           name="txtApplicantRepAddr" placeholder="Home Address"
                                                           class="form-control" data-parsley-group="wizard-st-3"
                                                           required/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Birthdate*</label>
                                                    <input type="text" class="form-control date1" id="dateNSingBussEstRentStart"
                                                           name="ApplicantRepBDate" data-parsley-group="wizard-st-3" required/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Sex</label>
                                                    <div class="controls">
                                                        <select name="ApplicantRepgender" class="form-control">
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                            <option value="Other">Other</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" name="ApplicantRepEmail" placeholder="Email"
                                                           class="form-control" data-parsley-group="wizard-st-3"
                                                           required/>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Phone Number</label>
                                                    <input type="text" name="ApplicantRepPhoneNo" placeholder="Phone Number"
                                                           class="form-control" data-parsley-group="wizard-st-3"
                                                           required id="ApplicantRepPhoneNo"
                                                    />
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
                                                        <input type="file" name="ApplicantfileUnifiedRequirements"
                                                               id="ApplicantfileUnifiedRequirements"
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
                                            <button type="submit" id="submitMtopsBtn" class="btn btn-success btn-lg">
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
    <div class="modal fade evaluation-modal-new" id="modal_tc">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-danger">
                        <h4 class="modal-title">Terms & Conditions</h4>
                    </div>
                </div>
                <div class="modal-body col-md-12">
                    <div style="overflow-y: auto;">
                        <p style="margin-left: 0cm; text-indent: 0cm; margin-bottom: 0cm; line-height: 150%"><a name="__DdeLink__157_3723383930"></a>
                            <font face="Calibri Light">Boundaries and Accessibility</font></p>
                        <p style="margin-left: 2.54cm; margin-bottom: 0cm; line-height: 150%">
                            <font face="Calibri Light">1.	The Local Government Unit
                                administration shall enforce boundaries when it comes to information
                                access. Information inside the LGU shall be accessed and processed by
                                an employee for business transactions only.</font></p>
                        <ol start="2">
                            <li><p style="margin-bottom: 0cm; line-height: 150%"><font face="Calibri Light">Accessing
                                confidential information for personal interest and breaking into an
                                individual?s privacy without prior purpose is strictly prohibited.</font></p>
                            <li><p style="margin-bottom: 0cm; line-height: 150%"><font face="Calibri Light">Accountability
                                shall be implemented. Employees shall not acquire information of an
                                individual if it is not related to his/her job.</font></p>
                            <li><p style="margin-bottom: 0cm; line-height: 150%"><font face="Calibri Light">The
                                organization and employees shall comprehend intimately on what their
                                roles are and how far they shall and shall not access.</font></p>
                            <li><p style="margin-bottom: 0cm; line-height: 150%"><a name="_GoBack"></a>
                                <font face="Calibri Light">Information System Providers shall not
                                    amend any of the information inside the LGU-PAEIS unless they are
                                    told by the LGU administration.</font></p>
                        </ol>
                        <h3 class="western"><font face="Calibri Light"><font color="#000000"><font size="2" style="font-size: 11pt">Data
                            protection principles</font></font></font></h3>
                        <p lang="uz-Cyrl-UZ" align="left" style="margin-left: 0cm; text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                            <font color="#43475b"><font face="Calibri Light"><font color="#000000">LGU
                                is committed to processing data in accordance with its
                                responsibilities under the G</font><font color="#000000"><span lang="en-US">eneral
Data Protection Regulation</span></font><font color="#000000">. </font></font></font>
                        </p>
                        <p lang="uz-Cyrl-UZ" align="left" style="margin-left: 0cm; text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                            <font color="#43475b"><font face="Calibri Light"><font color="#000000">Article
                                5 of the GDPR requires that personal data shall be:</font></font></font></p>
                        <ol type="a">
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">processed
                                    lawfully, fairly and in a transparent manner in relation to
                                    individuals;</font></font></font></p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">collected
                                    for specified, explicit and legitimate purposes and not further
                                    processed in a manner that is incompatible with those purposes;
                                    further processing for archiving purposes in the public interest,
                                    scientific or historical research purposes or statistical purposes
                                    shall not be considered to be incompatible with the initial
                                    purposes;</font></font></font></p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">adequate,
                                    relevant and limited to what is necessary in relation to the
                                    purposes for which they are processed;</font></font></font></p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">accurate
                                    and, where necessary, kept up to date; every reasonable step must be
                                    taken to ensure that personal data that are inaccurate, having
                                    regard to the purposes for which they are processed, are erased or
                                    rectified without delay;</font></font></font></p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">kept
                                    in a form which permits identification of data subjects for no
                                    longer than is necessary for the purposes for which the personal
                                    data are processed; personal data may be stored for longer periods
                                    insofar as the personal data will be processed solely for archiving
                                    purposes in the public interest, scientific or historical research
                                    purposes or statistical purposes subject to implementation of the
                                    appropriate technical and organisational measures required by the
                                    G</font><font color="#000000"><span lang="en-US">eneral Data
	Protection Regulation</span></font><font color="#000000"> </font><font color="#000000"><span lang="en-US">
	</span></font><font color="#000000">in order to safeguard the rights
                                    and freedoms of individuals; and</font></font></font></p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">processed
                                    in a manner that ensures appropriate security of the personal data,
                                    including protection against unauthorised or unlawful processing and
                                    against accidental loss, destruction or damage, using appropriate
                                    technical or organisational measures.?</font></font></font></p>
                        </ol>
                        <h3 class="western"><a name="_fc5gzqehz3ij"></a><font face="Calibri Light"><font color="#000000"><font size="2" style="font-size: 11pt">2.
                            General provisions</font></font></font></h3>
                        <ol type="a">
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">This
                                    policy applies to all personal data processed by the </font><font color="#000000"><span lang="en-US">LGU</span></font><font color="#000000">.
                                </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">The
                                    Responsible Person shall take responsibility for the </font><font color="#000000"><span lang="en-US">LGU?</span></font><font color="#000000">s
                                    ongoing compliance with this policy. </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">This
                                    policy shall be reviewed at least annually. </font></font></font>
                            </p>
                        </ol>
                        <h3 class="western"><a name="_oz341whevwr0"></a><a name="_v7qymv8hp0gg"></a>
                            <font face="Calibri Light"><font color="#000000"><font size="2" style="font-size: 11pt"><span lang="en-US">3</span></font></font><font color="#000000"><font size="2" style="font-size: 11pt">.
                                Lawful purposes</font></font></font></h3>
                        <ol type="a">
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">All
                                    data processed by </font><font color="#000000"><span lang="en-US">LGU</span></font><font color="#000000">
                                    must be done on one of the following lawful bases: consent,
                                    contract, legal obligation, vital interests, public task or
                                    legitimate interests </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000"><span lang="en-US">LGU
	</span></font><font color="#000000"> shall note the appropriate
                                    lawful basis in the Register of Systems.</font></font></font></p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">Where
                                    consent is relied upon as a lawful basis for processing data,
                                    evidence of opt-in  consent shall be kept with the personal data. </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">Where
                                    communications are sent to individuals based on their consent, the
                                    option for the individual to revoke their consent should be clearly
                                    available and systems should be in place to ensure such revocation
                                    is reflected accurately in LGU?s systems.  </font></font></font>
                            </p>
                        </ol>
                        <h3 class="western"><a name="_1iq7rjqlje2v"></a><font face="Calibri Light"><font color="#000000"><font size="2" style="font-size: 11pt">5.
                            Data minimisation</font></font></font></h3>
                        <ol type="a">
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000"><span lang="en-US">LGU</span></font><font color="#000000">
                                    shall ensure that personal data are adequate, relevant and limited
                                    to what is necessary in relation to the purposes for which they are
                                    processed. </font></font></font>
                            </p>
                        </ol>
                        <h3 class="western"><a name="_bkwsqo6gr3nc"></a><font face="Calibri Light"><font color="#000000"><font size="2" style="font-size: 11pt">6.
                            Accuracy</font></font></font></h3>
                        <ol type="a">
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000"><span lang="en-US">LGU</span></font><font color="#000000">
                                    shall take reasonable steps to ensure personal data is accurate. </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">Where
                                    necessary for the lawful basis on which data is processed, steps
                                    shall be put in place to ensure that personal data is kept up to
                                    date. </font></font></font>
                            </p>
                        </ol>
                        <h3 class="western"><a name="_893ssflhrxil"></a><font face="Calibri Light"><font color="#000000"><font size="2" style="font-size: 11pt">7.
                            Archiving / removal</font></font></font></h3>
                        <ol type="a">
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">To
                                    ensure that personal data is kept for no longer than necessary, LGU
                                    shall put in place an archiving policy for each area in which
                                    personal data is processed and review this process annually. </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">The
                                    archiving policy shall consider what data should/must be retained,
                                    for how long, and why. </font></font></font>
                            </p>
                        </ol>
                        <h3 class="western"><a name="_vqi3sa1963hz"></a><font face="Calibri Light"><font color="#000000"><font size="2" style="font-size: 11pt">8.
                            Security</font></font></font></h3>
                        <ol type="a">
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">LGU
                                    shall ensure that personal data is stored securely using modern
                                    software that is kept-up-to-date.  </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">Access
                                    to personal data shall be limited to personnel who need access and
                                    appropriate security should be in place to avoid unauthorised
                                    sharing of information. </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">When
                                    personal data is deleted this should be done safely such that the
                                    data is irrecoverable. </font></font></font>
                            </p>
                            <li><p lang="uz-Cyrl-UZ" align="left" style="text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                                <font color="#43475b"><font face="Calibri Light"><font color="#000000">Appropriate
                                    back-up and disaster recovery solutions shall be in place. </font></font></font>
                            </p>
                        </ol>
                        <h3 class="western"><a name="_mblk3j3c3czg"></a><font face="Calibri Light"><font color="#000000"><font size="2" style="font-size: 11pt">9.
                            Breach</font></font></font></h3>
                        <p lang="uz-Cyrl-UZ" align="left" style="margin-left: 0cm; text-indent: 0cm; margin-bottom: 0.35cm; border: none; padding: 0cm; line-height: 100%">
                            <font color="#43475b"><font face="Calibri Light"><font color="#000000">In
                                the event of a breach of security leading to the accidental or
                                unlawful destruction, loss, alteration, unauthorised disclosure of,
                                or access to, personal data, LGU shall promptly assess the risk to
                                people?s rights and freedoms and if appropriate report this breach
                                to </font><font color="#000000"><span lang="en-US">LGU Legal Office.</span></font></font></font></p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-sm btn-primary" data-dismiss="modal">I Agree</button>
                </div>
            </div>
        </div></div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
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
<script src="assets/plugins/jQuery-Mask-Plugin-master/src/jquery.mask.js"></script>
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