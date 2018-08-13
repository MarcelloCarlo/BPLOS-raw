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
            <!-- iCheck -->
            <link href="build/iCheck/skins/flat/green.css" rel="stylesheet">
            <!-- Custom Theme Style -->
            <link href="build/css/custom.min.css" rel="stylesheet">
        </head>

        <body class="nav-md">
            <div class="container body">
                <div class="main_container">
                    <!-- page content -->
                    <!-- page content -->
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <form class="form-horizontal form-label-left" id="applicationFormSingle" novalidate="" data-parsley-validate="" enctype="multipart/form-data" method="POST">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h4>Business Permit Application Form For Single Propriertorship</h4>
                                </div>
                                <div class="x_content">
                                    <div class="row">
                                        <div class="form-group col-xs-12">
                                            <label class="control-label col-md-3" for="txtNSingBussName">Business Name/Trade Name
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-7">
                                                <input type="text" id="txtNSingBussName" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group col-xs-12">
                                            <label class="control-label col-md-2" for="txtNSingTaxPayLName">Taxpayer's Name
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-3">
                                                <input type="text" id="txtNSingTaxPayLName" placeholder="Last Name" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" id="txtNSingTaxPayFName" placeholder="First Name" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" id="txtNSingTaxPayMName" placeholder="Middle Name" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">

                                            <div class="form-group">
                                                <label>Home Address of Business Owner
                                                    <span class="required">*</span>
                                                </label>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNSingBussOwnHsNum" placeholder="House No." required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNSingBussOwnStrt" placeholder="Street" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNSingBussOwnBrgy" placeholder="Barangay" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNSingBussOwnCity" placeholder="City/Min." required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label>Business Location
                                                    <small>(Indicate exact address)</small>
                                                    <span class="required">*</span>
                                                </label>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <div class="col-md-4">
                                                    <input type="text" id="txtNSingBussFlrNo" placeholder="If within a bldg.., specify stall, room, floor number" required="required"
                                                        class="form-control col-md-4 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-2">
                                                    <input type="text" id="txtNSingBussStrtNo" placeholder="Street No." required="required" class="form-control col-md-2 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNSingBussStrtName" placeholder="Street Name" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNSingBussBrgyName" placeholder="Barangay" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div>
                                                <div class="form-group col-md-12">
                                                    <div class="col-md-4">
                                                        <label for="txtNSingPropIdxNo">Property Index No.
                                                            <span class="required">*</span>
                                                        </label>
                                                        <input type="text" id="txtNSingPropIdxNo" class="form-control" placeholder=" " required="required">
                                                    </div>

                                                    <div class="col-md-4">
                                                        <label for="txtNSingLotBlckNo">Lot & Block No.
                                                            <span class="required">*</span>
                                                        </label>
                                                        <input type="text" id="txtNSingLotBlckNo" class="form-control" placeholder=" " required="required">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group col-md-10">
                                                <label class="control-label col-md-4" for="txtNSingTaxPayTINNo">Taxpayer's Identification Number (TIN)
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" id="txtNSingTaxPayTINNo" required="required" class="form-control col-md-6 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12">
                                            <div class="form-group">
                                                <div class="col-md-4">
                                                    <label for="txtNSingBussDTIRegNo">DTI (Business Name) Registration Number
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNSingBussDTIRegNo" class="form-control" placeholder=" " required="required">
                                                </div>

                                                <div class="col-md-2">
                                                    <label for="dateXS" class="control-label">Date
                                                        <span class="required">*</span>
                                                    </label>
                                                    <div class="input-group date" id="dateXS">
                                                        <input type="text" class="form-control" id="dateNSingBussDTIReg" required="required">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="col-md-4">
                                                    <label for="txtNSingBussTelNo">Telephone Number
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNSingBussTelNo" class="form-control" placeholder=" " required="required">
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="txtNSingBussFaxNo">Fax Number
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNSingBussFaxNo" class="form-control" placeholder=" " required="required">
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="col-xs-12">

                                            <div class="form-group">
                                                <div class="col-md-4">
                                                    <label for="txtNSingEmpSSSNo">If Employer, Employer's Social Security Number (SSS)
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNSingEmpSSSNo" class="form-control col-md-7 col-sm-12" placeholder=" " required="required">
                                                </div>

                                                <div class="col-md-4">
                                                    <label for="numNSingBussEmpQTY">No of Employees
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="number" id="numNSingBussEmpQTY" class="form-control " placeholder=" " required="required">
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label>Name & Address of Authorized Representative
                                                    <span class="required">*</span>
                                                </label>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNSingBussRepLName" placeholder="Last Name" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-2">
                                                    <input type="text" id="txtNSingBussRepFName" placeholder="First Name" required="required" class="form-control col-md-2 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNSingBussRepMName" placeholder="Middle Name" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" id="txtNSingBussRepAddr" placeholder="Home Address" required="required" class="form-control col-md-4 col-sm-3 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label>If Business Establishment is Rented
                                                    <span class="required">*</span>
                                                </label>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <div class="col-md-3">
                                                    <label for="dateXS" class="control-label">Since When
                                                        <span class="required">*</span>
                                                    </label>
                                                    <div class="input-group date" id="dateX2">
                                                        <input type="text" class="form-control" id="dateNSingBussEstRentStart" required="required">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <label class="control-label">Monthly Rental
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="number" id="numNSingBussEstRentMonth" required="required" class="form-control col-md-2 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="control-label">From Whom
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNSingBussEstRentName" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="col-md-4">
                                                <label>
                                                    <input type="checkbox" class="" id="chkSignboard" onclick="document.getElementById('numNSingBussEstSignbrdArea').disabled=!this.checked;"> Using A Signboard
                                                </label>
                                                <input type="text" id="numNSingBussEstSignbrdArea" class="form-control col-md-3" placeholder="Area of Signboard" disabled>
                                            </div>

                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label>If You Have Other Existing Businesss Permits
                                                    <span class="required">*</span>
                                                </label>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Existing Kind of Business
                                                            </th>
                                                            <th>Business Permit No.
                                                            </th>
                                                            <th>Business Location
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSingExBuss">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNSingExBussNo">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNSingExBussLoc">
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSingExBuss1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNSingExBussNo1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNSingExBussLoc1">
                                                            </td>


                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSingExBuss2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNSingExBussNo2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNSingExBussLoc2">
                                                            </td>


                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSingExBuss3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNSingExBussNo3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNSingExBussLoc3">
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
                                                            <th>Kind or Nature of Business/Activity Applied
                                                                <br>
                                                                <small>Please state nature of business in accordance with QC Business
                                                                    Activity Classification Standard</small>
                                                            </th>
                                                            <th>Unit
                                                                <br>
                                                                <small>No./Qty</small>
                                                            </th>
                                                            <th>Area
                                                                <br>
                                                                <small>Sq. Mts.</small>
                                                            </th>
                                                            <th>Capitalization
                                                                <br>
                                                                <small>Subscribed or Paid-Up</small> (PHP)
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSBussAct">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussUnitNo">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussAreaSqmts">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussCapitalization">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSBussAct1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussUnitNo1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussAreaSqmts1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussCapitalization1">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSBussAct2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussUnitNo2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussAreaSqmts2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussCapitalization2">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSBussAct3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussUnitNo3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussAreaSqmts3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussCapitalization3">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSBussAct4">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussUnitNo4">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussAreaSqmts4">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussCapitalization4">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSBussAct5">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussUnitNo5">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussAreaSqmts5">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussCapitalization5">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSBussAct6">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussUnitNo6">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussAreaSqmts6">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussCapitalization6">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNSBussAct7">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussUnitNo7">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussAreaSqmts7">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNSingBussCapitalization7">
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <label>TOTAL: Php </label>
                                            </div>

                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label  class="control-label" for="fileNSingLocSketchEst">Locational Sketch of Business Establishment
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNSingLocSketchEst" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="fileNSingBrgyClear">Orginal Copy of Barangay Clearance
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNSingBrgyClear" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="fileNSingDTIreg">DTI Registration File
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNSingDTIreg" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="fileNSingTitleProp">Title To Property / Tax Declaration (If Owned) or Contract of Lease (If Renting)
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNSingTitleProp" />
                                            </div>
                                            <div class="form-group">
                                                <label>Lessor's Business Permit (If Rented)
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNSingLessorBussPermit" />
                                            </div>
                                            <div class="form-group">
                                                <label>Authorization Letter w/ ID (Both Business Owner & Filer)
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNSingAuthLetterID" />
                                            </div>
                                            <div class="form-group">
                                                <label>Other Required Document/s
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNsingOthers" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="center col-md-7">
                                    <button type="submit" class="btn btn-primary">APPLY
                                    </button>
                                </div>

                            </div>
                        </form>
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
            <script src="build/sweetalert2/dist/sweetalert2.all.min.js"></script>
            <!-- Custom Theme Scripts -->
            <script src="build/js/custom.min.js"></script>
            <!-- Initialize datetimepicker -->
            <script>
                /*   $(document).ready(function () {
                                                                                                                                    var numTxtbx = $('#numNSingBussEstSignbrdArea');
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
                $('#dateXS').datetimepicker({
                    format: 'DD.MM.YYYY'
                });
                $('#dateX2').datetimepicker({
                    format: 'DD.MM.YYYY'
                });
            </script>
            <script>
                $(document).ready(function () {
                    $('none').click(function () {
                        swal.mixin({
                            confirmButtonText: 'Next &rarr;',
                            showCancelButton: true,
                            progressSteps: ['1', '2']
                        }).queue([{
                                title: 'Terms & Conditions',
                                text: 'Chaining swal2 modals is easy'
                            },
                            'Confirm?',
                        ]).then((result) => {
                            if (result.value) {
                                swal({
                                    title: 'All done!',
                                    html: 'Your Reference Number: <pre><code>',
                                    confirmButtonText: 'Done'
                                })
                            }
                        })
                        return false;
                    });
                });
            </script>
        </body>

        </html>