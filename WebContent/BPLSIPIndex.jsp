<%--
  Created by IntelliJ IDEA.
  User: jcgutierrez0102
  Date: 9/30/18
  Time: 10:18 PM
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
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
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
    <title>BPLS | Inspection</title>
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
    <!-- clippy -->
    <!-- <link href="assets/plugins/smore-inc-clippy.js/build/clippy.css"
        rel="stylesheet"> -->
</head>
<%
    LGUConnect conX = new LGUConnect();
    String treId = String.valueOf(session.getAttribute("empid"));
    try {
        Connection conn3 = conX.getConnection();
        Statement ss3 = conn3.createStatement();
        ResultSet gg3 = ss3.executeQuery("select `ap`.`AP_REFERENCE_NO` AS `AP_REFERENCE_NO`,`bus`.`BU_NAME` AS `BU_NAME`,`bus`.`BU_PRESIDENT` AS `BU_PRESIDENT`,concat(`tp`.`TP_FNAME`,' ',coalesce(`tp`.`TP_MNAME`,' '),' ',coalesce(`tp`.`TP_LNAME`,' ')) AS `TAX_PAYERNAME`,`bus`.`BU_LOCATION` AS `BU_LOCATION`,`bus`.`BU_CONTACT` AS `BU_CONTACT`,concat(`ar`.`AR_FNAME`,' ',coalesce(`ar`.`AR_MNAME`,' '),' ',coalesce(`ar`.`AR_LNAME`,' ')) AS `AUTH_REPNAME`,`ar`.`AR_HOME_ADDRESS` AS `AR_HOME_ADDRESS`,`bn`.`BN_NAME` AS `BN_NAME`,`bn`.`BN_CLASSIFICATION` AS `BN_CLASSIFICATION`,`ot`.`OT_NAME` AS `OT_NAME`,`ot`.`OT_CODE` AS `OT_CODE`,`ap`.`AP_TYPE` AS `AP_TYPE`,`ap`.`AP_DATE` AS `AP_DATE`,`ap`.`AP_ID` AS `AP_ID`,`ap`.`AP_STATUS` AS `AP_STATUS`,`ap`.`AP_DIV_CODE_TO` AS `AP_DIV_CODE_TO`,`ap`.`AP_DIV_CODE_FROM` AS `AP_DIV_CODE_FROM` from (((((((`bpls_t_business` `bus` join `bpls_r_business_nature` `bn` on((`bn`.`BN_ID` = `bus`.`BN_ID`))) join `bpls_r_ownership_type` `ot` on((`ot`.`OT_CODE` = `bus`.`OT_CODE`))) join `bpls_t_bp_application` `ap` on((`ap`.`BU_ID` = `bus`.`BU_ID`))) join `bpls_t_taxpayer` `tp` on((`tp`.`TP_ID` = `bus`.`TP_ID`))) join `bpls_r_bu_ar` `buxar` on((`buxar`.`BU_ID` = `bus`.`BU_ID`))) join `bpls_t_authorize_rep` `ar` on((`ar`.`AR_ID` = `buxar`.`AR_ID`))) join `bpls_r_division` `divs` on((`divs`.`DIV_CODE` = `ap`.`AP_DIV_CODE_TO`))) where ( ((`ap`.`AP_DIV_CODE_TO` = 'DIV-INS') OR (`ap`.`AP_DIV_CODE_TO` = 'DIV-EV')) and (`ap`.`AP_STATUS` <> 'Terminated'))");
        Statement ss4 = conn3.createStatement();
        ResultSet gg4 = ss4.executeQuery("SELECT * FROM bpls_t_employee_profile");
        Statement ss5 = conn3.createStatement();
        ResultSet gg5 = ss5.executeQuery("SELECT * FROM bpls_t_employee_profile");
        Statement ss6 = conn3.createStatement();
        ResultSet gg6 = ss6.executeQuery("SELECT * FROM bpls_t_employee_profile");
        Statement ss7 = conn3.createStatement();
        ResultSet gg7 = ss7.executeQuery("SELECT * FROM bpls_t_bp_application BP JOIN bpls_t_business business on BP.BU_ID = business.BU_ID WHERE (AP_DIV_CODE_TO = 'DIV-INS' OR AP_DIV_CODE_TO = 'DIV-EV') AND AP_STATUS <> 'Terminated'");

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
<jsp:include page="BPLSIPComponent.jsp"/>
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
                <li><a href="javascript:;">Inspection</a></li>
                <li class="active">Application Inspection</li>
            </ol>
            <!-- begin page-header -->
            <h1 class="page-header">Application Inspection</h1>
            <!-- end page-header -->
            <div class="row">
                <div class="col-md-12">
                    <!-- begin panel -->
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Inspection Table</h4>
                        </div>
                        <div class="panel-body"><button
                                type="button"
                                class="btn btn-success .missionOrder"
                                data-toggle="modal" data-target=".inspection-modal-missionOr"
                                title="Release a Mission Order"
                        ><i class="fa fa-lg fa-rocket"></i>
                        </button></div>
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
                                    <th>President/Representative</th>
                                    <th>Action</th>
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
                                        String _PreRep = String.valueOf(gg3.getString("BU_PRESIDENT"));
                                        String PreRep = "";
                                        String modalMode = "";
                                        String modalClass = "";
                                        if (apType.equals("New")) {
                                            modalMode = ".inspection-modal-new";
                                            modalClass = "newModal";
                                        } else if (apType.equals("Renew")) {
                                            modalMode = ".inspection-modal-renew";
                                            modalClass = "renewModal";
                                        } else {
                                            modalMode = ".inspection-modal-new";
                                        }
                                        if (_PreRep.equalsIgnoreCase("null")) {
                                            PreRep = gg3.getString("TAX_PAYERNAME");
                                        } else {
                                            PreRep = _PreRep;
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
                                    <td><%=PreRep%>
                                    </td><!--6-->
                                    <td class="hide"><%=gg3.getString("TAX_PAYERNAME")%>
                                    </td><!--7-->
                                    <td class="hide"><%=gg3.getString("BU_LOCATION")%>
                                    </td><!--8-->
                                    <td class="hide"><%=gg3.getString("BU_CONTACT")%>
                                    </td><!--9-->
                                    <td class="hide"><%=gg3.getString("AUTH_REPNAME")%>
                                    </td><!--10-->
                                    <td class="hide"><%=gg3.getString("AR_HOME_ADDRESS")%>
                                    </td><!--11-->
                                    <td class="hide"><%=gg3.getString("BN_NAME")%>
                                    </td><!--12-->
                                    <td id="AP_REFERENCE_NO" class="hide"><%=gg3.getString("AP_REFERENCE_NO")%>
                                    </td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-success newModal"
                                                data-toggle="modal"
                                                data-target=".inspection-modal-new" title="Comply the Inspected Business"
                                        ><i class="fa fa-lg fa-list-ul"></i>
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                    gg3.close();
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
            class="modal fade inspection-modal-new"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="newInsApplForm"
                    class="form-horizontal"
                    name="newInsApplForm"
                    enctype="multipart/form-data"
            >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="panel panel-inverse panel-danger">
                            <div class="panel-heading">
                                <h4
                                        class="panel-title"
                                        id="myModalLabel"
                                >Inspection for New Application</h4>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="hidden"
                                           class="hide"
                                           id="empID"
                                           name="empID" value='<%=session.getAttribute("empid")%>'
                                    />
                                    <input type="text"
                                           class="hide"
                                           id="_AP_REFERENCE_NO"
                                           name="_AP_REFERENCE_NO"
                                    />
                                    <div class="col-md-8 panel-body">
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
                                    <div class="panel-body">
                                        <h5>Inspection Checklist</h5>
                                        <div class="">
                                            <ul class="to_do">
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkZONING_INS"
                                                            name="ZONING_INS"
                                                            class="flat"
                                                            value="Pass"
                                                    > Zoning Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkFIRE_INS"
                                                            name="FIRE_INS"
                                                            class="flat"
                                                            value="Pass"
                                                    > Fire Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkHS_INS"
                                                            name="HS_INS"
                                                            class="flat"
                                                            value="Pass"
                                                    > Health & Sanitation Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkBLDG_INS"
                                                            name="BLDG_INS"
                                                            class="flat"
                                                            value="Pass"
                                                    > Building Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkLABOR_INS"
                                                            name="LABOR_INS"
                                                            class="flat"
                                                            value="Pass"
                                                    > Labor Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkMISC_INS"
                                                            name="MISC_INS"
                                                            class="flat"
                                                            value="Pass"
                                                    > Miscellaneous Inspection (See Business Nature)
                                                </p>
                                            </ul>
                                        </div>
                                    </div><div class="panel-body">
                                    <hr>
                                    <div class="col-md-12">
                                        <label for="busType">Business Type</label>
											<select id="busType" class="selectpicker form-control" data-style="btn-white" tabindex="-1" name="busType">
                                                <option selected>Select Business Type...</option>
                                                <option value="L">Large Scale</option>
                                                <option value="S">Small Scale</option>
                                            </select>
                                    </div>
                                </div>
                                    <div class="panel-body">
                                        <hr>
                                        <div class="col-md-12">
											<textarea
                                                    class="form-control"
                                                    placeholder="Remarks"
                                                    id="txtMISC_REMARKS"
                                                    name="MISC_REMARKS"
                                                    rows="3"
                                            ></textarea>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="note note-info">
                                            <h4>Inspection Notes</h4>
                                            <ul>
                                                <li>
                                                    <p>
                                                        Miscellaneous Inspection based on the business nature should be
                                                        in the
                                                        business. LEAVE UNCHECK THE "MISCELLANOUS INSPECTION" IF ANY
                                                        OTHER
                                                        REQUIREMENTS ON THE BUSINESS IS VIOLATED/MISSING/INVALID.
                                                    </p>
                                                </li>
                                                <li><p>
                                                    Any unchecked item/s on the Inspection Requirements will be sent to
                                                    the Investigation upon submission. Please define the violation/s on
                                                    the remarks for other details.
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
                                    id="btnInsNewAppl"
                                    class="btn btn-success"
                            >Save
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- MissionOrder Modal -->
    <div
            class="modal fade inspection-modal-missionOr"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="missionOr"
                    class="form-horizontal"
                    name="missionOr"
                    enctype="multipart/form-data"
                    action="BPLSMsnOrdr.jsp" method="GET"
            >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="panel panel-inverse panel-danger">
                            <div class="panel-heading">
                                <h4
                                        class="panel-title"
                                >Print Mission Order</h4>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="col-md-8 panel-body">
                                        <h5>
                                            Select An Application:
                                            <select class="selectpicker form-control" data-style="btn-white"
                                                    name="bussIns" tabindex="-1"
                                            >
                                                <%
                                                    while (gg7.next()) {
                                                %>
                                                <option value='<%=gg7.getString("BU_ID")%>'><%=gg7.getString("BU_NAME")%>
                                                </option>
                                                <%
                                                    }
                                                    gg7.close();
                                                %>
                                            </select>
                                        </h5>
                                        <h5>
                                            Date:
                                            <input name="moDate" type="date" class="form-control date" required/>
                                        </h5>
                                        <h5>
                                            Expiry Date:
                                            <input name="moExpD" type="date" class="form-control date" required/>
                                        </h5>
                                        <h5>
                                            Authority to Inspect:
                                            <select class="selectpicker form-control" data-style="btn-white"
                                                    name="authIns" tabindex="-1"
                                            >
                                                <%
                                                    while (gg4.next()) {
                                                        String empName = gg4.getString("EP_FNAME") + " " + gg4.getString("EP_MNAME") + " " + gg4.getString("EP_LNAME");
                                                %>
                                                <option value='<%=empName%>'><%=empName%>
                                                </option>
                                                <%
                                                    }
                                                    gg4.close();
                                                %>
                                            </select>
                                        </h5>
                                        <h5>
                                            Head Inspection Division:
                                            <select class="selectpicker form-control" data-style="btn-white"
                                                    name="headIns" tabindex="-1"
                                            ><%
                                                while (gg5.next()) {
                                                    String empName = gg5.getString("EP_FNAME") + " " + gg5.getString("EP_MNAME") + " " + gg5.getString("EP_LNAME");
                                            %>
                                                <option value='<%=empName%>'><%=empName%>
                                                </option>
                                                <%
                                                    }
                                                    gg5.close();
                                                %></select>
                                        </h5>
                                        <h5>
                                            Chief BPLO:
                                            <select class="selectpicker form-control" data-style="btn-white"
                                                    name="chiefBp" tabindex="-1"
                                            ><%
                                                while (gg6.next()) {
                                                    String empName = gg6.getString("EP_FNAME") + " " + gg6.getString("EP_MNAME") + " " + gg6.getString("EP_LNAME");
                                            %>
                                                <option value='<%=empName%>'><%=empName%>
                                                </option>
                                                <%
                                                    }
                                                    gg6.close();
                                                %></select>
                                        </h5>
                                        <h5>
                                            Licence Ispector / Officer:
                                            <input id="insOfficer" name="insOfficer" type="text" class="form-control"/>
                                        </h5>
                                        <h5>
                                            Licence Ispector / Officer:
                                            <input
                                                    id="insOfficer1" name="insOfficer1" type="text" class="form-control"/>
                                        </h5>
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
                                    type="submit"
                                    id="btnMiOrNewAppl"
                                    class="btn btn-success"
                            >Start
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="BPLSIPFooter.jsp"></jsp:include>
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
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="assets/js/divInspection.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</html>
