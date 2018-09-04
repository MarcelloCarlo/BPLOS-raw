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

<!-- Bootstrap -->
<link href="assets/plugins/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="assets/plugins/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="assets/plugins/css/nprogress.css" rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="assets/plugins/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link
	href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="assets/plugins/css/custom.min.css" rel="stylesheet">
<!-- clippy -->
<link href="assets/plugins/smore-inc-clippy.js/build/clippy.css" rel="stylesheet"> 
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="DivEComponent.jsp" />

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Evaluation</h3>
						</div>

					</div>

					<div class="clearfix"></div>

					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Application Permit Evaluation</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<p class="text-muted font-13 m-b-30">This tables shows all
									applications</p>

								<table id="datatable-responsive"
									class="table table-striped table-bordered dt-responsive nowrap"
									cellspacing="0" width="100%">
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

											<td><button type="button" class="btn btn-primary"
													data-toggle="modal" data-target=".evaluation-modal-new">Action</button></td>

										</tr>
										<%
                                }
                            %>

									</tbody>
								</table>


							</div>
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
												<input type="checkbox" class="flat"> DTI
												Registration (for Single Proprietorship
											</p>
										</li>
										<li>
											<p>
												<input type="checkbox" class="flat"> SEC
												Registration with Artices (for Corporation/Partnership
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
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
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
							<h4 class="modal-title" id="myModalLabel2">Check
								Requirements for Renewal Application</h4>
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
												<input type="checkbox" class="flat"> Original Copy
												of Previous Business Permit, if not applicable Certified
												xerox copy
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
												<input type="checkbox" class="flat"> Original Copy
												of Barangay Clearance (for renewal purpose)
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
												<input type="checkbox" class="flat"> CTAO
												Certificate
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
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>

					</div>
				</div>
			</div>

			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- jQuery -->
	<script src="assets/plugins/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="assets/plugins/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="assets/plugins/js/fastclick.js"></script>
	<!-- NProgress -->
	<script src="assets/plugins/js/nprogress.js"></script>
	<!-- Chart.js -->
	<script src="assets/plugins/Chart.js/dist/Chart.min.js"></script>
	<!-- jQuery Sparklines -->
	<script
		src="assets/plugins/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- morris.js -->
	<script src="assets/plugins/raphael/raphael.min.js"></script>
	<script src="assets/plugins/morris.js/morris.min.js"></script>
	<!-- gauge.js -->
	<script src="assets/plugins/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="assets/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- Skycons -->
	<script src="assets/plugins/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="assets/plugins/Flot/jquery.flot.js"></script>
	<script src="assets/plugins/Flot/jquery.flot.pie.js"></script>
	<script src="assets/plugins/Flot/jquery.flot.time.js"></script>
	<script src="assets/plugins/Flot/jquery.flot.stack.js"></script>
	<script src="assets/plugins/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script src="assets/plugins/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script src="assets/plugins/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="assets/plugins/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="assets/plugins/DateJS/build/date.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="assets/plugins/moment/min/moment.min.js"></script>
	<script
		src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- Datatables -->
	<script src="assets/plugins/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="assets/plugins/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="assets/plugins/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="assets/plugins/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="assets/plugins/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="assets/plugins/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="assets/plugins/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="assets/plugins/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="assets/plugins/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="assets/plugins/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="assets/plugins/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="assets/plugins/jszip/dist/jszip.min.js"></script>
	<script src="assets/plugins/pdfmake/build/pdfmake.min.js"></script>
	<script src="assets/plugins/pdfmake/build/vfs_fonts.js"></script>
	<!-- clippy -->
	<script src="assets/plugins/smore-inc-clippy.js/build/clippy.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="assets/plugins/js/custom.min.js"></script>
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
