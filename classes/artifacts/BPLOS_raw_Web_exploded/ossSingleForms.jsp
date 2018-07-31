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

<title>BPLS | Single Proprietorship</title>

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
	<!-- bootstrap-wysiwyg -->
    <link href="build/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="build/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="build/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="build/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="build/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
							<h3>Single Proprietorship</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<!-- 									START -->
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>List of Businesses</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<p class="text-muted font-13 m-b-30">List of Single
									Proprietorship Business. Click "Add New" to apply a new
									business. Click buttons within the action column to modify
									existing records.</p>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target=".ossSingleFormModal">
									<i class="fa fa-plus"></i> Add New
								</button>
								<table id="datatable-buttons"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Business Name</th>
											<th>Taxpayer's Name</th>
											<th>Business Address</th>
											<th>Telephone</th>
											<th>Date Issued</th>
											<th>Permit Type</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Spa Ni Mamita et. al.</td>
											<td>John Carlo Gutierrez</td>
											<td>123 Maligaya St. Quezon Avenue, Quezon City</td>
											<td>6396969</td>
											<td>2011/04/25</td>
											<td>New</td>
											<td><button type="submit" class="btn btn-success">Edit</button></td>
										</tr>
										<tr>
											<td>Lugawan Korean</td>
											<td>Jennifer Sanchez</td>
											<td>456 Matalino St. Quezon Avenue, Quezon City</td>
											<td>6375757</td>
											<td>2012/04/25</td>
											<td>Renewal</td>
											<td><button type="submit" class="btn btn-success">Edit</button></td>
										</tr>
										<tr>
											<td>Kanin Club</td>
											<td>Malene Dizon</td>
											<td>421 Tandang Sora Avenue, Quezon City</td>
											<td>6334757</td>
											<td>2015/04/25</td>
											<td>Renewal</td>
											<td><button type="submit" class="btn btn-success">Edit</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<%--OSS form--%>
					<div class="modal fade ossSingleFormModal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">

								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Add New</h4>
								</div>
								<div class="modal-body">
									<h4>Fill the necessary fields</h4>
									<form class="form-horizontal form-label-left input_mask">

										<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
											<input type="text" class="form-control" id="inputSuccess2" placeholder="Business Name/Trade Name">

										</div>

										<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
											<input type="text" class="form-control" id="inputSuccess3" placeholder="Last Name">
											<span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
										</div>

										<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
											<input type="text" class="form-control has-feedback-left" id="inputSuccess4" placeholder="Email">
											<span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
										</div>

										<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
											<input type="text" class="form-control" id="inputSuccess5" placeholder="Phone">
											<span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">Default Input</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="Default Input">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">Disabled Input </label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" disabled="disabled" placeholder="Disabled Input">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">Read-Only Input</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" readonly="readonly" placeholder="Read-Only Input">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Birth <span class="required">*</span>
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
											</div>
										</div>
										<div class="ln_solid"></div>

									</form>
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
<!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="../vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="../vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Autosize -->
    <script src="../vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="../vendors/starrr/dist/starrr.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="build/js/custom.min.js"></script>
</body>
</html>
