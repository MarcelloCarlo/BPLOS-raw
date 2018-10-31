<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/15/2018
  Time: 9:20 PM
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
    <title>BPLS | Assessment</title>
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
<% LGUConnect conX = new LGUConnect();
    try {
        Connection conn3 = conX.getConnection();
        Statement ss3 = conn3.createStatement();
        ResultSet gg3 = ss3.executeQuery("SELECT * FROM view_applicationformsas");
        Statement ss2 = conn3.createStatement();
        ResultSet rs3 = ss2.executeQuery("SELECT * FROM bpls_t_employee_profile");
        Statement ss5 = conn3.createStatement();
        ResultSet rs5 = ss5.executeQuery("SELECT * FROM bpls_t_employee_profile");
        Statement ss6 = conn3.createStatement();
        ResultSet rs6 = ss6.executeQuery("SELECT * FROM bpls_t_employee_profile");
        Statement ss7 = conn3.createStatement();
        ResultSet rs7 = ss7.executeQuery("SELECT * FROM bpls_t_employee_profile");
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
<jsp:include page="BPLSEComponent.jsp"/>
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
                <li><a href="javascript:;">Assessment</a></li>
                <li class="active">Application Assessment Processing</li>
            </ol>
            <!-- begin page-header -->
            <h1 class="page-header">Application Assessment Processing</h1>
            <!-- end page-header -->
            <div class="row">
                <div class="col-md-12">
                    <!-- begin panel -->
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Application Assessment Table</h4>
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
                                    <th>Ownership Type</th>
                                    <th>Application Type</th>
                                    <th>Status</th>
                                    <th>Date Received</th>
                                    <th>Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    while (gg3.next()) {
                                        String apType = gg3.getString("AP_TYPE");
                                        String _classif = gg3.getString("BN_CLASSIFICATION");
                                        String classif = "";
                                        String modalMode = "";
                                        String modalClass = "";
                                        String btnTitle = "";
                                        String btnIcon = "";
                                        if (apType.equals("New") && !gg3.getString("AP_STATUS").equals("Assess")) {
                                            modalMode = ".evaluation-modal-new";
                                            modalClass = "newModal";
                                            btnTitle = "title='Evaluate New Application'";
                                            btnIcon = "<i class='fa fa-lg fa-pencil'></i>";
                                        } else if (apType.equals("Renew") && !gg3.getString("AP_STATUS").equals("Assess")) {
                                            modalMode = ".evaluation-modal-renew";
                                            modalClass = "renewModal";
                                            btnTitle = "title='Evaluate Renew Application'";
                                            btnIcon = "<i class='fa fa-lg fa-pencil'></i>";
                                        } else if (gg3.getString("AP_STATUS").equals("Assess")) {
                                            modalMode = ".evaluation-modal-assess";
                                            modalClass = "assessModal";
                                            btnTitle = "title='Assess the Application'";
                                            btnIcon = "<i class='fa fa-lg fa-check-square-o'></i>";
                                        } else {
                                            modalClass = "red";
                                            modalMode = "";

                                        }
                                        if (_classif.equals("L")) {
                                            classif = "Large Scale";
                                        } else if (_classif.equals("S")) {
                                            classif = "Small Scale";
                                        } else {
                                            classif = "x";
                                        }
                                %>
                                <tr>
                                    <td><%=gg3.getString("BU_NAME")%>
                                    </td><!--0-->
                                    <td><%=gg3.getString("BN_NAME")%> (<%=classif%>)
                                    </td><!--1-->
                                    <td><%=gg3.getString("OT_NAME")%>
                                    </td><!--2-->
                                    <td><%=apType%>
                                    </td><!--3-->
                                    <td><%=gg3.getString("AP_STATUS")%>
                                    </td>
                                    <td><%=gg3.getString("AP_DATE")%>
                                    </td><!--5-->
                                    <td class="hide"><%=gg3.getString("BU_PRESIDENT")%>
                                    </td><!--7-->
                                    <td class="hide"><%=gg3.getString("TAX_PAYERNAME")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BU_LOCATION")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BU_CONTACT")%>
                                    </td><!--10--->
                                    <td class="hide"><%=gg3.getString("AUTH_REPNAME")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AR_HOME_ADDRESS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BN_NAME")%>
                                    </td>
                                    <td id="AP_REFERENCE_NO" class="hide"><%=gg3.getString("AP_REFERENCE_NO")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("OT_CODE")%>
                                    </td><!--15-->
                                    <td id="BN_CLASSIFICATION" class="hide"><%=gg3.getString("BN_CLASSIFICATION")%>
                                    </td>
                                    <td
                                            class="hide"
                                            id="AP_ID"
                                            name="AP_ID"
                                    ><%=gg3.getString("AP_ID")%>
                                    </td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-success <%=modalClass%> "
                                                data-toggle="modal"
                                                data-target="<%=modalMode%>" <%=btnTitle%>
                                        ><%=btnIcon%>
                                        </button>
                                    </td>

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
            class="modal fade evaluation-modal-assess"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="assessNewApplForm"
                    class="form-horizontal"
                    name="assessNewApplForm"
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
                                           id="_AAP_REFERENCE_NO"
                                           name="_AP_REFERENCE_NO"
                                    />
                                    <div class="col-md-12 panel-body">
                                        <h5>
                                            Business Name/Corporate Name:
                                            <!-- <input disabled=""
                                            id="nBussName" type="text" /> -->
                                            <label id="aBussName"></label>
                                        </h5>
                                        <h5>
                                            Name of Sole Proprietor/Partnership/President:
                                            <!-- <input
                                            disabled="" id="nBussOwner" type="text" /> -->
                                            <label id="aBussOwner"></label>
                                        </h5>
                                        <h5>
                                            Business Address:
                                            <!-- <input disabled="" id="nBussAddr"
                                            type="text" /> -->
                                            <label id="aBussAddr"></label>
                                        </h5>
                                        <h5>
                                            Tel No.:
                                            <!--  <input disabled="" id="nBussConTelno" type="text" /> -->
                                            <label id="aBussConTelno"></label>
                                        </h5>
                                        <h5>
                                            Authorized Representative:
                                            <!--  <input disabled="
                                            id="nBussAuthRepName" type="text" /> -->
                                            <label id="aBussAuthRepName"></label>
                                        </h5>
                                        <h5>
                                            Address:
                                            <!-- <input disabled="" id="nBussAuthRepAddr" type="text" /> -->
                                            <label id="aBussAuthRepAddr"></label>
                                        </h5>
                                        <h5>
                                            Business Nature:
                                            <!-- <input disabled="" id="nBussAuthRepAddr" type="text" /> -->
                                            <label id="aBussNature"></label>
                                        </h5>
                                    </div>
                                    <div class="col-md-6 panel-body">
                                        <h5>Payment Checklist</h5>
                                        <div class="">
                                            <ul class="to_do">
                                                <p>
                                                    <input type="checkbox"
                                                           id="chkMayorsPerm"
                                                           name="Mayors_Perm"
                                                           class="flat"
                                                           value="1"> Mayor's Permit
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkCity_Tax"
                                                            name="City_Tax"
                                                            class="flat"
                                                            value="2"
                                                    > City Tax
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkGarbage_Fee"
                                                            name="Garbage_Fee"
                                                            class="flat"
                                                            value="3"
                                                    > Garbage Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkSanitary_Fee"
                                                            name="Sanitary_Fee"
                                                            class="flat"
                                                            value="4"
                                                    > Sanitary Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkBLDG_Fee"
                                                            name="BLDG_Fee"
                                                            class="flat"
                                                            value="5"
                                                    > Building Inspection Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkELECI_Fee"
                                                            name="ELECI_Fee"
                                                            class="flat"
                                                            value="6"
                                                    > Electrical Inspection Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkPLUMI_Fee"
                                                            name="PLUMI_Fee"
                                                            class="flat"
                                                            value="7"
                                                    > Plumbing Inspection Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkSIGBRD_Fee"
                                                            name="SIGNBRD_Fee"
                                                            class="flat"
                                                            value="8"
                                                    > Signboard
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkFS_Fee"
                                                            name="FS_Fee"
                                                            class="flat"
                                                            value="9"
                                                    > Fire Inspection Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkNRPS_Fee"
                                                            name="NRPS_Fee"
                                                            class="flat"
                                                            value="10"
                                                    > New Registered Plate Sticker
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkZoning_Fee"
                                                            name="Zoning_Fee"
                                                            class="flat"
                                                            value="11"
                                                    > Zoning Fee
                                                </p>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-6 panel-body">
                                        <h5>&nbsp</h5>
                                        <div class="">
                                            <ul class="to_do">
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkPENI_Fee"
                                                            name="PENI_Fee"
                                                            class="flat"
                                                            value="12"
                                                    > Penalty Interest
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkTourism_Fee"
                                                            name="Tourism_Fee"
                                                            class="flat"
                                                            value="13"
                                                    > Tourism
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkQCBRD_Fee"
                                                            name="QCBRD_Fee"
                                                            class="flat"
                                                            value="14"
                                                    > QCBRD
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkADJ_Fee"
                                                            name="ADJ_Fee"
                                                            class="flat"
                                                            value="15"
                                                    > Adjustments
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkDISC_Fee"
                                                            name="DISC_Fee"
                                                            class="flat"
                                                            value="16"
                                                    > Discount
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkPENDEL_Fee"
                                                            name="PENDEL_Fee"
                                                            class="flat"
                                                            value="17"
                                                    > Penalty for Delinquency
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkADJTOUR_Fee"
                                                            name="ADJTOUR_Fee"
                                                            class="flat"
                                                            value="18"
                                                    > Adjustment for Tourism
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkSPECPER_Fee"
                                                            name="SPECPER_Fee"
                                                            class="flat"
                                                            value="19"
                                                    > Special Permit
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkADD_Fee"
                                                            name="ADD_Fee"
                                                            class="flat"
                                                            value="20"
                                                    > Additional Fee
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkCTC_Fee"
                                                            name="CTC_Fee"
                                                            class="flat"
                                                            value="21"
                                                    > CTC
                                                </p>
                                            </ul>
                                        </div>

                                    </div>
                                    <hr>
                                    <div class="col-md-12 panel-body hidden">
                                        <ul class="to_do">
                                            <p>
                                                <label>Assessed By</label>
                                                <select class="selectpicker form-control" data-style="btn-white"
                                                        id="aId" name="aId" tabindex="-1" value='<%out.print(session.getAttribute("empid"));%>'>

                                                    <%while (rs3.next()) {%>
                                                    <option data-subtext="<%=rs3.getString("EP_JOB_DESC")%>"
                                                            title="<%=rs3.getString("EP_JOB_DESC")%>"
                                                            value="<%=rs3.getInt("EP_ID")%>">
                                                            <%out.print(rs3.getString("EP_FNAME") + " " + rs3.getString("EP_MNAME")+ " " + rs3.getString("EP_LNAME"));%>
                                                            <%} rs3.close();ss2.close();%>
                                                </select>
                                            </p>
                                           <%-- <p>
                                                <label>Verified By</label>
                                                <select class="selectpicker form-control" data-style="btn-white"
                                                        id="verId" name="verId" tabindex="-1" required>

                                                    <%while (rs5.next()) {%>
                                                    <option data-subtext="<%=rs5.getString("EP_JOB_DESC")%>"
                                                            title="<%=rs5.getString("EP_JOB_DESC")%>"
                                                            value="<%=rs5.getInt("EP_ID")%>">
                                                            <%out.print(rs5.getString("EP_FNAME") + " " + rs5.getString("EP_MNAME")+ " " + rs5.getString("EP_LNAME"));%>
                                                            <%} rs5.close();ss5.close();%>
                                                </select>
                                            </p>
                                            <p>
                                                <label>Recommending Approval By</label>
                                                <select class="selectpicker form-control" data-style="btn-white"
                                                        id="recId" name="recId" tabindex="-1" required>

                                                    <%while (rs6.next()) {%>
                                                    <option data-subtext="<%=rs6.getString("EP_JOB_DESC")%>"
                                                            title="<%=rs6.getString("EP_JOB_DESC")%>"
                                                            value="<%=rs6.getInt("EP_ID")%>">
                                                            <%out.print(rs6.getString("EP_FNAME") + " " + rs6.getString("EP_MNAME")+ " " + rs6.getString("EP_LNAME"));%>
                                                            <%}rs6.close();ss6.close();%>
                                                </select>
                                            </p>
                                            <p>
                                                <label>Approved By</label>
                                                <select class="selectpicker form-control" data-style="btn-white"
                                                        id="aprId" name="aprId" tabindex="-1" required>

                                                    <%while (rs7.next()) {%>
                                                    <option data-subtext="<%=rs7.getString("EP_JOB_DESC")%>"
                                                            title="<%=rs7.getString("EP_JOB_DESC")%>"
                                                            value="<%=rs7.getInt("EP_ID")%>">
                                                            <%out.print(rs7.getString("EP_FNAME") + " " + rs7.getString("EP_MNAME")+ " " + rs7.getString("EP_LNAME"));%>
                                                            <%}rs7.close();ss7.close();%>
                                                </select>
                                            </p>--%>
                                        </ul>
                                    </div>
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
                                    type="button"
                                    id="btnAssNewAppl"
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

<jsp:include page="BPLSEFooter.jsp"></jsp:include>
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
<script src="assets/js/divAssessment.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

</body>
<% } catch (SQLException | ClassNotFoundException e) {
    out.print(e);
}%>
</html>
