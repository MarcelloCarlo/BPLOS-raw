<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/10/2018
  Time: 1:31 PM
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
    <title>PAEIS | Official Receipt</title>
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
    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
    <link href="assets/css/invoice-print.min.css" rel="stylesheet" />
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
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->


<!-- begin #page-container -->
<div id="page-container" class="page-without-sidebar ">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin page-header -->
        <h1 class="page-header hidden-print">Official Receipt</h1>
        <!-- end page-header -->

        <!-- begin invoice -->
        <div class="invoice">
            <div class="invoice-company">
                    <span class="pull-right hidden-print">
                    <%--<a href="javascript:;" class="btn btn-sm btn-success m-b-10"><i class="fa fa-download m-r-5"></i> Export as PDF</a>--%>
                    <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i class="fa fa-print m-r-5"></i> Print</a>
                    </span>
                Computerized Official Receipt (Original)
            </div>
            <div class="invoice-header">
                <div class="invoice-from">
                    <address class="m-t-5 m-b-5">
                        Machine Validation No.<br />
                        Bill Number<br/>
                        Payor
                    </address>
                </div>
                <div class="invoice-to">
                    <address class="m-t-5 m-b-5">
                        Insert Machine Validation No. here<br />
                        Insert Bill Number here<br />
                        Insert Payor here
                    </address>
                </div>
                <div class="invoice-date">
                    <div class="date m-t-5">Insert Date here</div>
                    <div class="invoice-detail">
                        Insert No. here
                    </div>
                </div>
            </div>
            <div class="invoice-content">
                <div class="table-responsive">
                    <table class="table table-invoice">
                        <thead>
                        <tr>
                            <th>NATURE OF COLLECTION</th>
                            <th>FUND AND ACCOUNT CODE</th>
                            <th>AMOUNT</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>MAYORS PERMIT</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>CITY TAX</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>GARBAGE FEE</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>SANITARY FEE</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>BUILDING INSP. FEE</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>ELECTRICAL INSPECTION FEE</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>PLUMBING INSPECTION FEE</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>SIGNBOARD</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>FIRE INSPECTION FEE</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>NEW REGISTRATION PLATE / STICK</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>ZONING FEE</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>PENALTY / INTEREST</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>TOURISM</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>TOURISM</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>QCBRD</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>ADJUSTMENT</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>DISCOUNT</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>PENALTY FOR DELINQUENCY</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>ADJUSTMENT FOR TOURISM</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>SPECIAL PERMIT</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>ADDITIONAL FEES</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                            <tr>
                                <td>CTC</td>
                                <td>-</td>
                                <td>Insert Price here</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="invoice-price">
                    <div class="invoice-price-left">
                    </div>
                    <div class="invoice-price-right">
                        <small>TOTAL</small> Insert Total Here
                    </div>
                </div>
            </div>
            <div class="invoice-note">
                * Write the number and date of this receipt on the back of the treasury warrant, check or money order received
            </div>
            <%--<div class="invoice-footer text-muted">--%>
                <%--<p class="text-center m-b-5">--%>
                    <%--THANK YOU FOR YOUR BUSINESS--%>
                <%--</p>--%>
                <%--<p class="text-center">--%>
                    <%--<span class="m-r-10"><i class="fa fa-globe"></i> matiasgallipoli.com</span>--%>
                    <%--<span class="m-r-10"><i class="fa fa-phone"></i> T:016-18192302</span>--%>
                    <%--<span class="m-r-10"><i class="fa fa-envelope"></i> rtiemps@gmail.com</span>--%>
                <%--</p>--%>
            <%--</div>--%>
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