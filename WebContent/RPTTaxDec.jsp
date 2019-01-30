<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 1/31/2019
  Time: 1:24 AM
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
    <title>RPT | Tax Declaration</title>
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

<jsp:include page="RPTComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <div class="row">
            <!-- begin col-12 -->
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                        </div>
                        <h4 class="panel-title">Tax Declaration</h4>
                    </div>
                    <div class="panel-body">
                        <fieldset>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>ID Number</label>
                                        <div class="controls">
                                            <input type="text" name="idnumber" placeholder="ID Number"
                                                   class="form-control" required/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>PIN</label>
                                        <div class="controls">
                                            <input type="text" name="pin" placeholder="PIN"
                                                   class="form-control" required/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Owner</label>
                                        <div class="controls">
                                            <input type="text" name="owner" placeholder="Owner"
                                                   class="form-control" required/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Effectivity Date</label>
                                        <div class="controls">
                                            <input type="text" class="form-control date" name="effectdate" id="effectdate" required placeholder="DD-MM-YYYY"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

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
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <a href="#modal-assess" id="assessbtn" class="btn btn-primary" data-toggle="modal">Enter Assessed Value</a>
                                    </div>
                                </div>
                            </div>

                            <br>

                            <legend class="pull-left width-full">Kind of Property Assessed</legend>

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

                        </fieldset>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- end #content -->
    <!-- #modal-assess -->
    <div class="modal fade" id="modal-assess">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Enter Assessed Value</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data">
                                <%--<form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">--%>
                                <div>
                                    <fieldset>
                                        <legend class="pull-left width-full">Enter Assessed Value</legend>
                                        <!-- begin row -->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Market Value</label>
                                                    <div class="controls">
                                                        <input type="text" name="mrktval" placeholder="Market Value"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Assessment Level</label>
                                                    <div class="controls">
                                                        <input type="text" name="assesslvl"
                                                               placeholder="Assessment Level"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Assessed Value</label>
                                                    <div class="controls">
                                                        <input type="text" name="assessval"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-sm btn-success">Add</button>
                                        </div>
                                        <!-- end row -->
                                    </fieldset>
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

<jsp:include page="RPTFooter.jsp"></jsp:include>

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