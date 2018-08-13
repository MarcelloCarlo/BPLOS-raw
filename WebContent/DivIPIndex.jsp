<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="ISO-8859-1">

    <title>QCPAEIS | Inspection </title>

    <!-- Bootstrap -->
    <link href="build/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="build/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="build/css/nprogress.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="build/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="build/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="DivIPComponent.jsp"/>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Inspection</h3>
                    </div>

                </div>

                <div class="clearfix"></div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Evaluated Application Evaluation</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p class="text-muted font-13 m-b-30">
                                This tables shows all evaluated applications
                            </p>

                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Business</th>
                                    <th>Ownership Type</th>
                                    <th>Application Type</th>
                                    <th>Date</th>
                                    <th>Remarks</th>
                                    <th>Action</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>Alyana Apo</td>
                                    <td>Sleep-all-you-can</td>
                                    <td>Single</td>
                                    <td>New Application</td>
                                    <td>8/13/2018</td>
                                    <td>I want you!</td>
                                    <td><button>Remarks</button></td>
                                </tr>
                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>
            </div>
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
<!-- Chart.js -->
<script src="build/Chart.js/dist/Chart.min.js"></script>
<!-- jQuery Sparklines -->
<script src="build/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- morris.js -->
<script src="build/raphael/raphael.min.js"></script>
<script src="build/morris.js/morris.min.js"></script>
<!-- gauge.js -->
<script src="build/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="build/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- Skycons -->
<script src="build/skycons/skycons.js"></script>
<!-- Flot -->
<script src="build/Flot/jquery.flot.js"></script>
<script src="build/Flot/jquery.flot.pie.js"></script>
<script src="build/Flot/jquery.flot.time.js"></script>
<script src="build/Flot/jquery.flot.stack.js"></script>
<script src="build/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="build/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="build/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="build/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="build/DateJS/build/date.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="build/moment/min/moment.min.js"></script>
<script src="build/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- Datatables -->
<script src="build/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="build/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="build/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="build/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="build/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="build/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="build/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="build/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="build/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="build/jszip/dist/jszip.min.js"></script>
<script src="build/pdfmake/build/pdfmake.min.js"></script>
<script src="build/pdfmake/build/vfs_fonts.js"></script>
<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>
</body>
</html>
