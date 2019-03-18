<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 24 Mar 2019
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
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
    <link rel="icon" href="extras/logo1.png">
    <title>RPT | Properties</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="icon" href="extras/logo1.png">

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
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-wizard/css/bwizard.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css"
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="PAEISSAComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li>RPT</li>
            <li class="active">Properties</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">List of Properties</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">Properties</h4>
                    </div>
                    <%--<div class="panel-body">--%>
                        <%--<a href="#modal-adduser" class="btn btn-sm btn-primary" data-toggle="modal">Add Fee</a>--%>
                    <%--</div>--%>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                            <thead>
                            <tr>
                                <th>Property Type</th>
                                <th>Property Class</th>
                                <th>Property Area</th>
                                <th>Owner</th>
                                <th>Assess Property</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <a href="#modal-adduser" class="btn btn-sm btn-primary" data-toggle="modal">Assess</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end panel -->
            </div>
        </div>
    </div>
    <!-- end #content -->

    <!-- #modal-adduser -->
    <div class="modal fade" id="modal-adduser">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Tax Declaration</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">
                                <div id="wizard">
                                    <ol>
                                        <li>
                                            Owner's Information
                                        </li>
                                        <li>
                                            Property Information
                                        </li>
                                        <li>
                                            Property Assessment
                                        </li>
                                    </ol>
                                    <!-- begin wizard step-1 -->
                                    <div>
                                        <fieldset>
                                            <!-- begin row -->
                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>ARP No.:</label>
                                                        <input type="text" name="arpno" placeholder="ARP No."
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>PIN:</label>
                                                        <input type="text" name="pin" placeholder="PIN"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>OCT/TCT/CLOA No.</label>
                                                        <input type="text" name="oct" placeholder="OCT/TCT/CLOA No."
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Dated:</label>
                                                        <input type="text" class="form-control date" name="dated" id="birthdate" required placeholder="DD-MM-YYYY"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label>Survey No.:</label>
                                                        <input type="text" name="survey" placeholder="Survey No."
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label>Lot No.:</label>
                                                        <input type="text" name="lot" placeholder="Lot No."
                                                               class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label>Blk:</label>
                                                        <input type="text" name="blk" placeholder="Blk"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Owner:</label>
                                                        <input type="text" name="owner" placeholder="Owner"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Tel No:</label>
                                                        <input type="text" name="ownertel"
                                                               placeholder="Tel No:"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>TIN:</label>
                                                        <input type="text" name="ownertin"
                                                               placeholder="TIN"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <input type="text" name="owneradd" placeholder="Address"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Administrative/Beneficial User:</label>
                                                        <input type="text" name="admben" placeholder="Administrative/Beneficial User"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Tel No:</label>
                                                        <input type="text" name="admbentel"
                                                               placeholder="Tel No."
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>TIN:</label>
                                                        <input type="text" name="admbentin"
                                                               placeholder="Tin"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <input type="text" name="admbenadd" placeholder="Address"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- end row -->
                                        </fieldset>
                                    </div>
                                    <!-- end wizard step-1 -->
                                    <!-- begin wizard step-2 -->
                                    <div>
                                        <fieldset>
                                            <h4 class="pull-left width-full">Property Location</h4>
                                            <!-- begin row -->
                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>No./Street:</label>
                                                        <input type="text" name="nostreet" placeholder="No./Street"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Brgy/District:</label>
                                                        <input type="text" name="brgydis"
                                                               placeholder="Brgy/District"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Municipality:</label>
                                                        <input type="text" name="munic"
                                                               placeholder="Municipality"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Province/City:</label>
                                                        <input type="text" name="procit" placeholder="Province/City"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                            </div>

                                            <h4 class="pull-left width-full">Property Boundaries</h4>

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>North:</label>
                                                        <input type="text" name="north" placeholder="North"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>East:</label>
                                                        <input type="text" name="east" placeholder="East"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>South:</label>
                                                        <input type="text" name="south" placeholder="South"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>West:</label>
                                                        <input type="text" name="west" placeholder="West"
                                                               class="form-control"/>
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- end row -->
                                        </fieldset>
                                    </div>
                                    <!-- end wizard step-2 -->
                                    <!-- begin wizard step-3 -->
                                    <div>
                                        <fieldset>
                                            <!-- begin row -->

                                            <h4 class="pull-left width-full">Kind of Property Assessed</h4>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-9">
                                                        <label class="radio-inline">
                                                            <input type="radio" name="optionsRadios" value="taxable" checked />
                                                            Taxable
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="optionsRadios" value="exempt" />
                                                            Exempt
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="optionsRadios" value="mortgage" />
                                                            Mortgage
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="optionsRadios" value="Land" checked />
                                                                Land
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="optionsRadios" value="Machinery" />
                                                                Machinery
                                                            </label>
                                                            <input type="text" name="bridesc" placeholder="Brief Description"
                                                                   class="form-control" required/>
                                                        </div>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="optionsRadios" value="option2" />
                                                                Others
                                                            </label>
                                                            <input type="text" name="others" placeholder="Specify"
                                                                   class="form-control" required/>
                                                        </div>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="optionsRadios" value="option1" checked />
                                                                Building
                                                            </label>
                                                            <br>
                                                            No. of Stories
                                                            <input type="text" name="nostori"
                                                                   class="form-control" required/>
                                                            Brief Description
                                                            <input type="text" name="bldgdescbri" placeholder="Brief Description"
                                                                   class="form-control" required/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <br>

                                            <div class="modal-footer">
                                                <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                                <button type="button" id="btnUsrsubmit"class="btn btn-sm btn-success">Add</button>
                                            </div>
                                            <!-- end row -->
                                        </fieldset>
                                    </div>
                                    <!-- end wizard step-3 -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<jsp:include page="PAEISSAFooter.jsp"></jsp:include>

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
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="assets/plugins/select2/dist/js/select2.min.js"></script>
<script src="assets/plugins/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
<script src="assets/js/form-wizards.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();
        FormWizard.init();
    });
</script>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-53034621-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
</html>