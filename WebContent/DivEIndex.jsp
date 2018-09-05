<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.qcapaeis.dbConnection.LGUConnect"%>
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


<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link
	href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css"
	rel="stylesheet" />
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="assets/css/animate.min.css" rel="stylesheet" />
<link href="assets/css/style.min.css" rel="stylesheet" />
<link href="assets/css/style-responsive.min.css" rel="stylesheet" />
<link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
<!-- ================== END BASE CSS STYLE ================== -->

<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
<link
	href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css"
	rel="stylesheet" />
<link
	href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css"
	rel="stylesheet" />
<!-- ================== END PAGE LEVEL STYLE ================== -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="assets/plugins/pace/pace.min.js"></script>
<!-- ================== END BASE JS ================== -->
<!-- clippy -->
<link href="assets/plugins/smore-inc-clippy.js/build/clippy.css"
	rel="stylesheet">
</head>

<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in">
		<span class="spinner"></span>
	</div>
	<!-- end #page-loader -->
	<jsp:include page="DivEComponent.jsp" />
	<div id="page-container"
		class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">
		<!-- page content -->
		<div id="content" class="content">
			<div class="">
			 <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li><a href="javascript:;">Evaluation</a></li>
            <li class="active">Application Processing</li>
        </ol>
          <!-- begin page-header -->
        <h1 class="page-header">Application Processing</h1>
        <!-- end page-header -->
        
        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                        </div>
                        <h4 class="panel-title">Application Form Evaluation Table</h4>
                    </div>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                           <thead>
									<tr>
										<th>Name</th>
										<th>Business Nature</th>
										<th>Ownership Type</th>
										<th>Application Type</th>
										<th>Date Received</th>
										<th>Action</th>
									</tr>
								</thead>
                       	<tbody>
									<%

                                      LGUConnect conX = new LGUConnect();
                                      Connection conn3 = conX.getConnection();
                                      Statement ss3 = conn3.createStatement();
                                      ResultSet gg3 = ss3.executeQuery("SELECT BUS.BU_NAME, BN.BN_NAME, OT.OT_NAME, AP.AP_DATE, AP.AP_TYPE  FROM lgu_r_business BUS INNER JOIN lgu_r_business_nature BN ON BN.BN_ID = BUS.BN_ID INNER JOIN lgu_r_ownership_type OT ON OT.OT_ID = BUS.OT_ID INNER JOIN lgu_r_bp_application AP ON AP.BU_ID = BUS.BU_ID");
                                while (gg3.next())
                                {
                            %>
									<tr>
										<td><%=gg3.getString("BUS.BU_NAME")%></td>
										<td><%=gg3.getString("BN.BN_NAME")%></td>
										<td><%=gg3.getString("OT.OT_NAME")%></td>
										<td><%=gg3.getString("AP.AP_TYPE")%></td>
										<td><%=gg3.getString("AP.AP_DATE")%></td>
										<%--<td>--%>
										<%--<a href="#" class="btn btn-success btn-xs">Edit</a>--%>
										<%--</td>--%>

										<td><button type="button" class="btn btn-success"
												data-toggle="modal" data-target=".evaluation-modal-new">Action</button></td>

									</tr>
									<%
                                }
                            %>

								</tbody>
                        </table>
                    </div>
                </div>
                <!-- end panel -->
            </div>
        </div>
			</div>
		</div>
		<!-- /page content -->

		<!-- New modal -->
		<div class="modal fade evaluation-modal-new" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">x</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Check Requirements
							for New Application</h4>
					</div>
					<div class="modal-body">
						<label>Business Name/Corporate Name: </label><br> <label>Name
							of Sole Proprietor/Partnership/President: </label><br> <label>Business
							Address: </label><br> <label>Tel No.: </label><br> <label>Authorized
							Representative: </label><br> <label>Address: </label>
						<hr>
						<div class="x_content">

							<div class="">
								<ul class="to_do">
									<li>
										<p>
											<input type="checkbox" class="flat"> Original
											Barangay Clearance
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> DTI Registration
											(for Single Proprietorship
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> SEC Registration
											with Artices (for Corporation/Partnership
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Title to
											property of Tax Declaration (if owned)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Contract of
											Lease and Lessor's Business Permit (if rented)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Authorization
											Letter & ID (if representative)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Owner's ID
										</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-success">Save
							changes</button>
					</div>

				</div>
			</div>
		</div>

		<!-- Renewal modal -->
		<div class="modal fade evaluation-modal-renew" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">x</span>
						</button>
						<h4 class="modal-title" id="myModalLabel2">Check Requirements
							for Renewal Application</h4>
					</div>
					<div class="modal-body">
						<label>Business Name/Corporate Name: </label><br> <label>Business
							Permit No: </label><br> <label>Name of Sole
							Proprietor/Partnership/President: </label><br> <label>Business
							Address: </label><br> <label>District: </label><br> <label>Authorized
							Representative: </label><br> <label>Cellphone No.: </label><br>
						<label>Address: </label>
						<hr>
						<div class="x_content">

							<div class="">
								<ul class="to_do">
									<li>
										<p>
											<input type="checkbox" class="flat"> Original Copy of
											Previous Business Permit, if not applicable Certified xerox
											copy
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Xerox copy of
											Tax Bill and Official Receipt (current)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Original Copy of
											Barangay Clearance (for renewal purpose)
										</p>
									</li>
									<p>Other Document Requirements required such as:</p>
									<li>
										<p>
											<input type="checkbox" class="flat"> Locational
											Clearance (LC)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Fire Safety
											Inspection Certificate (FSIC)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Sanitary Permit
											(SP)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> CTAO Certificate
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Certificate of
											Electrical Inspection (CEI)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> Lessor's
											Business Permit (if rented)
										</p>
									</li>
									<li>
										<p>
											<input type="checkbox" class="flat"> PCAB License
										</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-success">Save
							changes</button>
					</div>

				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>


	</div>

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
	<script
		src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
	<script
		src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
	<script src="assets/js/table-manage-responsive.demo.min.js"></script>
	<script src="assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script>
    $(document).ready(function() {
        App.init();
        TableManageResponsive.init();
    });
</script>
	<!-- clippy -->
	<script src="assets/plugins/smore-inc-clippy.js/build/clippy.js"></script>
	<!-- Init script -->
	<script type="text/javascript">
    clippy.load('Clippy', function(agent){
        // do anything with the loaded agent
          agent.animate();
        agent.show();
      
    });
</script>
</body>
</html>
