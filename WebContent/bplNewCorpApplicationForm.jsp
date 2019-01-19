<%--
  Created by IntelliJ IDEA.
  User: John Carlo Villar
  Date: 08/07/2018
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
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
    <link href="assets/plugins/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="assets/plugins/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="assets/plugins/css/nprogress.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="assets/plugins/google-code-prettify/bin/prettify.min.css"
          rel="stylesheet">
    <!-- Select2 -->
    <link href="assets/plugins/select2/dist/css/select2.min.css"
          rel="stylesheet">
    <!-- Switchery -->
    <link href="assets/plugins/switchery/dist/switchery.min.css"
          rel="stylesheet">
    <!-- starrr -->
    <link href="assets/plugins/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link
            href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css"
            rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link
            href="assets/plugins/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css"
            rel="stylesheet">
    <!-- iCheck -->
    <link href="assets/plugins/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="assets/plugins/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- page content -->
        <!-- page content -->
        <div class="col-md-12 col-sm-12 col-xs-12">
            <form class="form-horizontal form-label-left"
                  enctype="multipart/form-data" id="applicationFormCorp" name="applicationFormCorp"
                  novalidate="" data-parsley-validate="">
                <div class="x_panel">
                    <div class="x_title">
                        <h4>Business Permit Application Form For Partnership &
                            Corporation</h4>
                    </div>
                    <div class="x_content">
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <label class="control-label col-md-3">Business
                                    Name/Trade Name <span class="required">*</span>
                                </label>
                                <div class="col-md-5">
                                    <input type="text" name="txtNCorpBussName"
                                           id="txtNCorpBussName" required="required"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="form-group col-xs-12">
                                <label class="control-label col-md-3">Taxpayer's Name <span
                                        class="required">*</span>
                                </label>
                                <div class="col-md-5">
                                    <input type="text" name="txtNCorpTaxPayName"
                                           id="txtNCorpTaxPayName" placeholder="" required="required"
                                           class="form-control col-md-3 col-sm-3 col-xs-12">
                                </div>
                            </div>
                            <div class="form-group col-xs-12">
                                <label class="control-label col-md-3">President <span
                                        class="required">*</span>
                                </label>
                                <div class="col-md-5">
                                    <input type="text" name="txtNCorpPresidentName"
                                           id="txtNCorpPresidentName" placeholder="" required="required"
                                           class="form-control col-md-3 col-sm-3 col-xs-12">
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>Business Location
                                        <small>(Indicate
                                            exact address)
                                        </small>
                                        <span class="required">*</span>
                                    </label>
                                </div>
                                <div class="form-group col-xs-12">
                                    <div class="col-md-4">
                                        <input type="text" name="txtNCorpBussFlrNo"
                                               id="txtNCorpBussFlrNo"
                                               placeholder="If within a bldg.., specify stall, room, floor number"
                                               required="required"
                                               class="form-control col-md-4 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" name="txtNCorpBussStrtNo"
                                               placeholder="Street No." required="required"
                                               class="form-control col-md-2 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" name="txtNCorpBussStrtName"
                                               placeholder="Street Name" required="required"
                                               class="form-control col-md-3 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" name="txtNCorpBussBrgyName"
                                               placeholder="Barangay" required="required"
                                               class="form-control col-md-3 col-sm-3 col-xs-12">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div>
                                    <div class="form-group col-md-12">
                                        <div class="col-md-4">
                                            <label>Property Index No. <span class="required">*</span>
                                            </label> <input type="text" name="txtNCorpPropIdxNo"
                                                            class="form-control" placeholder=" " required="required">
                                        </div>

                                        <div class="col-md-4">
                                            <label>Lot & Block No. <span class="required">*</span>
                                            </label> <input type="text" name="txtNCorpLotBlckNo"
                                                            class="form-control" placeholder=" " required="required">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">

                                <div class="form-group col-md-12">
                                    <div class="col-md-4">
                                        <label>Authorized Representative <span
                                                class="required">*</span>
                                        </label> <input type="text" name="txtNCorpAuthRepName"
                                                        class="form-control" placeholder=" " required="required">
                                    </div>

                                    <div class="col-md-4">
                                        <label>Position (Official Capacity) <span
                                                class="required">*</span>
                                        </label> <input type="text" name="txtNCorpAuthRepPos"
                                                        class="form-control" placeholder=" " required="required">
                                    </div>

                                </div>

                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>Home Address of Representative <span
                                            class="required">*</span>
                                    </label>
                                </div>
                                <div class="form-group col-xs-12">
                                    <div class="col-md-2">
                                        <input type="text" name="txtNCorpAuthRepStrtNo"
                                               placeholder="Street No." required="required"
                                               class="form-control col-md-2 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" name="txtNCorpAuthRepStrtName"
                                               placeholder="Street Name" required="required"
                                               class="form-control col-md-3 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" name="txtNCorpAuthRepBrgyName"
                                               placeholder="Barangay" required="required"
                                               class="form-control col-md-3 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" name="txtNCorpAuthRepCity"
                                               placeholder="City" required="required"
                                               class="form-control col-md-4 col-sm-3 col-xs-12">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12">
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <label>SEC Registration Number <span class="required">*</span>
                                        </label> <input type="text" name="txtNCorpBussSECRegNo"
                                                        class="form-control" placeholder=" " required="required">
                                    </div>

                                    <div class="col-md-2">
                                        <label class="control-label">Date Issued <span
                                                class="required">*</span>
                                        </label>
                                        <div class="input-group">
                                            <input type="text" class="form-control date"
                                                   name="dateNCorpBussSECReg" id="dateNCorpBussSECReg"
                                                   required="required" data-inputmask="'mask': '99-99-9999'">
                                            <span class="input-group-addon"> <span
                                                    class="glyphicon glyphicon-calendar"></span>
												</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group col-md-10">
                                    <label class="control-label col-md-4">Taxpayer's
                                        Identification Number (TIN) <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" name="txtNCorpTaxPayTINNo"
                                               required="required" class="form-control col-md-6 col-xs-12">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <label>Telephone Number <span class="required">*</span>
                                        </label> <input type="text" name="txtNCorpTelNo" class="form-control"
                                                        placeholder=" " required="required"
                                                        data-inputmask="'mask': '999-9999'">
                                    </div>
                                    <div class="col-md-4">
                                        <label>Fax Number <span class="required">*</span>
                                        </label> <input type="text" name="txtNCorpFaxNo" class="form-control"
                                                        placeholder=" " required="required"
                                                        data-inputmask="'mask': '999-9999'">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div>
                                    <div class="form-group col-md-12">
                                        <div class="col-md-4">
                                            <label>If Employer, Employer's Social Security
                                                Number (SSS) <span class="required">*</span>
                                            </label> <input type="text" name="txtNCorpEmpSSSNo"
                                                            class="form-control" placeholder=" " required="required">
                                        </div>

                                        <div class="col-md-3">
                                            <label>No of Employees <span class="required">*</span>
                                            </label> <input type="number" name="numNCorpEmpQTY"
                                                            class="form-control number" placeholder=" "
                                                            required="required">
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>If Business Establishment is Rented <span
                                            class="required">*</span>
                                    </label>
                                </div>
                                <div class="form-group col-xs-12">
                                    <div class="col-md-3">
                                        <label class="control-label">Since When <span
                                                class="required">*</span>
                                        </label>
                                        <div class="input-group">
                                            <input type="text" class="form-control date"
                                                   name="dateNCorpBussEstRentStart"
                                                   id="dateNCorpBussEstRentStart" required="required"
                                                   data-inputmask="'mask': '99-99-9999'"> <span
                                                class="input-group-addon"> <span
                                                class="glyphicon glyphicon-calendar"></span>
												</span>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="control-label">Monthly Rental <span
                                                class="required">*</span>
                                        </label> <input type="number" name="numNCorpBussEstRentMonth"
                                                        required="required"
                                                        class="form-control col-md-2 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <label class="control-label">From Whom <span
                                                class="required">*</span>
                                        </label> <input type="text" name="txtNCorpBussEstRentName"
                                                        required="required"
                                                        class="form-control col-md-3 col-sm-3 col-xs-12">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <div class="col-md-4">
                                    <label> <input type="checkbox" class=""
                                                   id="chkSignboard"
                                                   onclick="document.getElementById('numNCorpBussEstSignbrdArea').disabled=!this.checked;">
                                        Using A Signboard
                                    </label> <input type="text" name="numNCorpBussEstSignbrdArea"
                                                    id="numNCorpBussEstSignbrdArea"
                                                    class="form-control col-md-3" placeholder="Area of Signboard"
                                                    disabled>
                                </div>

                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>If You Have Other Existing Businesss Permits <span
                                            class="required">*</span>
                                    </label>
                                </div>
                                <div class="form-group col-xs-12">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Existing Kind of Business</th>
                                            <th>Business Permit No.</th>
                                            <th>Business Location</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td><input type="text" name="txtNCorpExBuss">
                                            </td>
                                            <td><input type="text" name="txtNCorpExBussNo">
                                            </td>
                                            <td><input type="text" name="txtNCorpExBussLoc">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td><input type="text" name="txtNCorpExBuss1">
                                            </td>
                                            <td><input type="text" name="txtNCorpExBussNo1">
                                            </td>
                                            <td><input type="text" name="txtNCorpExBussLoc1">
                                            </td>


                                        </tr>
                                        <tr>
                                            <td><input type="text" name="txtNCorpExBuss2">
                                            </td>
                                            <td><input type="text" name="txtNCorpExBussNo2">
                                            </td>
                                            <td><input type="text" name="txtNCorpExBussLoc2">
                                            </td>


                                        </tr>
                                        <tr>
                                            <td><input type="text" name="txtNCorpExBuss3">
                                            </td>
                                            <td><input type="text" name="txtNCorpExBussNo3">
                                            </td>
                                            <td><input type="text" name="txtNCorpExBussLoc3">
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <div class="col-xs-12">
                                <div class="form-group col-xs-12">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Kind or Nature of Business/Activity Applied <br>
                                                <small>Please state nature of business in
                                                    accordance with QC Business Activity Classification
                                                    Standard
                                                </small>
                                            </th>
                                            <th>Unit <br>
                                                <small>No./Qty</small>
                                            </th>
                                            <th>Area <br>
                                                <small>Sq. Mts.</small>
                                            </th>
                                            <th>Capitalization <br>
                                                <small>Subscribed
                                                    or Paid-Up
                                                </small>
                                                (PHP)
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td><select class="select2_single form-control"
                                                        id="txtNCBussAct" name="txtNCBussAct" tabindex="-1">
                                                <%

                                                    LGUConnect conX = new LGUConnect();
                                                    Connection conn3 = conX.getConnection();
                                                    Statement ss3 = conn3.createStatement();
                                                    ResultSet gg3 = ss3.executeQuery("SELECT * FROM `lgu_r_business_nature`");
                                                    while (gg3.next()) {
                                                %>
                                                <option value="<%out.print(gg3.getInt("BN_ID"));%>">
                                                    <%out.print(gg3.getString("BN_NAME"));%>
                                                </option>
                                                <%

                                                    }
                                                %>
                                            </select></td>
                                            <td><input type="text" name="numNCorpBussUnitNo">
                                            </td>
                                            <td><input type="text" name="numNCorpBussAreaSqmts">
                                            </td>
                                            <td><input type="text"
                                                       name="numNCorpBussCapitalization"></td>
                                        </tr>
                                        <!-- <tr>
                                    <td>
                                        <input type="text" name="txtNCorpAct1">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussUnitNo1">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussAreaSqmts1">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussCapitalization1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="txtNCorpAct2">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussUnitNo2">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussAreaSqmts2">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussCapitalization2">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="txtNCorpAct3">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussUnitNo3">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussAreaSqmts3">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussCapitalization3">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="txtNCorpAct4">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussUnitNo4">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussAreaSqmts4">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussCapitalization4">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="txtNCorpAct5">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussUnitNo5">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussAreaSqmts5">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussCapitalization5">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="txtNCorpAct6">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussUnitNo6">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussAreaSqmts6">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussCapitalization6">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="txtNCorpAct7">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussUnitNo7">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussAreaSqmts7">
                                    </td>
                                    <td>
                                        <input type="text" name="numNCorpBussCapitalization7">
                                    </td>
                                </tr> -->
                                        </tbody>
                                    </table>
                                    <!--  <label>TOTAL: Php </label> -->
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label" for="fileUnifiedRequirements">Unified
                                        File Requirements: (.doc,.docx,.pdf, and must be maximum of
                                        10MB)<span class="required">*</span>
                                    </label><br> <label class="control-label">Locational
                                    Sketch of Business Establishment </label><br> <label
                                        class="control-label">Orginal Copy of Barangay
                                    Clearance </label><br> <label class="control-label">SEC
                                    Registration File </label><br> <label class="control-label">Title
                                    To Property / Tax Declaration (If Owned) or Contract of Lease
                                    (If Renting) </label><br> <label class="control-label">Lessor's
                                    Business Permit (If Rented) </label><br> <label
                                        class="control-label">Authorization Letter w/ ID
                                    (Both Business Owner & Filer) </label><br> <label
                                        class="control-label">Other Required Document/s </label><br>
                                    <input type="file" name="fileUnifiedRequirements"
                                           id="fileUnifiedRequirements" required="required"
                                           accept=".doc,.docx,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf"/>
                                </div>
                                <!-- <div class="form-group">
                                <label class="control-label">Orginal Copy of Barangay Clearance
                                    <span class="required">*</span>
                                </label>
                                <input type="file" name="fileNCorpBrgyClear" required="required"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">SEC Registration File
                                    <span class="required">*</span>
                                </label>
                                <input type="file" name="fileNCorpSECreg" required="required"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Title To Property / Tax Declaration (If Owned) or
                                    Contract of Lease (If Renting)
                                    <span class="required">*</span>
                                </label>
                                <input type="file" name="fileNCorpTitleProp" required="required"/>
                            </div>
                            <div class="form-group">
                                <label>Lessor's Business Permit (If Rented)
                                    <span class="required">*</span>
                                </label>
                                <input type="file" name="fileNCorpLessorBussPermit" required="required"/>
                            </div>
                            <div class="form-group">
                                <label>Authorization Letter w/ ID (Both Business Owner & Filer)
                                    <span class="required">*</span>
                                </label>
                                <input type="file" name="fileNCorpAuthLetterID" required="required"/>
                            </div>
                            <div class="form-group">
                                <label>Other Required Document/s
                                    <span class="required">*</span>
                                </label>
                                <input type="file" name="fileNCorpOthers" required="required" multiple="true"/>
                            </div> -->
                            </div>
                        </div>
                    </div>

                    <div class="center col-md-7">
                        <button type="submit" class="btn btn-primary">APPLY</button>
                    </div>

                </div>
            </form>
        </div>
        <!-- /page content -->

        <jsp:include page="/footer.jsp"></jsp:include>
    </div>
</div>
<!-- jQuery -->
<script src="assets/plugins/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="assets/plugins/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="assets/plugins/js/fastclick.js"></script>
<!-- NProgress -->
<script src="assets/plugins/js/nprogress.js"></script>
<script src="assets/plugins/iCheck/icheck.min.js"></script>
<!-- NProgress -->
<script src="assets/plugins/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script
        src="assets/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="assets/plugins/iCheck/icheck.min.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="assets/plugins/moment/min/moment.min.js"></script>
<script
        src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-datetimepicker -->
<script
        src="assets/plugins/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<!-- bootstrap-wysiwyg -->
<script
        src="assets/plugins/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="assets/plugins/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="assets/plugins/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="assets/plugins/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="assets/plugins/switchery/dist/switchery.min.js"></script>
<!-- Select2 -->
<script src="assets/plugins/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="assets/plugins/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="assets/plugins/autosize/dist/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script
        src="assets/plugins/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="assets/plugins/starrr/dist/starrr.js"></script>
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<!-- jquery.inputmask -->
<script
        src="assets/plugins/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="assets/plugins/js/custom.min.js"></script>
<!-- Initialize datetimepicker -->
<script> /*  $(document).ready(function () {
                                                                                                                                        var numTxtbx = $('#numNCorpBussEstSignbrdArea');
                                                                                                                                        //$(numTxtbx).prop('disabled', true);
                                                                                                                                        $(numTxtbx).hide();

                                                                                                                                        $('#chkSignboard').change(function () {
                                                                                                                                            if ($(numTxtbx).prop('disabled')) {
                                                                                                                                                $(numTxtbx).prop('disabled', false);
                                                                                                                                            } else $(numTxtbx).prop('disabled', true);
                                                                                                                                        });

                                                                                                                                        $(numTxtbx).click(function () {
                                                                                                                                            alert('Enabled!');
                                                                                                                                        });
                                                                                                                                    }); */
$('#dateNCorpBussSECReg').datetimepicker({
    format: 'DD.MM.YYYY'
});
$('#dateNCorpBussEstRentStart').datetimepicker({
    format: 'DD.MM.YYYY'
});
</script>
<script>
    $(function () {
        $('#applicationFormCorp').parsley().on('field:validated', function () {
            var ok = $('.parsley-error').length === 0;
            $('.bs-callout-info').toggleClass('hidden', !ok);
            $('.bs-callout-warning').toggleClass('hidden', ok);

        })
            .on('form:submit', function () {
                swal.mixin({
                    confirmButtonText: 'Next &rarr;',
                    showCancelButton: true,
                    progressSteps: ['1', '2']
                }).queue([{
                    title: 'Terms & Conditions',
                    text: 'Chaining swal2 modals is easy'
                },
                    'Confirm?',
                ]).then((result) = > {
                    if(result.value
            )
                {
                    var formApplicationFormCorp = $('#applicationFormCorp')[0];
                    var dataApplicationFormCorp = new FormData(formApplicationFormCorp);
                    $.ajax({
                        type: "POST",
                        enctype: "multipart/form-data",
                        url: "uploadCorpAppForm",
                        data: dataApplicationFormCorp,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            swal({
                                type: 'success',
                                title: 'All Done!',
                                html: 'Your Reference Number (Save It!): <b>' + JSON.stringify(response) + '</b>'

                            })
                        }
                    });
                }
            })
                return false;
            });
    });
</script>
</body>

</html>