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
    <title>PAEIS | Real Property Tax</title>
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
    <link href="assets/css/invoice-print.min.css" rel="stylesheet"/>
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet"/>
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
        <div>
             <h1 class="page-header hidden-print">Tax Bill</h1>
            <span class="hidden-print">
                <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i
                    class="fa fa-print m-r-5"></i> Print</a>
            </span>
        </div>

        <!-- begin invoice -->
        <div class="invoice">
            <div class="invoice-company">

            </div>


            <div class="invoice-content">
                <table border="1" style="font-family: Arial; font-size: 10px;" width="100%">
                    <thead>
                    <tr>

                        <center style="font-size: 12px; padding: 10px 0px 10px 0px;">
                            <p style="color: blue;"> OFFICE OF THE CITY TREASURER - QUEZON CITY, METRO MANILA </p>
                            <h3 style="color: blue;">REAL PROPERTY TAX BILL</h3>
                            <p style="color: red;">THIS IS NOT VALID AS OFFICIAL RECEIPT </p>
                        </center>

                    </tr>
                    </thead>

                    <tbody>

                    <tr>
                        <td style="width: 50%;">
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 50%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Tax Declaration No.
                                    </td>

                                    <td style="width: 50%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Property Index No.
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%; padding: 5px 0px 5px 15px;">
                                        D-009-40860
                                    </td>

                                    <td style="width: 50%; padding: 5px 0px 5px 15px;">
                                        13-009-021-003-2-001-2012
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Name and Postal Address of Owner
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px;">
                                        EEI CORPORATION
                                        12 MANGGAHAN ST BAGUMBAYAN QUEZON CITY
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Location of Property (Lot & Block No.)
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px;">
                                        1 & 2
                                        1-PCS-04-000121
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 20%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Class
                                    </td>
                                    <td style="width: 40%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Assessed Value
                                    </td>
                                    <td style="width: 40%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Verified By
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; padding: 5px 0px 5px 15px;">
                                        2
                                    </td>
                                    <td style="width: 40%; padding: 5px 0px 5px 15px;">
                                        Machinery <br>
                                        165590
                                    </td>
                                    <td style="width: 40%; padding: 5px 0px 5px 15px;">
                                        JENNIFER SANCHEZ
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Verified Last Payment
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px;">
                                        EEF 2011 NEW <br>
                                        2011-2011
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; color: blue;">
                                        Bill Number: <span style= "color: black;"> R-2018-09-17-011600051-000295</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; color: blue;">
                                        Bank Reference:
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; color: blue;">
                                        Important: Notify the City Assessor's Office for any change in postal address.
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>

                        <td style="width: 50%;">
                            <table border="1" style="margin: -1px 0px -1px -1px;"  width="100%">
                                <tbody>
                                <tr style="vertical-align: top;">
                                    <td style="width: 20%;  text-align: center; color: blue;">
                                        Tax Year
                                    </td>

                                    <td style="width: 20%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Installment No.
                                    </td>

                                    <td style="width: 30%; padding: 5px 0px 5px 15px; border-color: white; text-align: center; color: blue; ">
                                        THIS PAYMENT
                                    </td>

                                    <td style="width: 30%; padding: 5px 0px 5px 15px; text-align: left; color: blue; border-color: white;">

                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; padding: 5px 0px 5px 15px; ">
                                        2012
                                    </td>

                                    <td style="width: 20%; padding: 5px 0px 5px 15px;  ">
                                        FULL
                                    </td>

                                    <td style="width: 30%; padding: 5px 0px 5px 15px; border-color: white;">

                                    </td>

                                    <td style="width: 30%; padding: 5px 5px 5px 15px; text-align: center; color: blue; border-color: white;">
                                        TOTAL
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px; font-size: 9px;"  width="100%">
                                <tbody>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        City Share
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        Barangay Share
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        Special Education Fund
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">

                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        Idle Land Tax
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        SHT
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        Garbage Fee (TRO 020514)
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        DISCOUNT
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        NET TAX
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        CR (NB)
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        BALANCE
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        PENALTY 36.00% Sec 222 RA 7160
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        TAX
                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        AMOUNT DUE
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; color: blue;">
                                        Important: Present this bill to the teller when payment is made. Subject to payment of deficiency taxes if any.
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <!-- end invoice -->
        </div>
        <!-- end #content -->

        <!-- begin scroll to top btn -->
        <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
                class="fa fa-angle-up"></i></a>
        <!-- end scroll to top btn -->
    </div>
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
        $(document).ready(function () {
            App.init();
            TableManageResponsive.init();
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