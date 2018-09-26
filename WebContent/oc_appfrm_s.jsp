<%@ page import="com.qcapaeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>LGU PAIS | Occupational Form</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/plugins/font-awesome/5.0/css/fontawesome-all.min.css" rel="stylesheet" />
	<link href="assets/plugins/animate/animate.min.css" rel="stylesheet" />
	<link href="assets/css/default/style.min.css" rel="stylesheet" />
	<link href="assets/css/default/style-responsive.min.css" rel="stylesheet" />
	<link href="assets/css/default/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet" />
	<link href="assets/plugins/jquery-smart-wizard/src/css/smart_wizard.css" rel="stylesheet" />
	
	<link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet" />
	<link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.css" rel="stylesheet" />
	<link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.skinNice.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" />
	<link href="assets/plugins/password-indicator/css/password-indicator.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-combobox/css/bootstrap-combobox.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" />
	<link href="assets/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css" rel="stylesheet" />
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.css" rel="stylesheet" />
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-fontawesome.css" rel="stylesheet" />
    <link href="assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-glyphicons.css" rel="stylesheet" />

	<!-- ================== END PAGE LEVEL STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="assets/plugins/pace/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</head>

<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade show"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">
		<!-- begin #header -->
		<div id="header" class="header navbar-default">
			<!-- begin navbar-header -->
			<div class="navbar-header">
				<a href="index.html" class="navbar-brand"><span class="navbar-logo"></span> <b>LGU</b> PA-EIS</a>
				<button type="button" class="navbar-toggle" data-click="top-menu-toggled">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<!-- end navbar-header -->
				
			<!-- begin header navigation right -->
			<ul class="navbar-nav navbar-right">
				<li>
					<form class="navbar-form full-width">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter keyword" />
							<button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</li>
				<li class="dropdown">
					<a href="javascript:;" data-toggle="dropdown" class="dropdown-toggle f-s-14">
						<i class="fa fa-bell"></i>
						<span class="label">5</span>
					</a>
					<ul class="dropdown-menu media-list pull-right">
						<li class="dropdown-header">NOTIFICATIONS (5)</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<i class="fa fa-bug media-object bg-silver-darker"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading">Server Error Reports <i class="fa fa-exclamation-circle text-danger"></i></h6>
									<div class="text-muted f-s-11">3 minutes ago</div>
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<img src="assets/img/user/user-1.jpg" class="media-object" alt="" />
									<i class="fab fa-facebook-messenger text-primary media-object-icon"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading">John Smith</h6>
									<p>Quisque pulvinar tellus sit amet sem scelerisque tincidunt.</p>
									<div class="text-muted f-s-11">25 minutes ago</div>
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<img src="assets/img/user/user-2.jpg" class="media-object" alt="" />
									<i class="fab fa-facebook-messenger text-primary media-object-icon"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading">Olivia</h6>
									<p>Quisque pulvinar tellus sit amet sem scelerisque tincidunt.</p>
									<div class="text-muted f-s-11">35 minutes ago</div>
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<i class="fa fa-plus media-object bg-silver-darker"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading"> New User Registered</h6>
									<div class="text-muted f-s-11">1 hour ago</div>
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<i class="fa fa-envelope media-object bg-silver-darker"></i>
									<i class="fab fa-google text-warning media-object-icon f-s-14"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading"> New Email From John</h6>
									<div class="text-muted f-s-11">2 hour ago</div>
								</div>
							</a>
						</li>
						<li class="dropdown-footer text-center">
							<a href="javascript:;">View more</a>
						</li>
					</ul>
				</li>
				<li class="dropdown navbar-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<img src="assets/img/user/user-13.jpg" alt="" />
						<span class="hidden-xs">Jennifer Sanchez</span> <b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li class="arrow"></li>
						<li><a href="javascript:;">Edit Profile</a></li>
						<li><a href="javascript:;"><span class="badge badge-danger pull-right">2</span> Inbox</a></li>
						<li><a href="javascript:;">Calendar</a></li>
						<li><a href="javascript:;">Setting</a></li>
						<li class="divider"></li>
						<li><a href="javascript:;">Log Out</a></li>
					</ul>
				</li>
			</ul>
			<!-- end header navigation right -->
		</div>
		<!-- end #header -->
		
		<!-- begin #top-menu -->
		<div id="top-menu" class="top-menu">
            <!-- begin top-menu nav -->
			<ul class="nav d-flex justify-content-end">
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
        </div>
		<!-- end #top-menu ============================================================================ -->
		
		<!-- begin #content -->
		<div id="content" class="content" style="padding: 20px 70px;">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb pull-right">
				<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
				<li class="breadcrumb-item"><a href="javascript:;">Forms</a></li>
				<li class="breadcrumb-item active">Occupational Permit (Single)</li>
			</ol> 
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Occupational Permit <small> Application Form</small></h1>
			<!-- end page-header -->
			
			<!-- begin row -->
			<div class="col d-flex justify-content-center">
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
                            <form class="form-horizontal" data-parsley-validate="true" name="demo-form">
								
								<!-- begin row -->
									<div class="row">
										<!-- begin col-8 -->
										<div class="col-md-6">
											<legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">Personal info about yourself</legend>
											
											<div class="form-group row m-b-10">
												
												<div class="col">
													<label>First Name</label>
													<input type="text" name="afname" id="afname" placeholder="Juan" class="form-control" />
												</div>
												
												<div class="col">
													<label>Middle Name</label>
													<input type="text" name="amname" id="amname"placeholder="Tamad" class="form-control" />
												</div>	
												
												<div class="col">
													<label>Surname</label>
													<input type="text" name="asname" id="asname" placeholder="Dela Cruz" class="form-control" />
												</div>
											</div>

											<div class="form-group row m-b-10">
												<div class="col">
													<label>Address</label>
													<textarea class="form-control m-b-10" name="aaddr" id="aaddr" rows="3" placeholder="Quezon City"></textarea>
												</div>
											</div>
											
											<div class="form-group row m-b-10">
												
												<div class="col">
													<label>Birth Date</label>
			                                        <input type="text" class="form-control" placeholder="select date" name="abday" id="datepicker-autoClose" />
				                                </div>
				                                
				                                <div class="col">
													<label>Civil Status</label>
												    <select class="form-control" name="acstat" id="acstat">
			                                            <option value="" selected>Select a Civil Status</option>
			                                            <option value="Single">Single</option>
			                                            <option value="Married">Married</option>
			                                            <option value="Widowed">Widowed</option>
			                                            <option value="Divorced">Divorced</option>
			                                        </select>
												</div>
											</div>

											<div class="form-group row m-b-10">
												
												<div class="col">
													<label>Contact Number</label>
													<input type="text" name="acnum" id="acnum" placeholder="0999-5022-093" class="form-control" />
												</div>

												<div class="col">
													<label>Sex</label>
				                                    <div class="col">
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
										<!-- end col-8 -->

										<!-- begin col-4 -->
										<div class="col-md-6">
											<legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">Company Info</legend>

											<div class="form-group row m-b-10">
												<div class="col">
													<label>Company</label>
													<input type="text" name="acomp" class="form-control" />
												</div>

				                                <div class="col">
													<label>Job Description</label>
													<select class="select2_single form-control"
														id="ajdesc" name="ajdesc" tabindex="-1">
															<%

                                                        LGUConnect con = new LGUConnect();
                                                        Connection con1 = con.getConnection();
                                                        Statement aa = con1.createStatement();
                                                        ResultSet ss = aa.executeQuery("SELECT * FROM `lgu_oc_job_desc`");
                                                        while (ss.next()){
                                                    %>
															<option value="<%out.print(ss.getInt("JD_ID"));%>">
																<%out.print(ss.getString("JD_NAME"));%>
															</option>
															<%
                                                        }
                                                    %>
													</select>
												    <%--<select class="form-control">--%>
			                                            <%--<option value="" selected>Select Job Description</option>--%>
			                                            <%--<option value="Single">Single</option>--%>
			                                            <%--<option value="Married">Married</option>--%>
			                                            <%--<option value="Widowed">Widowed</option>--%>
			                                            <%--<option value="Divorced">Divorced</option>--%>
			                                        <%--</select>--%>
												</div>
											</div>

											<div class="form-group row m-b-10">
												<div class="col">
													<label>Company Address</label>
													<textarea class="form-control m-b-10" name="aworkplace" id="aworkplace" rows="3" placeholder="Quezon City"></textarea>
												</div>
											</div>

											<div class="form-group row m-b-10">
												
												<div class="col">
													<label>CTC/ Cedula #</label>
													<input type="text" name="acedula" id="acedula" class="form-control" />
												</div>
												
												<div class="col">
													<label>NBI / Police Clearance #</label>
													<input type="text" name="anbi" id="anbi" class="form-control" />
												</div>	
											</div>

											<div class="form-group row m-b-10">
												
												<div class="col">
													<label>Health Receipt #</label>
													<input type="text" name="ahealth" id="ahealth" class="form-control" />
												</div>

												<div class="col">
										
													<label class="control-label">Attachments (Requirements & ID Pic)</label><br> 
													<input type="file" name="areq"
													id="areq" required="required" accept=".doc,.docx,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf"/>
												</div>
											</div>

										</div>
										<!-- end col-4 -->
									</div>
									<!-- end row -->
									<div class="row">
		                                <div class="col-md-12">
		                                    <div style="padding: 0.5px; margin-bottom: 10px; background-color: #757575;">
		                                    </div>
		                                </div>
		                            </div>
									<div class="col d-flex justify-content-end">
										<button type="button" id="btnsubmit" class="btn btn-primary m-r-5 m-b-5">Submit</button>
									</div>
                            </form>
                        </div>
                        <!-- end panel-body -->
                    </div>
                    <!-- end panel -->
                </div>
                <!-- end col-6 -->
            </div>
            <!-- end row -->
		</div>
		<!-- end #content -->
		
        <!-- begin theme-panel ========================================================================= -->
        <div class="theme-panel">
            <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn"><i class="fa fa-cog"></i></a>
            <div class="theme-panel-content">
                <h5 class="m-t-0">Color Theme</h5>
                <ul class="theme-list clearfix">
                    <li class="active"><a href="javascript:;" class="bg-green" data-theme="default" data-theme-file="assets/css/default/theme/default.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Default">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-red" data-theme="red" data-theme-file="assets/css/default/theme/red.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Red">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-blue" data-theme="blue" data-theme-file="assets/css/default/theme/blue.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Blue">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-purple" data-theme="purple" data-theme-file="assets/css/default/theme/purple.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Purple">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-orange" data-theme="orange" data-theme-file="assets/css/default/theme/orange.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Orange">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-black" data-theme="black" data-theme-file="assets/css/default/theme/black.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Black">&nbsp;</a></li>
                </ul>
                <div class="divider"></div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label double-line">Header Styling</div>
                    <div class="col-md-7">
                        <select name="header-styling" class="form-control form-control-sm">
                            <option value="1">default</option>
                            <option value="2">inverse</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label">Header</div>
                    <div class="col-md-7">
                        <select name="header-fixed" class="form-control form-control-sm">
                            <option value="1">fixed</option>
                            <option value="2">default</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label double-line">Sidebar Styling</div>
                    <div class="col-md-7">
                        <select name="sidebar-styling" class="form-control form-control-sm">
                            <option value="1">default</option>
                            <option value="2">grid</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label">Sidebar</div>
                    <div class="col-md-7">
                        <select name="sidebar-fixed" class="form-control form-control-sm">
                            <option value="1">fixed</option>
                            <option value="2">default</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label double-line">Sidebar Gradient</div>
                    <div class="col-md-7">
                        <select name="content-gradient" class="form-control form-control-sm">
                            <option value="1">disabled</option>
                            <option value="2">enabled</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label double-line">Content Styling</div>
                    <div class="col-md-7">
                        <select name="content-styling" class="form-control form-control-sm">
                            <option value="1">default</option>
                            <option value="2">black</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-12">
                        <a href="javascript:;" class="btn btn-inverse btn-block btn-sm" data-click="reset-local-storage">Reset Local Storage</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- end theme-panel -->
		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="assets/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	<!--[if lt IE 9]>
		<script src="assets/crossbrowserjs/html5shiv.js"></script>
		<script src="assets/crossbrowserjs/respond.min.js"></script>
		<script src="assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/plugins/js-cookie/js.cookie.js"></script>
	<script src="assets/js/theme/default.min.js"></script>
	<script src="assets/js/apps.min.js"></script>
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="assets/js/demo/form-wizards.demo.min.js"></script>
	<script src="assets/plugins/jquery-smart-wizard/src/js/jquery.smartWizard.js"></script>
	<script src="assets/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
	<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/js/demo/form-plugins.demo.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<%--<script>--%>
		<%--$(document).ready(function() {--%>
			<%--App.init();--%>
			<%--Highlight.init();--%>
			<%--FormPlugins.init();--%>
		<%--});--%>
	<%--</script>--%>

	<script type="text/javascript">
		$(document).ready(function (){

			$("#btnSubmitAF").click(function() {
			
				var S_fname = $('#afname').val();
				var S_mname = $('#amname').val();
				var S_lname = $('#asname').val();
				var S_addre = $('#aaddr').val();
				var S_bdate = $('#abday').val();
				var S_cstat = $('#acstat').val();
				var S_cnum = $('#acnum').val();
				var S_sex = $('#asex').val();

				var S_comp = $('#acomp').val();
				var S_jdesc = $('#ajdesc').val();
				var S_work = $('#aworkplace').val();
				var S_cedula = $('#acedula').val();
				var S_nbi = $('#anbi').val();
				var S_health = $('#ahealth').val();
				var S_req = $('#areq').val();

				$.ajax({
					type:'POST',
					data:
					{	
						S_fname:S_fname,
						S_mname:S_mname,
						S_lname:S_lname,

						S_addre:S_addre,
						S_bdate:S_bdate,
						S_cstat:S_cstat,
						S_cnum:S_cnum,
						S_sex:S_sex,

						S_comp:S_comp,
						S_jdesc:S_jdesc,
						S_work:S_work,
						S_cedula:S_cedula,
						S_nbi:S_nbi,
						S_health:S_health,
						S_req:S_req
					},

					url:'insertOcfrmSs',
					success: function(result){
						
						setTimeout(location.reload.bind(location), 1000);		
					},
					error:function(result)
					{
					
					}
				});
			});		
		});
	</script>				
</body>
</html>
