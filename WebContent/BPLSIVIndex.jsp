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
<%@ page import="java.sql.SQLException" %>
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
    <title>BPLS | Investigation</title>
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
<body>
<!-- begin #page-loader -->
<div
        id="page-loader"
        class="fade in"
>
    <span class="spinner"></span>
</div>
<!-- end #page-loader -->
<jsp:include page="BPLSIVComponent.jsp"/>
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
                <li><a href="javascript:;">Investigation</a></li>
                <li class="active">Application Investigation</li>
            </ol>
            <!-- begin page-header -->
            <h1 class="page-header">Application Investigation</h1>
            <!-- end page-header -->
            <div class="row">
                <div class="col-md-12">
                    <!-- begin panel -->
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Investigation Table</h4>
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
                                    <th>President/Representative</th>
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
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    LGUConnect conX = new LGUConnect();
                                    try {
                                        Connection conn3 = conX.getConnection();
                                        Statement ss3 = conn3.createStatement();
                                        ResultSet gg3 = ss3.executeQuery("SELECT * FROM `view_applicationformsiv`");
                                        while (gg3.next()) {
                                            String apType = gg3.getString("AP_TYPE");
                                            String modalMode = "";
                                            String modalClass = "";
                                            if (apType.equals("New")) {
                                                modalMode = ".investigation-modal-new";
                                                modalClass = "newModal";
                                            } else if (apType.equals("Renew")) {
                                                modalMode = ".investigation-modal-renew";
                                                modalClass = "renewModal";
                                            } else {
                                                modalMode = ".investigation-modal-new";
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
                                    <td><%=gg3.getString("BU_PRESIDENT")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("TAX_PAYERNAME")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BU_LOCATION")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BU_CONTACT")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("AUTH_REPNAME")%>
                                    </td><!--10-->
                                    <td class="hide"><%=gg3.getString("AR_HOME_ADDRESS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BN_NAME")%>
                                    </td>
                                    <td id="AP_REFERENCE_NO" class="hide"><%=gg3.getString("AP_REFERENCE_NO")%>
                                    </td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-success <%=modalClass%>"
                                                data-toggle="modal"
                                                data-target="<%=modalMode%>" title="Comply for the Inspection"
                                        ><i class="fa fa-lg fa-list-ul"></i>
                                        </button>
                                    </td>
                                    <td class="hide"><%=gg3.getString("ZONING_INS")%>
                                    </td><!--15-->
                                    <td class="hide"><%=gg3.getString("FIRE_INS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("HEALTH_SANITATION_INS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("BUILDING_INS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("LABOR_INS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("MISC_INS")%>
                                    </td>
                                    <td class="hide"><%=gg3.getString("INS_REMARKS")%>
                                    </td>
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
            class="modal fade investigation-modal-new"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="newInvApplForm"
                    class="form-horizontal"
                    name="newInvApplForm"
                    enctype="multipart/form-data"
            >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="panel panel-inverse panel-danger">
                            <div class="panel-heading">
                                <h4
                                        class="panel-title"
                                        id="myModalLabel"
                                >Investigation for New Application</h4>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-11">
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
                                        <!-- <h5>
                                             Name of Sole Proprietor/Partnership/President:
                                             <label id="nBussOwner"></label>
                                         </h5>-->
                                        <h5>
                                            Business Address:
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
                                        <h5>Inspected List</h5>
                                        <div class="">
                                            <ul class="to_do">
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkZONING_INS"
                                                            name="ZONING_INS"
                                                            class="flat-black"
                                                            value="Pass"
                                                    > Zoning Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkFIRE_INS"
                                                            name="FIRE_INS"
                                                            class="flat-black"
                                                            value="Pass"
                                                    > Fire Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkHS_INS"
                                                            name="HS_INS"
                                                            class="flat-black"
                                                            value="Pass"
                                                    > Health & Sanitation Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkBLDG_INS"
                                                            name="BLDG_INS"
                                                            class="flat-black"
                                                            value="Pass"
                                                    > Building Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkLABOR_INS"
                                                            name="LABOR_INS"
                                                            class="flat-black"
                                                            value="Pass"
                                                    > Labor Inspection
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="chkMISC_INS"
                                                            name="MISC_INS"
                                                            class="flat-black"
                                                            value="Pass"
                                                    > Miscellaneous Inspection (See Business Nature)
                                                </p>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-8">
                                            <label for="txtMISC_REMARKS">Violation Details</label></div>
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
                                    <div class="panel-body row">
                                        <div class="col-md-5">
                                            <input type="checkbox" id="chkRectify" name="Rectify" class="flat-black">
                                            <label for="chkRectify">Rectify Application</label>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="number" id="numMonths" name="numMonths" class="form-control"
                                                   placeholder="Months">
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="note note-info">
                                            <h5>Investigation Notes</h5>
                                            <ul>
                                                <li>
                                                    <p>
                                                        Miscellaneous Investigation based on the business nature should
                                                        be in
                                                        the business. LEAVE UNCHECK THE "MISCELLANOUS INVESTIGATION" IF
                                                        ANY OTHER
                                                        REQUIREMENTS ON THE BUSINESS IS VIOLATED/MISSING/INVALID.
                                                    </p>
                                                </li>
                                                <li><p>
                                                    Any unchecked item/s on the Inspection Requirements will be sent to
                                                    the
                                                    Investigation upon submission. Please define the violation/s on the
                                                    remarks for other details.
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
                                    id="btnInvNewAppl"
                                    class="btn btn-success"
                            >Save Changes
                            </button>
                        </div>
                    </div>
            </form>
        </div>
    </div>
    <!-- Renewal modal -->

    <div
            class="modal fade investigation-modal-terminate"
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
                        <div class="panel panel-inverse panel-danger">
                            <div class="panel-heading-btn">
                                <h4
                                        class="panel-title"
                                >Application Termination</h4>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="col-md-8">
                                        <h5>
                                            Application/Referrence Number:
                                            <input class="hide" name="tRefNoh"
                                                   id="tRefNoh" type="text"/>
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
                                                      id="txtRemarks"
                                                      name="txtRemarks"
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

    <jsp:include page="BPLSIVFooter.jsp"></jsp:include>
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
<script src="assets/plugins/masked-input/masked-input.min.js"></script>
<script
        src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"
></script>
<script
        src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"
></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="assets/js/divInvestigation.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>
