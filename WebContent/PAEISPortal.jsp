<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/7/2018
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <link rel="icon" href="extras/logo1.png">
    <title>PAEIS PORTAL</title>
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
<%--    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme"/>--%>
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
<%--    <script src="assets/plugins/pace/pace.min.js"></script>--%>
    <!-- ================== END BASE JS ================== -->
</head>
<body class="container">
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<div class="login-cover">
    <div class="login-cover-image">
        <img src="extras/logo1.png" data-id="login-cover-image" alt=""/>
    </div>
    <div class="login-cover-bg"></div>
</div>
<!-- begin #page-container -->
<div id="page-container" class="fade container-fluid">
    <!-- begin login -->
    <div class="login login-v2" data-pageload-addclass="animated fadeIn">
<%--        <div class="login login-v2" data-pageload-addclass="animated fadeIn" style="margin-top: 9rem !important;">--%>
        <!-- begin brand -->
        <div class="login-header">
            <div class="brand text-center">
                <img src="extras/logo1.png" class="image" style="max-width: 20%;"> PAEIS
            </div>
        </div>
        <!-- end brand -->
        <ul class="nav nav-tabs">
<%--            <li class="active"><a href="#default-tab-1" data-toggle="tab">Latest News</a></li>--%>
            <li class="active"><a href="#default-tab-2" data-toggle="tab">Application Registration Forms</a></li>
            <li class=""><a href="#default-tab-3" data-toggle="tab">Login</a></li>
            <li class=""><a href="#default-tab-4" data-toggle="tab">Application Status</a></li>
        </ul>
        <div class="tab-content">
            <%--<div class="tab-pane fade active in" id="default-tab-1">
                <h3 class="m-t-10"> News/Announcements:</h3>
                <div class="timeline-Widget" data-iframe-title="Twitter Timeline" data-twitter-event-id="1" lang="en"
                     style=" height: 60vh; /* percent relative to viewport height */ overflow-y: auto;">
                    <a class="twitter-timeline" data-link-color="#9266CC"
                       href="https://twitter.com/QCGov?ref_src=twsrc%5Etfw">Quezon City LGU</a>
                </div>
            </div>--%>

            <div class="tab-pane fade" id="default-tab-2">
                <h3 class="m-t-10"> Select an Application Form:</h3>
                <div class="controls">
                    <select id="newForm" class="form-control">
                        <option value="nSing">Business Application Form (Single)</option>
                        <option value="nCorp">Business Application Form (Partnership/Corporation)</option>
                        <option value="Mtops">MTOPS Application Form</option>
                    </select>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-primary" id="bplsBtn">Proceed</button>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade active in" id="default-tab-3">
                <form name="loginEmpForm" id="loginEmpForm" action="${pageContext.request.contextPath}/LoginServlet"
                      method="post" novalidate=""
                      data-parsley-validate="">
                    <h4>Employee Login</h4>

                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Username</label>
                                <div class="controls">
                                    <input type="text" name="username" placeholder="Your username" class="form-control"
                                           required/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Password</label>
                                <div class="controls">
                                    <input type="password" name="password" placeholder="Your password"
                                           class="form-control" required/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" <%--id="loginBtn"--%> class="btn btn-sm btn-primary">Log In</button>
                    </div>
                </form>

            </div>
            <div class="tab-pane fade" id="default-tab-4">
                <form name="checkApplFrm" id="checkApplFrm"
                      action="${pageContext.request.contextPath}/BPLS/BPLSRtSlip.jsp" method="get" novalidate=""
                      data-parsley-validate="">
                    <h4>Application Tracking</h4>

                    <div class="row">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Reference Number</label>
                                <div class="controls">
                                    <input type="text" name="refNo" placeholder="Reference Number" class="form-control"
                                           required/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" <%--id="loginBtn"--%> class="btn btn-sm btn-primary">Continue</button>
                    </div>
                </form>

            </div>

        </div>
    </div>
    <!-- end login -->

</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/plugins/parsleyjs/dist/parsley.min.js"></script>
<!--[if lt IE 9]>
<script src="assets/crossbrowserjs/html5shiv.js"></script>
<script src="assets/crossbrowserjs/respond.min.js"></script>
<script src="assets/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/login-v2.demo.min.js"></script>
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="assets/js/portal.js"></script>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>
