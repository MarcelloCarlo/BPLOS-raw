<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="ISO-8859-1">

    <title>BPLO | Home </title>

    <!-- Bootstrap -->
    <link href="build/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="build/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="build/css/nprogress.css" rel="stylesheet">

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
                <h3>Analytics Here</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Analytics Here</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      BPLOS INSIDER PREVIEW
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
    
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.min.js"></script>
  </body>
</html>
