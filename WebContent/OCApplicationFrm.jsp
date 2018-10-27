<%@ page import="java.sql.*" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>PAEIS | Apply Occupational Permit</title>
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
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet"/>
    <link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.css" rel="stylesheet"/>
    <link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.skinNice.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet"/>
    <link href="assets/plugins/password-indicator/css/password-indicator.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-combobox/css/bootstrap-combobox.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css"
          rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-fontawesome.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-glyphicons.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/bootstrap-wizard/css/bwizard.min.css" rel="stylesheet"/>
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
    <div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">
          
        <!-- begin #header -->
        <div id="header" class="header navbar navbar-default navbar-fixed-top">
             <!-- begin navbar-header -->
                <div class="navbar-header">
                    <a href="index.html" class="navbar-brand"><span class="navbar-logo"></span> <b>PAEIS</b> Occupational</a>
                    <button type="button" class="navbar-toggle" data-click="top-menu-toggled">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>      
                    </button>
                </div><!-- end navbar-header -->  
        </div><!-- end #header -->

        <!-- begin #top-menu -->
        <div id="top-menu" class="top-menu" style="background-color: #242a30; color: #337ab7;">
            <!-- begin top-menu nav -->
            <ul class="nav navbar-right">
                <li>
                    <a href="index.html">
                        <i class="fa fa-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                
                <li class="has-sub">
                    <a href="javascript:;">
                            <b class="caret"></b>
                            <i class="fa fa-table"></i>
                            <span>Forms</span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="bplNewSingleApplicationForm.jsp">Business Permit (Single)</a></li>
                        <li><a href="bplNewCorpApplicationForm.jsp">Business Permit (Corp./ Partnership)</a></li>
                        <li><a href="email_inbox.jsp">Business Permit Renewal</a></li>
                        <li><a href="oc_appfrm_s.jsp">Occupational Permit (Single)</a></li>
                        <li><a href="oc_appfrm_m.jsp">Occupational Permit (Multiple)</a></li>
                        <li><a href="email_detail.html">MTOPs</a></li>
                    </ul>
                </li>
                
                <li>
                    <a href="index.html">
                        <i class="fa fa-question"></i>
                        <span>FAQs</span>
                    </a>
                </li>
                <li>
                    <a href="index.html">
                        <i class="fa fa-info"></i>
                        <span>About Us</span>
                    </a>
                </li>
                <li>
                    <a><span></span></a>
                </li>
                
            </ul>
            <!-- end top-menu nav -->
        </div><!-- end #top-menu -->

        <!-- begin #content -->
        <div id="content" class="content" style="padding: 20px 70px;">
            <!-- begin breadcrumb -->
            <ol class="breadcrumb pull-right">
                <li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
                <li class="breadcrumb-item"><a href="javascript:;">Forms</a></li>
                <li class="breadcrumb-item active">Occupational Permit (Single)</li>
            </ol><!-- end breadcrumb -->

            <h1 class="page-header">Occupational Permit <small> Application Form</small></h1>
            
            <!-- begin row -->
            <div class="col-lg-12 d-flex justify-content-center">
                <!-- begin col-6 -->
                <div class="col">
                    <!-- begin panel -->
                    <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                        
                        <!-- begin panel-heading -->
                        <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            </div>
                            <h4 class="panel-title">Applicant's Information </h4>
                        </div><!-- end panel-heading -->

                        <!-- begin panel-body -->
                        <div class="panel-body">
                            <form class="form-horizontal form-label-left" id="frmOcc" name="frmOcc" enctype="multipart/form-data" novalidate="" data-parsley-validate="">
                                <!-- begin row -->
                                    <div class="row">
                                        <!-- begin col-8 -->
                                        <div class="col-lg-6">

                                            <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">Personal info about yourself</legend>
                                            
                                            <div class="form-group row m-b-10">
                                                
                                                <div class="col-lg-4">
                                                    <label>First Name</label>
                                                    <input type="text" name="afname" id="afname" placeholder="Juan" class="form-control" required="true"/>
                                                </div>
                                                
                                                <div class="col-lg-4">
                                                    <label>Middle Name</label>
                                                    <input type="text" name="amname" id="amname"placeholder="Tamad" class="form-control" required="true"/>
                                                </div>  
                                                
                                                <div class="col-lg-4">
                                                    <label>Surname</label>
                                                    <input type="text" name="asname" id="asname" placeholder="Dela Cruz" class="form-control" required="true"/>
                                                </div>
                                            </div>

                                            <div class="form-group row m-b-10">
                                                <div class="col-lg-12">
                                                    <label>Address</label>
                                                    <textarea class="form-control m-b-10" name="aaddr" id="aaddr" rows="3" placeholder="Quezon City" required="true"></textarea>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row m-b-10">
                                                
                                                <div class="col-lg-6">
                                                    <label>Birth Date</label>
                                                    <input type="text" class="form-control date" id="abday"
                                                           name="abday" required/>
                                                </div>
                                                
                                                <div class="col-lg-6">
                                                    <label>Civil Status</label>
                                                    <select class="form-control" name="acstat" id="acstat" required="true">
                                                        <option value="" selected>Select a Civil Status</option>
                                                        <option value="Single">Single</option>
                                                        <option value="Married">Married</option>
                                                        <option value="Widowed">Widowed</option>
                                                        <option value="Divorced">Divorced</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group row m-b-10">
                                                
                                                <div class="col-lg-6">
                                                    <label>Contact Number</label>
                                                    <input type="text" name="acnum" id="acnum" placeholder="0999-5022-093" class="form-control" required="true"/>
                                                </div>

                                                <div class="col-lg-6">
                                                    <label>Sex</label>
                                                    <div class="col" required="true">
                                                        <div class="radio radio-css radio-inline">
                                                            <input type="radio" name="asex" id="sexm" value="M" checked />
                                                            <label for="sexm">M</label>
                                                        </div>
                                                        <div class="radio radio-css radio-inline">
                                                            <input type="radio" name="asex" id="sexf" value="F" />
                                                            <label for="sexf">F</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">Company Info</legend>

                                            <div class="form-group row m-b-10">
                                                <div class="col-lg-6">
                                                    <label>Company</label>
                                                    <input type="text" name="acomp" class="form-control" required="true"/>
                                                </div>

                                                <div class="col-lg-6">
                                                    <label>Job Description</label>
                                                    <select class="select2_single form-control"
                                                        id="ajdesc" name="ajdesc" tabindex="-1" required="true">
                                                            <%

                                                        LGUConnect con = new LGUConnect();
                                                        Connection con1 = con.getConnection();
                                                        Statement aa = con1.createStatement();
                                                        ResultSet ss = aa.executeQuery("SELECT * FROM `oc_r_job_desc`");
                                                        while (ss.next()){
                                                    %>
                                                            <option value="<%out.print(ss.getInt("JD_ID"));%>">
                                                                <%out.print(ss.getString("JD_NAME"));%>
                                                            </option>
                                                            <%
                                                        }
                                                    %>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group row m-b-10">
                                                <div class="col-lg-12">
                                                    <label>Company Address</label>
                                                    <textarea class="form-control m-b-10" name="aworkplace" id="aworkplace" rows="3" placeholder="Quezon City" required="true"></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group row m-b-10">
                                                
                                                <div class="col-lg-6">
                                                    <label>CTC/ Cedula #</label>
                                                    <input type="text" name="acedula" id="acedula" class="form-control" required="true"/>
                                                </div>
                                                
                                                <div class="col-lg-6">
                                                    <label>NBI / Police Clearance #</label>
                                                    <input type="text" name="anbi" id="anbi" class="form-control" required="true"/>
                                                </div>  
                                            </div>

                                            <div class="form-group row m-b-10">
                                                
                                                <div class="col-lg-6">
                                                    <label>Health Receipt #</label>
                                                    <input type="text" name="ahealth" id="ahealth" class="form-control" required="true"/>
                                                </div>

                                                <div class="col-lg-6">
                                        
                                                    <label class="control-label">Attachments (Requirements & ID Pic)</label><br> 
                                                    <input type="file" name="areq"
                                                    id="areq" required="required" accept=".doc,.docx,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- end row -->

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div style="padding: 0.5px; margin-bottom: 10px; background-color: #757575;">
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" id="btnsubmit" class="btn btn-primary m-r-5 m-b-5" style="margin-left: 1050px;">Submit</button>
                            </form>
                        </div>
                        <!-- end panel-body -->
                    </div>
                    <!-- end panel -->
                </div>
                <!-- end col-6 -->
            </div>
            <!-- end row -->
        </div><!-- end #content -->
              
        <!-- begin scroll to top btn -->
        <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a><!-- end scroll to top btn -->
    </div><!-- end page container -->


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

    <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="assets/plugins/ionRangeSlider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
    <script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <script src="assets/plugins/masked-input/masked-input.min.js"></script>
    <script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
    <script src="assets/plugins/password-indicator/js/password-indicator.js"></script>
    <script src="assets/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
    <script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
    <script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
    <script src="assets/plugins/jquery-tag-it/js/tag-it.min.js"></script>
    <script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
    <script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="assets/plugins/select2/dist/js/select2.min.js"></script>
    <script src="assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/plugins/bootstrap-show-password/bootstrap-show-password.js"></script>
    <script src="assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
    <script src="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <!-- ================== END PAGE LEVEL JS ================== -->

    <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="assets/plugins/parsleyjs/dist/parsley.min.js"></script>
    <script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
    <script src="assets/js/apps.min.js"></script>
    <script src="assets/js/form-wizards-validation.demo.min.js"></script>
    <script src="assets/js/form-plugins.demo.min.js"></script>
    <script src="assets/js/form-multiple-upload.demo.min.js"></script>
    <!-- ================== END PAGE LEVEL JS ================== -->

    <script>
        $(document).ready(function () {
            App.init();
            Highlight.init();
            FormPlugins.init();

            $('#abday').datetimepicker({
                format: "DD-MM-YY"
            });

            $("#btnsubmit").click(function () {
                var frmOcc = new FormData($('#applicationFormSingle')[0]);

                $.ajax({
                    type: "POST",
                    enctype:"multipart/form-data",
                    url: "uploadSingleAppForm",
                    data: frmOcc,
                    processData: false,
                    contentType: false,
                    success: function(response){
                        swal({
                            type: 'success',
                            title: 'All Done!',
                            html: 'Your Reference Number (Save It!): <b>' + JSON.stringify(response) + '</b> Your Application is subject to evaluation, Wait for further instructions. Ensure that your inserted contact number is active/valid!',
                            confirmButtonText: 'Proceed'
                        }).then((result) => {
                            if (result.value) {
                            var refx = "?refNo="+response;
                            //$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
                            window.location.replace("BPLSRtSlip.jsp"+refx);
                        }
                    });
                    },
                    error: function () {
                        swal("error", "Process encountered an error", "error");
                    }
                });
            })
        });
    </script>



</body>
</html>