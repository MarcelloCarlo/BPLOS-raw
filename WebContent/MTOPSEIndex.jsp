<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/9/2018
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page
        language="java"
        contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"
%>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta
            http-equiv="Content-Type"
            content="text/html; charset=UTF-8"
    >
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta
            http-equiv="X-UA-Compatible"
            content="IE=edge"
    >
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
    >
    <meta charset="ISO-8859-1">
    <link rel="icon" href="extras/logo1.png">
    <title>MTOPS | Evaluation</title>
    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <%-- <link
             href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
             rel="stylesheet"
     >--%>
    <link
            href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/plugins/font-awesome/css/font-awesome.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/css/animate.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/css/style.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/css/style-responsive.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/css/theme/default.css"
            rel="stylesheet"
            id="theme"
    />
    <!-- ================== END BASE CSS STYLE ================== -->
    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link
            href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css"
            rel="stylesheet"
    />
    <!-- ================== END PAGE LEVEL STYLE ================== -->
    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
    <!-- clippy -->
    <!-- <link href="assets/plugins/smore-inc-clippy.js/build/clippy.css"
        rel="stylesheet"> -->
</head>
<%
    LGUConnect conX = new LGUConnect();
    try {
        Connection conn3 = conX.getConnection();
        Statement ss3 = conn3.createStatement();
        ResultSet gg3 = ss3.executeQuery("SELECT * FROM mtops_t_application_frm WHERE APF_STATUS = 'Pending'"); %>
<body>
<!-- begin #page-loader -->
<div
        id="page-loader"
        class="fade in"
>
    <span class="spinner"></span>
</div>
<!-- end #page-loader -->
<jsp:include page="MTOPSEComponent.jsp"/>
<div
        id="page-container"
        class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu"
>
    <!-- page content -->
    <div
            id="content"
            class="content"
    >
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
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Evaluation Table</h4>
                        </div>
                        <div class="panel-body">
                            <table
                                    id="data-table"
                                    class="table table-striped table-bordered nowrap"
                                    width="100%"
                            >
                                <thead>
                                <tr>
                                    <th>Applicant's Name</th>
                                    <th>TODA</th>
                                    <th>Status</th>
                                    <th>Date Received</th>
                                    <th>Action</th>

                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    while (gg3.next()) {

                                %>

                                <tr>
                                    <td></td>
                                    <td>TODA</td>
                                    <td>Status</td>
                                    <td>Date Received</td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-success mtopsModal"
                                                data-toggle="modal"
                                                data-target=".evaluation-modal-mtops"
                                        > Evaluate
                                        </button>
                                    </td><!--7-->
                                </tr>

                                <%
                                        }
                                    } catch (SQLException | ClassNotFoundException e) {
                                        out.print(e);
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
    <div
            class="modal fade evaluation-modal-mtops"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="mtopsApplForm"
                    class="form-horizontal"
                    name="mtopsApplForm"
                    enctype="multipart/form-data"
            >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="panel panel-inverse panel-danger">
                            <div class="panel-heading">
                                <h4 class="panel-title">Check Requirement for New Application</h4>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                 <input type="text"
                                         class="hide"
                                         id="_AP_REFERENCE_NO"
                                         name="_AP_REFERENCE_NO"
                                />
                                    <div class="col-md-12 panel-body">
                                        <h5>
                                            Applicant's Name:
                                            <!-- <input disabled=""
                                            id="nBussName" type="text" /> -->
                                            <label id="nApplName"></label>
                                        </h5>
                                        <h5>
                                            TODA:
                                            <!-- <input
                                            disabled="" id="nBussOwner" type="text" /> -->
                                            <label id="nTODA"></label>
                                        </h5>
                                    </div>
                                    <div class="panel-body">
                                        <hr>
                                        <label id="AT_UNIFIED_FILE_NAME"></label><br>
                                        <button
                                                type="button"
                                                class="btn btn-primary form-control"
                                                id="fileDownload"
                                        >DOWNLOAD ATTACHMENT
                                        </button>
                                    </div>
                                    <hr>
                                    <div class="panel-body">
                                        <h5>Requirements Checklist:</h5>
                                        <div class="col-md-12">
                                            <ul class="to_do">
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="AT_COMM_TAX_CERT"
                                                            name="AT_COMM_TAX_CERT"
                                                            class="flat"
                                                            value="Pass"
                                                    > Community Tax Certificate
                                                </p>
                                                <p id="dtiID">
                                                    <input
                                                            type="checkbox"
                                                            id="AT_LTO_REG_CERT"
                                                            name="AT_LTO_REG_CERT"
                                                            class="flat"
                                                            value="Pass"
                                                    > LTO Registration Certificate
                                                </p>
                                                <p id="secID">
                                                    <input
                                                            type="checkbox"
                                                            id="AT_TRICUNIT_PURCH"
                                                            name="AT_TRICUNIT_PURCH"
                                                            class="flat"
                                                            value="Pass"
                                                    > Proof of Purchase/Official Receipt of Tricycle Unit
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="AT_BRGY_CLEAR"
                                                            name="AT_BRGY_CLEAR"
                                                            class="flat"
                                                            value="Pass"
                                                    > Barangay Clearance
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="AT_TODA_LTR_CERT"
                                                            name="AT_TODA_LTR_CERT"
                                                            class="flat"
                                                            value="Pass"
                                                    > Letter/Certificate of referrence from TODA
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="AT_ID_PIC"
                                                            name="AT_ID_PIC"
                                                            class="flat"
                                                            value="Pass"
                                                    > 2x2 ID Picture
                                                </p>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                    type="button"
                                    class="btn btn-default"
                                    data-dismiss="modal"
                                    id="btnCloseNewApplModal"
                            >Close
                            </button>
                            <button
                                    type="button"
                                    id="btnMtopsAppl"
                                    class="btn btn-success"
                            >Evaluate
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

<jsp:include page="MTOPSEFooter.jsp"></jsp:include>
<!-- ================== BEGIN BASE JS ================== -->
<script src="assets/plugins/js/jquery.min.js"></script>
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
        src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"
></script>
<script
        src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"
></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/divMtopsEvaluation.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

</body>
</html>
