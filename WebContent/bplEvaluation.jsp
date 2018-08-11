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

    <title>QCPAEIS | Evaluation</title>

    <!-- Bootstrap -->
    <link href="build/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="build/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="build/css/nprogress.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="build/datatables.net-bs/css/dataTables.bootstrap.min.css"
          rel="stylesheet">
    <link
            href="build/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
            rel="stylesheet">
    <link
            href="buid/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
            rel="stylesheet">
    <link
            href="build/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
            rel="stylesheet">
    <link
            href="build/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="/navBars.jsp"></jsp:include>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Permits Evaluation</h3>
                    </div>
                </div>
                <div class="clearfix"></div>
                <!-- 									START -->
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>
                                List of Application Permits
                            </h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p class="text-muted font-13 m-b-30">List of Application Permits. Click buttons within the
                                action column to modify existing records.</p>
                            <table id="datatable-buttons"
                                   class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Business Name</th>
                                    <th>Taxpayer's Name</th>
                                    <th>Business Location</th>
                                    <th>Telephone</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>


                                <tbody>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                    <td>Edit</td>
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
<script src="build/iCheck/icheck.min.js"></script>
<!-- Datatables -->
<script src="build/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="build/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="build/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script
        src="build/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="build/datatables.net-buttons/js/buttons.print.min.js"></script>
<script
        src="build/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script
        src="build/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script
        src="build/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script
        src="build/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script
        src="build/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="build/jszip/dist/jszip.min.js"></script>
<script src="build/pdfmake/build/pdfmake.min.js"></script>
<script src="build/pdfmake/build/vfs_fonts.js"></script>

<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>
</body>
</html>
    