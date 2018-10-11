<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: John Carlo Villar
  Date: 09/23/2018
  Time: 05:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% LGUConnect conX = new LGUConnect();
    try {
        String natureSt = "";
        Connection connection = conX.getConnection();
        String refNo = request.getParameter("refNo");
        PreparedStatement getAssess = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_business BU JOIN bpls_t_bp_application AP ON BU.BU_ID = AP.BU_ID JOIN bpls_t_taxpayer TP ON BU.TP_ID = TP.TP_ID JOIN bpls_r_business_nature BN ON BU.BN_ID = BN.BN_ID WHERE AP_REFERENCE_NO = ?");
        getAssess.setString(1, refNo);
        ResultSet rs = getAssess.executeQuery();
        PreparedStatement getHist = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_ap_history WHERE TL_AP_NO = ?");
        getHist.setString(1,refNo);
        ResultSet rs1 = getHist.executeQuery();
%>
<html>
<head>
    <title>BPLS | Route Slip</title>

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
<jsp:include page="BPLSRtSlipComponent.jsp"/>
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <%--<ol class="breadcrumb pull-right">--%>
        <%--<li><a href="javascript:;">System Admin</a></li>--%>
        <%--<li class="active">User Management</li>--%>
        <%--</ol>--%>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <%--<h1 class="page-header">User Management</h1>--%>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">Route Slip</h4>
                    </div>
                    <div class="panel-body">
                        <%while (rs.next()) {
                            String _pres = String.valueOf(rs.getString("BU_PRESIDENT"));
                            String pres="";
                            if (_pres.equalsIgnoreCase("null")){
                                pres = "None";
                            }
                            String classification = String.valueOf(rs.getString("BN_CLASSIFICATION"));
                            if (classification.equalsIgnoreCase("S")) {
                                natureSt = "(Small Scale)";
                            } else if (classification.equalsIgnoreCase("L")) {
                                natureSt = "(Large Scale)";
                            } else {
                                natureSt = "(Unidentified)";
                            }%>
                        <div class="form-group">
<input class="hidden" name="hidAPID" id="hidAPID" value="<%out.print(rs.getString("AP_ID"));%>"/>
                            <h5>Business Name/Corporate Name: <label><%out.print(rs.getString("BU_NAME"));%></label>
                            </h5>
                        </div>
                        <div class="form-group">
                            <h5>Name of Sole Proprietor/Partnership/President: <label><%=pres%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Business Address: <label><%out.print(rs.getString("BU_LOCATION"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Tel No.: <label><%out.print(rs.getString("BU_CONTACT"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Authorized Representative: <label><%out.print(rs.getString("TP_FNAME"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Address: <label><%out.print(rs.getString("TP_HOME_ADDRESS"));%></label></h5>
                        </div>
                        <div class="form-group">
                            <h5>Business Nature: <label><%out.print(rs.getString("BN_NAME"));%> <%=natureSt%></label></h5>
                        </div>
                        <%  }rs.close();%>
                    </div>

                    <hr>

                    <div class="panel-body">
                        <ul class="timeline">
                            <% int total = 0; while (rs1.next()) {
                                String stRemarks = "";
                                String divGuide = "";
                                String remarks = String.valueOf(rs1.getString("TL_REMARKS"));
                                String divCode = String.valueOf(rs1.getString("TL_DIV_CODE"));
                                Date _tldate = rs1.getTimestamp("TL_DATE");
                                String tldate = null;
                               String tltime = null;
                               String reuploadBtn = "";
                            if (remarks.equalsIgnoreCase("null")||remarks.isEmpty()){
                                stRemarks = "No Comments."; }
                                else { stRemarks = remarks;}
                                tldate = new SimpleDateFormat("MMMM dd, yyyy").format(_tldate);
                                tltime =  new SimpleDateFormat("hh:mm aaa").format(_tldate);
                                if(divCode.equals("DIV-EV")){
                                    divGuide = "Great! Evaluating you Application.";
                                } else if (divCode.equals("DIV-INS")){
                                    divGuide = "Inspectioning your business.";
                                } else if (divCode.equals("DIV-INV")){
                                    divGuide = "It seems you have violations. Starting investigation.";
                                } else if (divCode.equals("DIV-AS")){
                                    divGuide = "Assessing your payment for your business.";
                                } else if (divCode.equals("DIV-TRE")){
                                    divGuide = "Assessed! Please claim your billing statement and prepare for the payment";
                                } else if (divCode.equals("DIV-REL")){
                                    divGuide = "Releasing! Please claim your business permit.";
                                } else if (divCode.equals("END")){
                                    divGuide = "Done! Thank you for your contribution!";
                                } else if (divCode.equals("DIV-RINS")){
                                    divGuide = "Giving you an another re-inspection. Please comply to procede.";
                                } else if (divCode.equals("DIV-REV")){
                                    divGuide = "There's a problem on your documents. Please re-upload your file with required documents";
                                    reuploadBtn = "<p><form  name='reuploadFileForm' id='reuploadFileForm'> <input type='number' class='hidden' id='apID' name='apID'><input type='file' name='fileUnifiedRequirements' id='fileUnifiedRequirements' accept='.doc,.docx,.pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf' required> <button type='submit' id='submitBtn' class='btn btn-success btn-lg'>Reupload</button></form><p>";
                                }
                            %>
                            <li>
                                <!-- begin timeline-time -->
                                <div class="timeline-time">
                                    <span class="date"><%out.print(tldate);%></span>
                                    <span class="time"><%out.print(tltime);%></span>
                                </div>
                                <!-- end timeline-time -->
                                <!-- begin timeline-icon -->
                                <div class="timeline-icon">
                                    <a href="javascript:;"><%=total+=1%></a>
                                </div>
                                <!-- end timeline-icon -->
                                <!-- begin timeline-body -->
                                <div class="timeline-body">
                                    <div class="timeline-header">
                                        <span class="username"><a href="javascript:;">Status: <%=rs1.getString("TL_DIV_NAME")%></a> <small></small></span>
                                    </div>
                                    <div class="timeline-content">
                                        <p>
                                            <%= stRemarks%>
                                        </p><%=reuploadBtn%>
                                    </div>
                                    <div class="timeline-footer">
                                        <p><%=divGuide%></p>
                                    </div>
                                </div>
                                <!-- end timeline-body -->
                            </li>
                            <%}rs1.close();%>
                        </ul>
                    </div>
                </div>
                <!-- end panel -->
            </div>
        </div>
    </div>
    <!-- end #content -->
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%
    } catch (Exception e) {
        out.print(e);
    }
%>
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
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
<script src="assets/js/form-wizards.demo.min.js"></script>
<script src="assets/js/reuploadFile.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>