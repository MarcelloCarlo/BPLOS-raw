<%@page import="java.sql.*"%>
<%@page import="configuration.dbConnection" %>
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

    <title>QCPAEIS | User Management </title>

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
        <jsp:include page="/navBars.jsp"/>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>User Management</h3>
                    </div>

                </div>

                <div class="clearfix"></div>

                <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Input Users</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Username <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="username" name="U_USERNAME" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="password" id="password" name="U_PASSWORD" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="user-type" class="control-label col-md-3 col-sm-3 col-xs-12">User Type </label>
                        <div class="col-sm-9 col-xs-12 col-md-6">
                          <select class="form-control" name="U_TYPE">
                            <option>Staff</option>
                            <option>Admin</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="divisions" class="control-label col-md-3 col-sm-3 col-xs-12">Divisions </label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                          <select class="form-control">
                            <option value="Administrative">Administrative</option>
                            <option value="OSS/Application">OSS/Application</option>
                            <option value="Evaluation">Evaluation</option>
                            <option value="Investigation">Investigation</option>
                            <option value="Inspection">Inspection</option>
                            <option value="Treasury">Treasury</option>
                            <option value="Releasxing">Releasing</option>
                          </select>
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" type="reset">Reset</button>
                          <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>

                    </form>
                  </div>
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
<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>
</body>
</html>
