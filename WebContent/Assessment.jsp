<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 9/25/2018
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>PAEIS | Assessment</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <link href="assets/css/style.min.css" rel="stylesheet" />
    <link href="assets/css/style-responsive.min.css" rel="stylesheet" />
    <link href="assets/css/invoice-print.min.css" rel="stylesheet" />
    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>


<!-- begin #page-container -->
<div id="page-container" class="page-without-sidebar ">

    <!-- begin #content -->
        <div id="content" class="content">


            <!-- begin invoice -->
            <div class="invoice">
                <div class="invoice-company">
                    <span class="pull-right hidden-print">
                    <a href="javascript:;" class="btn btn-sm btn-success m-b-10"><i class="fa fa-download m-r-5"></i> Export as PDF</a>
                    <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i class="fa fa-print m-r-5"></i> Print</a>
                    </span>
                    [Insert Company Name]
                </div>
                <div class="invoice-header">
                    <div class="invoice-from">
                        <address class="m-t-5 m-b-5">
                            <strong>[Company Name]</strong><br />
                            [Company Address]<br />
                            [  ]<br />
                            [Company Contact]<br />
                        </address>
                    </div>
                    <div class="invoice-date">
                        <div class="date m-t-5">[Date]</div>
                        <div class="invoice-detail">
                            [Receipt Number]
                        </div>
                    </div>
                </div>
                <div class="invoice-content">
                    <div class="table-responsive">
                        <table class="table table-invoice">
                            <thead>
                            <tr>
                                <th>Fee Description</th>
                                <th> </th>
                                <th> </th>
                                <th>Amount</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Permit Fee</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>City Tax</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Garbage Fee</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Sanitary Fee</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Bldg. Insp. Fee</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Electrical Insp. Fee</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Plumbing Insp. Fee</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Signboard Fee</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Fire Insp. Fee</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Plate/Sticker</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Zoning Fees</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Penalty & Interest</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Tourism</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            <tr>
                                <td>Adjustment</td>
                                <td> </td>
                                <td> </td>
                                <td>$2,500.00</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="invoice-price">
                        <div class="invoice-price-left">
                            <div class="invoice-price-row">
                                <div class="sub-price">
                                    <small>SUBTOTAL</small>
                                    $4,500.00
                                </div>
                                <div class="sub-price">
                                    <i class="fa fa-plus"></i>
                                </div>
                                <div class="sub-price">
                                    <small>ADDITIONAL FEE (5.4%)</small>
                                    $108.00
                                </div>
                            </div>
                        </div>
                        <div class="invoice-price-right">
                            <small>TOTAL</small> $4508.00
                        </div>
                    </div>
                </div>
                <div class="invoice-note">
                    * Make all cheques payable to [Your Company Name]<br />
                    * Payment is due within 30 days<br />
                    * If you have any questions concerning this invoice, contact  [Name, Phone Number, Email]
                </div>
                <div class="invoice-footer text-muted">
                    <p class="text-center m-b-5">
                        THANK YOU FOR YOUR BUSINESS
                    </p>
                    <%--<p class="text-center">--%>
                        <%--<span class="m-r-10"><i class="fa fa-globe"></i> matiasgallipoli.com</span>--%>
                        <%--<span class="m-r-10"><i class="fa fa-phone"></i> T:016-18192302</span>--%>
                        <%--<span class="m-r-10"><i class="fa fa-envelope"></i> rtiemps@gmail.com</span>--%>
                    <%--</p>--%>
                </div>
            </div>
            <!-- end invoice -->
        </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->


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

<script>
    $(document).ready(function() {
        App.init();
        TableManageResponsive.init();
    });
</script>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-53034621-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
</html>