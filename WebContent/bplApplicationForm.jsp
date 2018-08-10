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
    <link href="build/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="build/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="build/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- page content -->
        <!-- page content -->
        <div class="col-md-12 col-sm-12 col-xs-12">
            <form class="form-horizontal form-label-left" id="applicationFormSingle" novalidate=""
                  data-parsley-validate="" method="POST">
                <div class="x_panel">
                    <div class="x_title">
                        <h4 class="modal-title">Single Propreitorship Application Form</h4>
                    </div>
                    <div class="x_content">
                        <div class="row">
                            <div class="form-group col-xs-12">
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
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>Name & Address of Authorized Representative
                                        <span
                                                class="required">*</span></label>
                                </div>
                                <div class="form-group col-xs-12">
                                    <div class="col-md-3">
                                        <input type="text" id="txtBussFlrNo"
                                               placeholder="Last Name"
                                               required="required"
                                               class="form-control col-md-3 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="txtBussStrtNo" placeholder="First Name"
                                               required="required"
                                               class="form-control col-md-2 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="txtBussStrtName" placeholder="Middle Name"
                                               required="required"
                                               class="form-control col-md-3 col-sm-3 col-xs-12">
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" id="txtBussBrgyName" placeholder="Home Address"
                                               required="required"
                                               class="form-control col-md-4 col-sm-3 col-xs-12">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>If Business Establishment is Rented
                                        <span class="required">*</span></label>
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
            </form>
        </div>
        <!-- /page content -->

        <jsp:include page="/footer.jsp"></jsp:include>
    </div>
</div>
<!-- jQuery -->
<script src="build/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="build/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="build/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="build/nprogress/nprogress.js"></script>

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
