<%@ page
        language="java"
        contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"
%>
<%@ page import="java.sql.*" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
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
    <title>PAEIS | Evaluation</title>
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
<body>
<!-- begin #page-loader -->
<div
        id="page-loader"
        class="fade in"
>
    <span class="spinner"></span>
</div>
<!-- end #page-loader -->
<jsp:include page="DivEComponent.jsp"/>
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
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                    <th class="hide">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    LGUConnect conX = new LGUConnect();
                                    try{
                                    Connection conn3 = conX.getConnection();
                                    Statement ss3 = conn3.createStatement();
                                    ResultSet gg3 = ss3.executeQuery("SELECT * FROM `view_applicationformsev`");
                                    while (gg3.next()) {
                                        String apType = gg3.getString("AP_TYPE");
                                        String modalMode = "";
                                        String modalClass = "";
                                        String assess = "";
                                        String refno = "";
                                        if (gg3.getString("BN_CLASSIFICATION").equals("L")) {
                                            if (gg3.getString("AP_STATUS").equals("Assess") && (gg3.getString("AP_DIV_CODE_FROM").equals("DIV-INV") || gg3.getString("AP_DIV_CODE_FROM").equals("DIV-INS"))) {
                                                refno = "location.href='BPLSBPLSAssessment.jsp?refNo=" + gg3.getString("AP_REFERENCE_NO") +"'";
                                                assess = "";
                                            } else {
                                                assess = "disabled";
                                            }
                                        } else if (gg3.getString("BN_CLASSIFICATION").equals("S")) {
                                            if (gg3.getString("AP_STATUS").equals("Assess")) {
                                                refno = "location.href='BPLSBPLSAssessment.jsp?refNo=" + gg3.getString("AP_REFERENCE_NO") +"'";
                                                assess = "";
                                            } else {
                                                assess = "disabled";
                                            }
                                        } else {
                                            assess = "disabled";
                                        }
                                        if (apType.equals("New")) {
                                            modalMode = ".evaluation-modal-new";
                                            modalClass = "newModal";
                                        } else if (apType.equals("Renew")) {
                                            modalMode = ".evaluation-modal-renew";
                                            modalClass = "renewModal";
                                        } else {
                                            modalMode = ".evaluation-modal-new";
                                        }
                                %>
                                <tr>
                                    <td><%=gg3.getString("BU_NAME")%>
                                    </td><!--0-->
                                    <td><%=gg3.getString("BN_NAME")%>
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
                                    </td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-success <%=modalClass%>"
                                                data-toggle="modal"
                                                data-target="<%=modalMode%>"
                                        >Evaluate
                                        </button>
                                        <button
                                                type="button"
                                                class="btn btn-success <%=assess%>"
                                                data-toggle="modal"
                                                id="assess"
                                                onclick="<%=refno%>"
                                        >Assess
                                        </button>
                                    </td><!--7-->
                                    <td class="hide"><%=gg3.getString("TAX_PAYERNAME")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BU_LOCATION")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BU_CONTACT")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AUTH_REPNAME")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AR_HOME_ADDRESS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_UNIFIED_FILE_NAME")%>
                                    </td>
                                    <td
                                            class="hide"
                                            id="AT_ID"
                                            name="AT_ID"
                                    ><%=gg3.getString("AT_ID")%>
                                    </td>
                                    <!-- 14 -->
                                    <td
                                            class="hide"
                                            id="AP_ID"
                                            name="AP_ID"
                                    ><%=gg3.getString("AP_ID")%>
                                    </td>
                                    <!-- 15 -->
                                    <td class="hide"><%=String.valueOf(gg3.getString("AT_BRGY_CLEARANCE"))%>
                                    </td><!-- 16 -->
                                    <td class="hide"><%=gg3.getString("AT_DTI_REGISTRATION")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_SEC_REGISTRATION")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_TITLE_TO_PROPERTY")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_TAX_DECLARATION")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_CONTRACT_OF_LEASE")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_LESSORS_BP")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_AUTHORIZATION")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_LOCATIONAL_CLR")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_SANITARY_HEALTH_CERT")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_BUILDING_PERMIT")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_POLLUTION_CLR")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_MECHANICAL_PERMIT")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_ELECTRICAL_INSP")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_POLICE_CLEARANCE")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_CTAO_CLEARANCE_CERT")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_FSIC")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_PREV_BP")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_TAX_BILL")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_OFFICIAL_RECEIPT")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_PCAB_LICENSE")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AT_MISC_DOCUMENTS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AP_Remarks")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BN_NAME")%>
                                    </td>
                                    <td id="AP_REFERENCE_NO" class="hide"><%=gg3.getString("AP_REFERENCE_NO")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("OT_CODE")%>
                                    </td>
                                    <td id="BN_CLASSIFICATION" class="hide"><%=gg3.getString("BN_CLASSIFICATION")%>
                                    </td>
                                </tr>
                                <%
                                    }}catch(SQLException | ClassNotFoundException e){
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
            class="modal fade evaluation-modal-new"
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
                                       id="_AT_ID"
                                       name="_AT_ID"
                                /> <input type="text"
                                          class="hide"
                                          id="_AP_ID"
                                          name="_AP_ID"
                            /><input type="text"
                                     class="hide"
                                     id="_AP_REFERENCE_NO"
                                     name="_AP_REFERENCE_NO"
                            /><input type="text"
                                     class="hide"
                                     id="_BN_CLASSIFICATION"
                                     name="_BN_CLASSIFICATION"
                            />
                                <div class="col-md-6 panel-body">
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
                                <div class="col-md-12">
                                        <hr>
                                        <label id="AT_UNIFIED_FILE_NAME"></label><br>
                                        <button
                                                type="button"
                                                class="btn btn-primary form-control"
                                                id="fileDownload"
                                        >DOWNLOAD ATTACHMENT
                                        </button>
                                </div>
                                <div class="panel-body">
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
                                            <p id="dtiID">
                                                <input
                                                        type="checkbox"
                                                        id="AT_DTI_REGISTRATION"
                                                        name="AT_DTI_REGISTRATION"
                                                        class="flat"
                                                        value="Pass"
                                                > DTI Registration (for Single Proprietorship
                                            </p>
                                            <p id="secID">
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

                                </div>
                                <hr>
                                <div class="panel-body">
                                    <div class="note note-info">
                                        <h4>Evaluation Notes</h4>
                                        <ul>
                                            <li>
                                                <p>
                                                    Other Requirements based on the business nature should be in the
                                                    document. LEAVE UNCHECK THE "OTHER DOCUMENTS" IF ANY OTHER
                                                    REQUIREMENTS ON THE ATTACHMENT IS INVALID OR INCOMPLETE.
                                                </p>
                                            </li>
                                            <li><p>
                                                Incomplete/Invalid documents on general and other requirements will
                                                redirect you to termination form of the application.
                                            </p></li>
                                        </ul>
                                    </div>
                                    <!--  <div class="col-md-9">
                                              <textarea
                                                      class="form-control"
                                                      placeholder="Remarks"
                                                      id="AP_Remarks"
                                                      name="AP_Remarks"
                                                      rows="3"
                                              ></textarea>
                                      </div>-->
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
                        >Evaluate
                        </button>
                    </div>
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
                            class="btn btn-success"
                    >Save changes
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Termination modal -->
    <div
            class="modal modal-message fade evaluation-modal-terminate"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="terminateApplForm"
                    class="form-horizontal"
                    name="terminateApplForm"
                    enctype="multipart/form-data"
            >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="panel-heading-btn">
                            <button
                                    type="button"
                                    id="closeTermPanelWindow"
                                    class="btn btn-xs btn-icon btn-circle btn-danger right"
                                    data-dismiss="modal"
                            >
                                <i class="fa fa-times"></i>
                            </button>
                        </div>
                        <h4
                                class="modal-title"
                        >Application Termination</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="col-md-8">
                                    <h5>
                                        Application/Referrence Number:
                                        <input class="hide" name="tRefNoh"
                                        id="tRefNoh" type="text" />
                                        <label id="tRefNo"></label>
                                    </h5>
                                    <h5>
                                        Business Name:
                                        <!-- <input
                                        disabled="" id="nBussOwner" type="text" /> -->
                                        <label id="tBussName"></label>
                                    </h5>
                                    <h5>
                                        Business Nature:
                                        <!-- <input disabled="" id="nBussAddr"
                                        type="text" /> -->
                                        <label id="tBussNature"></label>
                                    </h5>
                                    <h5>
                                        Authorized Representative:
                                        <!--  <input disabled=""
                                        id="nBussAuthRepName" type="text" /> -->
                                        <label id="tBussAuthRepName"></label>
                                    </h5>
                                    <h5>
                                        Business Owner:
                                        <!-- <input disabled="" id="nBussAuthRepAddr" type="text" /> -->
                                        <label id="tBussOwner"></label>
                                    </h5>
                                </div>
                                <div class="panel-body">
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
                                id="btnCloseTermApplModal"
                        >Close
                        </button>
                        <button
                                type="button"
                                id="btnTermAppl"
                                class="btn btn-success"
                        >Submit
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="BPLSEFooter.jsp"></jsp:include>
</div>
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
<script src="assets/js/divEvaluation.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

</body>
</html>
