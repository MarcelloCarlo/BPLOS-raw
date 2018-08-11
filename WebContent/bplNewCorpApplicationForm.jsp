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
                        <form class="form-horizontal form-label-left" id="applicationFormSingle" novalidate="" data-parsley-validate="" method="POST">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h4>Business Permit Application Form For Partnership & Corporation</h4>
                                </div>
                                <div class="x_content">
                                    <div class="row">
                                        <div class="form-group col-xs-12">
                                            <label class="control-label col-md-3" for="txtNCorpBussName">Business Name/Trade Name
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-5">
                                                <input type="text" id="txtNCorpBussName" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group col-xs-12">
                                            <label class="control-label col-md-3" for="txtNCorpTaxPayName">Taxpayer's Name
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-5">
                                                <input type="text" id="txtNCorpTaxPayName" placeholder="" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group col-xs-12">
                                            <label class="control-label col-md-3" for="txtNCorpPresidentName">President
                                                <span class="required">*</span>
                                            </label>
                                            <div class="col-md-5">
                                                <input type="text" id="txtNCorpPresidentName" placeholder="" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
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
                                                    <input type="text" id="txtNCorpBussFlrNo" placeholder="If within a bldg.., specify stall, room, floor number" required="required"
                                                        class="form-control col-md-4 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-2">
                                                    <input type="text" id="txtNCorpBussStrtNo" placeholder="Street No." required="required" class="form-control col-md-2 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNCorpBussStrtName" placeholder="Street Name" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNCorpBussBrgyName" placeholder="Barangay" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div>
                                                <div class="form-group col-md-12">
                                                    <div class="col-md-4">
                                                        <label for="txtNCorpPropIdxNo">Property Index No.
                                                            <span class="required">*</span>
                                                        </label>
                                                        <input type="text" id="txtNCorpPropIdxNo" class="form-control" placeholder=" " required="required">
                                                    </div>

                                                    <div class="col-md-4">
                                                        <label for="txtNCorpLotBlckNo">Lot & Block No.
                                                            <span class="required">*</span>
                                                        </label>
                                                        <input type="text" id="txtNCorpLotBlckNo" class="form-control" placeholder=" " required="required">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">

                                            <div class="form-group col-md-12">
                                                <div class="col-md-4">
                                                    <label for="txtNCorpAuthRepName">Authorized Representative
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNCorpAuthRepName" class="form-control" placeholder=" " required="required">
                                                </div>

                                                <div class="col-md-4">
                                                    <label for="txtNCorpAuthRepPos">Position (Official Capacity)
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNCorpAuthRepPos" class="form-control" placeholder=" " required="required">
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label>Home Address of Representative
                                                    <span class="required">*</span>
                                                </label>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <div class="col-md-2">
                                                    <input type="text" id="txtNCorpRepStrtNo" placeholder="Street No." required="required" class="form-control col-md-2 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNCorpRepStrtName" placeholder="Street Name" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" id="txtNCorpRepBrgyName" placeholder="Barangay" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" id="txtNCorpRepCity" placeholder="City" required="required" class="form-control col-md-4 col-sm-3 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12">
                                            <div class="form-group">
                                                <div class="col-md-4">
                                                    <label for="txtNCorpBussSECRegNo">SEC Registration Number
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNCorpBussSECRegNo" class="form-control" placeholder=" " required="required">
                                                </div>

                                                <div class="col-md-2">
                                                    <label for="dateXS" class="control-label">Date Issued
                                                        <span class="required">*</span>
                                                    </label>
                                                    <div class="input-group date" id="dateXS">
                                                        <input type="text" class="form-control" id="dateNCorpBussSECReg" required="required">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group col-md-10">
                                                <label class="control-label col-md-4" for="txtNCorpTaxPayTINNo">Taxpayer's Identification Number (TIN)
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" id="txtNCorpTaxPayTINNo" required="required" class="form-control col-md-6 col-xs-12">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="col-md-4">
                                                    <label for="txtNCorpTelNo">Telephone Number
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNCorpTelNo" class="form-control" placeholder=" " required="required">
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="txtNCorpFaxNo">Fax Number
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNCorpFaxNo" class="form-control" placeholder=" " required="required">
                                                </div>
                                            </div>
                                        </div>
                                     
                                        <div class="col-md-12">
                                                <div>
                                                    <div class="form-group col-md-12">
                                                        <div class="col-md-4">
                                                            <label for="txtNCorpEmpSSSNo">If Employer, Employer's Social Security Number (SSS)
                                                                <span class="required">*</span>
                                                            </label>
                                                            <input type="text" id="txtNCorpEmpSSSNo" class="form-control" placeholder=" " required="required">
                                                        </div>
    
                                                        <div class="col-md-3">
                                                            <label for="numNCorpEmpQTY">No of Employees
                                                                <span class="required">*</span>
                                                            </label>
                                                            <input type="number" id="numNCorpEmpQTY" class="form-control" placeholder=" " required="required">
                                                        </div>
    
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
                                                        <input type="text" class="form-control" id="dateNCorpBussEstRentStart" required="required">
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <label class="control-label">Monthly Rental
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="number" id="numNCorpBussEstRentMonth" required="required" class="form-control col-md-2 col-sm-3 col-xs-12">
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="control-label">From Whom
                                                        <span class="required">*</span>
                                                    </label>
                                                    <input type="text" id="txtNCorpBussEstRentName" required="required" class="form-control col-md-3 col-sm-3 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="col-md-4">
                                                <label>
                                                    <input type="checkbox" class="" id="chkSignboard" onclick="document.getElementById('numNCorpBussEstSignbrdArea').disabled=!this.checked;"> Using A Signboard
                                                </label>
                                                <input type="text" id="numNCorpBussEstSignbrdArea" class="form-control col-md-3" placeholder="Area of Signboard" disabled>
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
                                                                <input type="text" id="txtNCorpExBuss">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBussNo">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBussLoc">
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBuss1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBussNo1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBussLoc1">
                                                            </td>


                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBuss2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBussNo2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBussLoc2">
                                                            </td>


                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBuss3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBussNo3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="txtNCorpExBussLoc3">
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
                                                                <input type="text" id="txtNCorpAct">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussUnitNo">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussAreaSqmts">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussCapitalization">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpAct1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussUnitNo1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussAreaSqmts1">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussCapitalization1">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpAct2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussUnitNo2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussAreaSqmts2">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussCapitalization2">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpAct3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussUnitNo3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussAreaSqmts3">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussCapitalization3">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpAct4">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussUnitNo4">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussAreaSqmts4">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussCapitalization4">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpAct5">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussUnitNo5">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussAreaSqmts5">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussCapitalization5">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpAct6">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussUnitNo6">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussAreaSqmts6">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussCapitalization6">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" id="txtNCorpAct7">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussUnitNo7">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussAreaSqmts7">
                                                            </td>
                                                            <td>
                                                                <input type="text" id="numNCorpBussCapitalization7">
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <label>TOTAL: Php </label>
                                            </div>

                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label" for="fileNCorpLocSketchEst">Locational Sketch of Business Establishment
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNCorpLocSketchEst" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="fileNCorpBrgyClear">Orginal Copy of Barangay Clearance
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNCorpBrgyClear" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="fileNCorpSECreg">SEC Registration File
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNCorpSECreg" />
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="fileNCorpTitleProp">Title To Property / Tax Declaration (If Owned) or Contract of Lease (If Renting)
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNCorpTitleProp" />
                                            </div>
                                            <div class="form-group">
                                                <label>Lessor's Business Permit (If Rented)
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNCorpLessorBussPermit" />
                                            </div>
                                            <div class="form-group">
                                                <label>Authorization Letter w/ ID (Both Business Owner & Filer)
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNCorpAuthLetterID" />
                                            </div>
                                            <div class="form-group">
                                                <label>Other Required Document/s
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="file" name="file" id="fileNCorpOthers" />
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