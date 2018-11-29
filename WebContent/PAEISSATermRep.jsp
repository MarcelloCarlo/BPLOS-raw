<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: John Carlo Villar
  Date: 09/27/2018
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <title>BPLS | Termination Reports</title>
    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <%--<link--%>
    <%--href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"--%>
    <%--rel="stylesheet"--%>
    <%-->--%>
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

</head>
<%
    LGUConnect conX = new LGUConnect();
    Connection conn3 = null;
    ResultSet gg3 = null;
    try {
        conn3 = conX.getConnection();
        Statement ss3 = conn3.createStatement();
        gg3 = ss3.executeQuery("SELECT * FROM bpls_t_bp_application JOIN bpls_t_business business on bpls_t_bp_application.BU_ID = business.BU_ID JOIN bpls_r_business_nature nature on business.BN_ID = nature.BN_ID WHERE AP_STATUS = 'Terminated' AND  AP_DIV_CODE_TO = 'DIV-EV'");%>
<body>
<jsp:include page="PAEISSAComponent.jsp"/>
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
                <li><a href="javascript:;">System Admin</a></li>
                <li class="active">Termination Reports</li>
            </ol>
            <!-- begin page-header -->
            <h1 class="page-header">Termination Reports</h1>
            <!-- end page-header -->
            <div class="row">
                <div class="col-md-12">
                    <!-- begin panel -->
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Terminated Applications</h4>
                        </div>
                        <div class="panel-body">
                            <table
                                    id="data-table"
                                    class="table table-striped table-bordered nowrap"
                                    width="100%"
                            >
                                <thead>
                                <tr>
                                    <th>Business Name</th>
                                    <th>Business Nature</th>
                                    <th>Date Terminated</th>
                                    <th>Remarks</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%

                                    while (gg3.next()) {
                                %>
                                <tr>
                                    <td><%=gg3.getString("BU_NAME")%>
                                    </td><!--0-->
                                    <td><%=gg3.getString("BN_NAME")%>
                                    </td><!--1-->
                                    <td><%=gg3.getString("AP_DATE_ACCESSED")%>
                                    </td><!--1-->
                                    <td><%=gg3.getString("AP_REMARKS")%>
                                    </td><!--1-->
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
    <div
            class="modal modal-message fade evaluation-modal-new"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="newApplForm"
                    class="form-horizontal"
                    name="newApplForm"
                    enctype="multipart/form-data"
            >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="panel-heading-btn">
                            <button
                                    type="button"
                                    id="closeNewPanelWindow"
                                    class="btn btn-xs btn-icon btn-circle btn-danger right"
                                    data-dismiss="modal"
                            >
                                <i class="fa fa-times"></i>
                            </button>
                        </div>
                        <h4
                                class="modal-title"
                                id="myModalLabel"
                        >Check Requirements for New Application</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <input type="number"
                                       class="hide"
                                       id="_AT_ID"
                                       name="_AT_ID"
                                /> <input type="number"
                                          class="hide"
                                          id="_AP_ID"
                                          name="_AP_ID"
                            />
                                <div class="col-md-8">
                                    <h5>
                                        Business Name/Corporate Name:
                                        <!-- <input disabled=""
                                        id="nBussName" type="text" /> -->
                                        <label id="nBussName"></label>
                                    </h5>
                                    <h5>
                                        Name of Sole Proprietor/Partnership/President:
                                        <!-- <input
                                        disabled="" id="nBussOwner" type="text" /> -->
                                        <label id="nBussOwner"></label>
                                    </h5>
                                    <h5>
                                        Business Address:
                                        <!-- <input disabled="" id="nBussAddr"
                                        type="text" /> -->
                                        <label id="nBussAddr"></label>
                                    </h5>
                                    <h5>
                                        Tel No.:
                                        <!--  <input disabled="" id="nBussConTelno" type="text" /> -->
                                        <label id="nBussConTelno"></label>
                                    </h5>
                                    <h5>
                                        Authorized Representative:
                                        <!--  <input disabled=""
                                        id="nBussAuthRepName" type="text" /> -->
                                        <label id="nBussAuthRepName"></label>
                                    </h5>
                                    <h5>
                                        Address:
                                        <!-- <input disabled="" id="nBussAuthRepAddr" type="text" /> -->
                                        <label id="nBussAuthRepAddr"></label>
                                    </h5>
                                    <h5>
                                        Business Nature:
                                        <!-- <input disabled="" id="nBussAuthRepAddr" type="text" /> -->
                                        <label id="nBussNature"></label>
                                    </h5>
                                </div>
                                <div class="col-md-8">
                                    <div class="col-md-6">
                                        <hr>
                                        <label id="AT_UNIFIED_FILE_NAME"></label><br>
                                        <button
                                                type="button"
                                                class="btn btn-primary form-control"
                                                id="fileDownload"
                                        >DOWNLOAD ATTACHMENT
                                        </button>
                                    </div>
                                </div>
                                <div class="">
                                    <h5>Requirements Checklist</h5>
                                    <div class="">
                                        <ul class="to_do">
                                            <p>
                                                <input
                                                        type="checkbox"
                                                        id="AT_BRGY_CLEARANCE"
                                                        name="AT_BRGY_CLEARANCE"
                                                        class="flat"
                                                        value="Pass"
                                                > Original Barangay Clearance
                                            </p>
                                            <p>
                                                <input
                                                        type="checkbox"
                                                        id="AT_DTI_REGISTRATION"
                                                        name="AT_DTI_REGISTRATION"
                                                        class="flat"
                                                        value="Pass"
                                                > DTI Registration (for Single Proprietorship
                                            </p>
                                            <p>
                                                <input
                                                        type="checkbox"
                                                        id="AT_SEC_REGISTRATION"
                                                        name="AT_SEC_REGISTRATION"
                                                        class="flat"
                                                        value="Pass"
                                                > SEC Registration with Artices (for
                                                Corporation/Partnership
                                            </p>
                                            <p>
                                                <input
                                                        type="checkbox"
                                                        id="AT_TITLE_TO_PROPERTY"
                                                        name="AT_TITLE_TO_PROPERTY"
                                                        class="flat"
                                                        value="Pass"
                                                > Title to property of Tax Declaration (if owned)
                                            </p>
                                            <p>
                                                <input
                                                        type="checkbox"
                                                        id="AT_CONTRACT_OF_LEASE"
                                                        name="AT_CONTRACT_OF_LEASE"
                                                        class="flat"
                                                        value="Pass"
                                                > Contract of Lease and Lessor's Business Permit (if
                                                rented)
                                            </p>
                                            <p>
                                                <input
                                                        type="checkbox"
                                                        id="AT_AUTHORIZATION"
                                                        name="AT_AUTHORIZATION"
                                                        class="flat"
                                                        value="Pass"
                                                > Authorization Letter & ID (Owner and representative(if
                                                any))
                                            </p>
                                            <p>
                                                <input
                                                        type="checkbox"
                                                        id="AT_MISC_DOCUMENTS"
                                                        name="AT_MISC_DOCUMENTS"
                                                        class="flat"
                                                        value="Pass"
                                                > Other Documents (See Business Natures)
                                            </p>
                                        </ul>
                                    </div>
                                    <hr>
                                    <div class="col-md-9">
											<textarea
                                                    class="form-control"
                                                    placeholder="Remarks"
                                                    id="AP_Remarks"
                                                    name="AP_Remarks"
                                                    rows="3"
                                            ></textarea>
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
                                id="btnNewAppl"
                                class="btn btn-success"
                        >Save
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Renewal modal -->
    <div
            class="modal fade evaluation-modal-renew"
            tabindex="-1"
            role="dialog"
            aria-hidden="true"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                    >
                        <span aria-hidden="true">x</span>
                    </button>
                    <h4
                            class="modal-title"
                            id="myModalLabel2"
                    >Check Requirements for Renewal Application</h4>
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
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > Original Copy of Previous Business Permit, if not
                                        applicable Certified xerox copy
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > Xerox copy of Tax Bill and Official Receipt (current)
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > Original Copy of Barangay Clearance (for renewal purpose)
                                    </p>
                                </li>
                                <p>Other Document Requirements required such as:</p>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > Locational Clearance (LC)
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > Fire Safety Inspection Certificate (FSIC)
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > Sanitary Permit (SP)
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > CTAO Certificate
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > Certificate of Electrical Inspection (CEI)
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > Lessor's Business Permit (if rented)
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <input
                                                type="checkbox"
                                                class="flat"
                                                value="Pass"
                                        > PCAB License
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button
                            type="button"
                            class="btn btn-default"
                            data-dismiss="modal"
                    >Close
                    </button>
                    <button
                            type="submit"
                            class="btn btn-primary"
                    >Rectify
                    </button>
                    <button
                            type="submit"
                            class="btn btn-success"
                    >Approve
                    </button>
                </div>
                <!-- end panel -->

            </div>
        </div>
    </div>
    <jsp:include page="PAEISSAFooter.jsp"></jsp:include>
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
<script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script type="text/javascript">
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();
    });
</script>
</body>
<%}catch (Exception e){
    e.printStackTrace();
}%>
</html>
