<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/18/2018
  Time: 2:37 PM
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
    <title>MTOPS | Franchise Assessment</title>
    <!-- ================== BEGIN BASE CSS STYLE ================== -->
 
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
    if (session.getAttribute("empid") == null || session.getAttribute("empname") == null) {
        response.sendRedirect("PAEISPortal.jsp");
    }
    LGUConnect conX = new LGUConnect();
    try {
        Connection conn3 = conX.getConnection();
        Statement ss3 = conn3.createStatement();
        ResultSet gg3 = ss3.executeQuery("SELECT * FROM mtops_t_application_frm APL JOIN mtops_r_toda TODA ON APL.TODA = TODA.TODA_ID WHERE APF_STATUS = 'Assessing'");

%>
<body>
<!-- begin #page-loader -->
<div
        id="page-loader"
        class="fade in"
>
    <span class="spinner"></span>
</div>
<!-- end #page-loader -->
<jsp:include page="MTOPSAmentComponent.jsp"/>
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
                <li><a href="javascript:;">Franchise Assessment</a></li>
                <li class="active">Franchise Assessment Processing</li>
            </ol>
            <!-- begin page-header -->
            <h1 class="page-header">Franchise Assessment Processing</h1>
            <!-- end page-header -->
            <div class="row">
                <div class="col-md-12">
                    <!-- begin panel -->
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Franchising Assessment Table</h4>
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
                                    <th class="hide">Action</th>

                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    while (gg3.next()) {
                                %>
                                <tr>
                                    <td><%=gg3.getString("APF_FNAME") +' '+gg3.getString("APF_MNAME") +' '+gg3.getString("APF_LNAME")%>
                                    </td>
                                    <td><%=gg3.getString("TODA_NAME")%></td>
                                    <td><%=gg3.getString("APF_STATUS")%></td>
                                    <td><%=gg3.getString("APF_DATEACCESSED")%></td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-success mtopsModal"
                                                data-toggle="modal"
                                                data-target=".assess-modal-mtops" title="Comply the Inspected Business"
                                        ><i class="fa fa-lg fa-list-ul"></i>
                                        </button>
                                    </td>
                                    <td class="hidden"><%=gg3.getString("APF_ID")%></td>
                                </tr>
                                <%
                                    }
                                    gg3.close();
                                    ss3.close();
                                %>
                                </tbody>
                            </table>
                            <%--<table class="table" id="feetable">
                                <thead>
                                <tr>
                                    <th>Fee Name</th>
                                    <th>Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%while(rs4.next()){
                                %>
                                <tr>
                                    <td><%=rs4.getString("FL_NAME")%></td>
                                    <td><%=rs4.getString("FL_AMOUNT")%></td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>--%>

                        </div>
                    </div>
                    <!-- end panel -->
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->

    <!-- Assess Modal -->
    <div
            class="modal fade assess-modal-mtops"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="assessMtopsApplForm"
                    class="form-horizontal"
                    name="assessMtopsApplForm"
                    enctype="multipart/form-data"
            >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="panel panel-inverse panel-danger">
                            <div class="panel-heading">
                                <h4 class="panel-title">Assessment for Application</h4>
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
                                    <div class="col-md-12 panel-body">
                                        <h5>Payment Checklist</h5>
                                        <div class="">
                                            <ul class="to_do">
                                                <p>
                                                    <input type="checkbox"
                                                           id="MFF"
                                                           name="MFF"
                                                           class="flat"
                                                           value="1" required> MTOP Filing Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="IF"
                                                            name="IF"
                                                            class="flat"
                                                            value="2" required
                                                    > Inspection Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="PF"
                                                            name="PF"
                                                            class="flat"
                                                            value="3" required
                                                    > Permit Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="FE"
                                                            name="FE"
                                                            class="flat"
                                                            value="4"
                                                    > Franchise Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="FAE"
                                                            name="FAE"
                                                            class="flat"
                                                            value="5"
                                                    > Fare Adjustment Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="RF"
                                                            name="RF"
                                                            class="flat"
                                                            value="6"
                                                    > Regulatory Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="PPF"
                                                            name="PPF"
                                                            class="flat"
                                                            value="7"
                                                    > Provisional Permit Fee
                                                </p>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                    id="closeNewPanelWindow"
                                    type="button"
                                    class="btn btn-default"
                                    data-dismiss="modal"
                            >Close
                            </button>
                            <button
                                    type="button"
                                    id="btnAssMtopsAppl"
                                    class="btn btn-success"
                            >Assess
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="MTOPSAmentFooter.jsp"></jsp:include>
<!-- ================== BEGIN BASE JS ================== -->
<script src="assets/plugins/js/jquery.min.js"></script>
<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/plugins/select2/dist/js/select2.min.js"></script>
<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
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
<script src="assets/js/divMtopsAssessment.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

</body>
<% } catch (SQLException | ClassNotFoundException e) {
    out.print(e);
}%>
</html>
