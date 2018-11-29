<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/12/2018
  Time: 2:37 AM
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
    <title>MTOPS | Inspection</title>
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
<body>
<!-- begin #page-loader -->
<div
        id="page-loader"
        class="fade in"
>
    <span class="spinner"></span>
</div>
<!-- end #page-loader -->
<jsp:include page="MTOPSIPComponent.jsp"/>
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
                                    <th>Representative</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        Tricycle Driver
                                    </td>
                                    <td>
                                        Commonwealth
                                    </td>
                                    <td>
                                        Active
                                    </td>
                                    <td>
                                        10/13/2018
                                    </td>
                                    <td>
                                        Jeepney Driver
                                    </td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-success mtopsModal"
                                                data-toggle="modal"
                                                data-target=".inspection-modal-mtops" title="Comply the Inspected Business"
                                        ><i class="fa fa-lg fa-list-ul"></i>
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    LGUConnect conX = new LGUConnect();
                                    try{
                                    Connection conn3 = conX.getConnection();
                                    Statement ss3 = conn3.createStatement();
                                    ResultSet gg3 = ss3.executeQuery("SELECT * FROM `view_applicationformsip`");
                                    while (gg3.next()) {
                                %>
                                <%
                                    } }catch (Exception e) {out.print(e);}
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
            class="modal fade inspection-modal-mtops"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <form
                    id="mtopsInsApplForm"
                    class="form-horizontal"
                    name="mtopsInsApplForm"
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
                                    <input type="text"
                                           class="hide"
                                           id="_AP_REFERENCE_NO"
                                           name="_AP_REFERENCE_NO"
                                    />
                                    <div class="col-md-12 panel-body">
                                        <h5>
                                            Applicant's Name:
                                            <label id="nApplName"></label>
                                        </h5>
                                        <h5>
                                            TODA:
                                            <label id="nTODA"></label>
                                        </h5>
                                    </div>
                                    <div class="panel-body">
                                        <h5>Inspection Checklist:</h5>
                                        <div class="col-md-6">
                                        <div class="panel-body">
                                            <ul class="to_do">
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwTires"
                                                            name="hwTires"
                                                            class="flat"
                                                            value="Pass"
                                                    > Tires
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwWheels"
                                                            name="hwWheels"
                                                            class="flat"
                                                            value="Pass"
                                                    > Wheels
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwBrakes"
                                                            name="hwBrakes"
                                                            class="flat"
                                                            value="Pass"
                                                    > Brakes
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwLevPed"
                                                            name="hwLevPed"
                                                            class="flat"
                                                            value="Pass"
                                                    > Levers and Pedals
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwCables"
                                                            name="hwCables"
                                                            class="flat"
                                                            value="Pass"
                                                    > Cables
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwHoses"
                                                            name="hwHoses"
                                                            class="flat"
                                                            value="Pass"
                                                    > Hoses
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwThrottle"
                                                            name="hwThrottle"
                                                            class="flat"
                                                            value="Pass"
                                                    > Throttle
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwBattery"
                                                            name="hwBattery"
                                                            class="flat"
                                                            value="Pass"
                                                    > Battery
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwHeadlamp"
                                                            name="hwHeadlamp"
                                                            class="flat"
                                                            value="Pass"
                                                    > Headlamp
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwTBLamp"
                                                            name="hwTBLamp"
                                                            class="flat"
                                                            value="Pass"
                                                    > Tail Lamp / Brake Lamp
                                                </p>
                                                <p>
                                                    <input
                                                            type="checkbox"
                                                            id="hwTSignals"
                                                            name="hwTSignals"
                                                            class="flat"
                                                            value="Pass"
                                                    > Turn Signals
                                                </p>

                                            </ul>
                                        </div> </div>
                                        <div class="col-md-6">
                                            <div class="panel-body">
                                                <ul class="to_do">
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwMirrors"
                                                                name="hwMirrors"
                                                                class="flat"
                                                                value="Pass"
                                                        > Mirrors
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwRefl"
                                                                name="hwRefl"
                                                                class="flat"
                                                                value="Pass"
                                                        > Lenses & Reflectors
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwWiring"
                                                                name="hwWiring"
                                                                class="flat"
                                                                value="Pass"
                                                        > Wiring
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwLevels"
                                                                name="hwLevels"
                                                                class="flat"
                                                                value="Pass"
                                                        > Levels
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwLeaks"
                                                                name="hwLeaks"
                                                                class="flat"
                                                                value="Pass"
                                                        > Leaks
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwFrame"
                                                                name="hwFrame"
                                                                class="flat"
                                                                value="Pass"
                                                        > Frame
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwSusp"
                                                                name="hwSusp"
                                                                class="flat"
                                                                value="Pass"
                                                        > Suspension
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwBelt"
                                                                name="hwBelt"
                                                                class="flat"
                                                                value="Pass"
                                                        > Chain or Belt
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwFastn"
                                                                name="hwFastn"
                                                                class="flat"
                                                                value="Pass"
                                                        > Fasteners
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwCStand"
                                                                name="hwCStand"
                                                                class="flat"
                                                                value="Pass"
                                                        > Center Stand
                                                    </p>
                                                    <p>
                                                        <input
                                                                type="checkbox"
                                                                id="hwSStand"
                                                                name="hwSStand"
                                                                class="flat"
                                                                value="Pass"
                                                        > Side Stand
                                                    </p>
                                                </ul>
                                            </div>
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
                                    id="btnCloseMtopsApplModal"
                            >Close
                            </button>
                            <button
                                    type="button"
                                    id="btnInsMtopsAppl"
                                    class="btn btn-success"
                            >Save
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="MTOPSIPFooter.jsp"></jsp:include>
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
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/divMtopsInspection.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>
