<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/12/2018
  Time: 7:29 AM
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
    <title>PAEIS | Mission Order</title>
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
        <h1 class="page-header hidden-print">Mission Order</h1>
        <!-- end page-header -->

        <!-- begin invoice -->
        <div class="invoice">
            <div class="invoice-company">
                    <span class="pull-right hidden-print">
                    <%--<a href="javascript:;" class="btn btn-sm btn-success m-b-10"><i class="fa fa-download m-r-5"></i> Export as PDF</a>--%>
                    <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i
                            class="fa fa-print m-r-5"></i> Print</a>
                    </span>
                Mission Order
            </div>
            <%--<div class="invoice-header">--%>
                <%--&lt;%&ndash;<div class="invoice-from">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<address class="m-t-5 m-b-5">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;Machine Validation No.<br/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;Bill Number<br/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;Payor&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</address>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="invoice-to">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<address class="m-t-5 m-b-5">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;Insert Machine Validation No. here<br/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;Insert Bill Number here<br/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;Insert Payor here&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</address>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--<div class="invoice-date">--%>
                    <%--<div class="date m-t-5">--%>
                        <%--Authority to Inspect __________<br/>--%>
                        <%--Date___________________________<br/>--%>
                        <%--Expiry Date____________________<br/>--%>
                    <%--</div>--%>
                    <%--&lt;%&ndash;<div class="invoice-detail">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;Insert No. here&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="invoice-content">
                <div class="panel-body">
                    <p class="pull-right">
                        Authority to Inspect __________<br/>
                        Date___________________________<br/>
                        Expiry Date____________________<br/>
                    </p>
                    <br>
                    <br>
                    <br>
                    <p>
                        <strong>M.</strong>_________________<br/>
                        ___________________<br/>
                        ___________________<br/>
                        <strong>Quezon City, Metro Manila</strong>
                    </p>
                    <p>
                        <strong>Sir/Madam</strong>
                        Please be informed that the bearer, License Inspector/s of this Office whose names and signature/s appear below is/are
                        hereby authorized to conduct an inspection on your business establishment ____________________________________________<br/>
                        Operating as ___________________________________________________________<br/>
                        Located at _____________________________________________________________<br/>
                        Quezon City, Metro Manila, pursuant to the 1993 Revised Quezon City Revenue Code.
                    </p>
                    <p>
                        The herein named Inspector/s is/are strictly required to properly identify himself/themselves before conducting the inspection.
                    </p>
                    <p>
                        Your cooperation in this regard will be greatly appreciated
                    </p>
                    <br>
                    <br>
                    <br>
                    <p class="pull-left">
                        _______________________________<br/>
                        Licence Inspector/Officer
                    </p>
                    <p class="pull-right">
                        _______________________________<br/>
                        Licence Inspector/Officer
                    </p>
                    <br>
                    <br>
                    <br>
                    <p>
                        Recommending Issuance<br/>
                        Of Authority to Inspect:
                    </p>
                    <br>
                    <br>
                    <br>
                    <p class="pull-left">
                        <strong>ALFONSO L., MORA</strong><br/>
                        Head Inspection Division
                    </p>
                    <br>
                    <br>
                    <br>
                    <br>
                    <p class="pull-right">
                        <strong>FOR AND BY AUTHORITY</strong><br/>
                        <strong>OF THE CITY MAYOR</strong>
                    </p>
                    <br>
                    <br>
                    <br>
                    <p class="pull-right">
                        <strong>GARRY C. DOMINGO</strong><br/>
                        Chief, BPLO
                    </p>
                </div>
                <%--<div class="table-responsive">--%>
                    <%--<table class="table table-invoice">--%>
                        <%--<thead>--%>
                        <%--<tr>--%>
                            <%--<th>NATURE OF COLLECTION</th>--%>
                            <%--<th>FUND AND ACCOUNT CODE</th>--%>
                            <%--<th>AMOUNT</th>--%>
                        <%--</tr>--%>
                        <%--</thead>--%>
                        <%--<tbody>--%>
                        <%--<tr>--%>
                            <%--<td>MAYORS PERMIT</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>CITY TAX</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>GARBAGE FEE</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>SANITARY FEE</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>BUILDING INSP. FEE</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>ELECTRICAL INSPECTION FEE</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>PLUMBING INSPECTION FEE</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>SIGNBOARD</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>FIRE INSPECTION FEE</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>NEW REGISTRATION PLATE / STICK</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>ZONING FEE</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>PENALTY / INTEREST</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>TOURISM</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>TOURISM</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>QCBRD</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>ADJUSTMENT</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>DISCOUNT</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>PENALTY FOR DELINQUENCY</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>ADJUSTMENT FOR TOURISM</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>SPECIAL PERMIT</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>ADDITIONAL FEES</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>CTC</td>--%>
                            <%--<td>-</td>--%>
                            <%--<td>Insert Price here</td>--%>
                        <%--</tr>--%>
                        <%--</tbody>--%>
                    <%--</table>--%>
                <%--</div>--%>
                <%--<div class="invoice-price">--%>
                    <%--<div class="invoice-price-left">--%>
                    <%--</div>--%>
                    <%--<div class="invoice-price-right">--%>
                        <%--<small>TOTAL</small>--%>
                        <%--Insert Total Here--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>
            <%--<div class="invoice-note">--%>
                <%--* Write the number and date of this receipt on the back of the treasury warrant, check or money order--%>
                <%--received--%>
            <%--</div>--%>
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
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
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