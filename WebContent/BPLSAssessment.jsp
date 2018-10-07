<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 9/25/2018
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<% LGUConnect conX = new LGUConnect();
try {
Connection connection = conX.getConnection();
    String refNo= request.getParameter("refNo");
PreparedStatement getAssess = connection.prepareStatement("SELECT * FROM view_assessment WHERE AP_REFERENCE_NO = ?");
getAssess.setString(1,refNo);
ResultSet rs = getAssess.executeQuery();
while (rs.next()){%>
<head>
    <meta charset="utf-8" />
    <title>PAEIS | Assessment</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <link href="assets/css/style.min.css" rel="stylesheet" />
    <link href="assets/css/style-responsive.min.css" rel="stylesheet" />
    <link href="assets/css/invoice-print.min.css" rel="stylesheet" />
    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>


<!-- begin #page-container -->
<div id="page-container" class="page-without-sidebar ">

    <!-- begin #content -->
        <div id="content" class="content">


            <!-- begin invoice -->
            <div class="invoice">
                <div class="invoice-company">
                    <span class="pull-right hidden-print">
                    <a href="javascript:;" class="btn btn-sm btn-success m-b-10"><i class="fa fa-download m-r-5"></i> Export as PDF</a>
                    <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i class="fa fa-print m-r-5"></i> Print</a>
                    </span>
                   Application Assessment (Applicant's Copy)
                </div>
                <div class="invoice-header">
                    <div class="invoice-from">
                        <address class="m-t-5 m-b-5">
                            <strong>OR Number: <% try {
                                out.print(rs.getString("AS_OR_NO"));} catch (SQLException e) {
                                e.printStackTrace();
                                } %></strong><br />
                            Business Name: <%
                            try {
                                out.print(rs.getString("BU_NAME"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %><br/>
                            Business Location:  <%
                            try {
                                out.print(rs.getString("BU_LOCATION"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %><br />
                            Contact:  <%
                            try {
                                out.print(rs.getString("BU_CONTACT"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %><br />
                        </address>
                    </div>
                    <div class="invoice-date">
                        <div class="date m-t-5">Period Covered: <%
                            try {
                                out.print(rs.getString("AS_PERIOD_COVERED"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %></div>
                        <div class="invoice-detail">
                            Due Date: <%
                            try {
                                out.print(rs.getString("AS_DUE_DATE"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                        </div>
                    </div>
                </div>
                <div class="invoice-content">
                    <div class="table-responsive">
                        <table class="table table-invoice">
                            <thead>
                            <tr>
                                <th>Fee Description</th>
                                <th>Amount (PHP)</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <%
                                    try {
                                        out.print("<td>PHP "+rs.getString("FEES_NAME")+"</td>");
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>

                                <%
                                    try {
                                        out.print("<td class='amt'>"+rs.getString("AMOUNT")+"</td>");
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </tr>
                            <tr>
                                <td>City Tax</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Garbage Fee</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Sanitary Fee</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Bldg. Insp. Fee</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Electrical Insp. Fee</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Plumbing Insp. Fee</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Signboard Fee</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Fire Insp. Fee</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Plate/Sticker</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Zoning Fees</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Penalty & Interest</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Tourism</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Adjustment</td>
                                <td> </td>
                                <td> </td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="invoice-price">
                        <div class="invoice-price-left">
                        </div>
                        <div class="invoice-price-right row">
                            <small>TOTAL PHP</small>
                            <label id="total" style="color: white"></label>
                        </div>
                    </div>
                </div>
                <%--<div class="invoice-note">--%>
                    <%--* Make all cheques payable to [Your Company Name]<br />--%>
                    <%--* Payment is due within 30 days<br />--%>
                    <%--* If you have any questions concerning this invoice, contact  [Name, Phone Number, Email]--%>
                <%--</div>--%>
                <div class="invoice-footer text-muted">
                    <p class="text-center m-b-5">
                        LGU-PAEIS ASSESSMENT
                    </p>
                    <%--<p class="text-center">--%>
                        <%--<span class="m-r-10"><i class="fa fa-globe"></i> matiasgallipoli.com</span>--%>
                        <%--<span class="m-r-10"><i class="fa fa-phone"></i> T:016-18192302</span>--%>
                        <%--<span class="m-r-10"><i class="fa fa-envelope"></i> rtiemps@gmail.com</span>--%>
                    <%--</p>--%>
                </div>
            </div>
            <!-- end invoice -->
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <!-- begin invoice -->
            <div class="invoice">
                <div class="invoice-company">
                    Application Assessment (Treasury's Copy)
                </div>
                <div class="invoice-header">
                    <div class="invoice-from">
                        <address class="m-t-5 m-b-5">
                            <strong>OR Number: <% try {
                                out.print(rs.getString("AS_OR_NO"));} catch (SQLException e) {
                                e.printStackTrace();
                            } %></strong><br />
                            Business Name: <%
                            try {
                                out.print(rs.getString("BU_NAME"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %><br/>
                            Business Location:  <%
                            try {
                                out.print(rs.getString("BU_LOCATION"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %><br />
                            Contact:  <%
                            try {
                                out.print(rs.getString("BU_CONTACT"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %><br />
                        </address>
                    </div>
                    <div class="invoice-date">
                        <div class="date m-t-5">Period Covered: <%
                            try {
                                out.print(rs.getString("AS_PERIOD_COVERED"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %></div>
                        <div class="invoice-detail">
                            Due Date: <%
                            try {
                                out.print(rs.getString("AS_DUE_DATE"));
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                        </div>
                    </div>
                </div>
                <div class="invoice-content">
                    <div class="table-responsive">
                        <table class="table table-invoice">
                            <thead>
                            <tr>
                                <th>Fee Description</th>
                                <th>Amount (PHP)</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <%
                                    try {
                                        out.print("<td>PHP "+rs.getString("FEES_NAME")+"</td>");
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>
                                <td id="tdPerm"></td>
                            </tr>
                            <tr>
                                <td>City Tax</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Garbage Fee</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Sanitary Fee</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Bldg. Insp. Fee</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Electrical Insp. Fee</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Plumbing Insp. Fee</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Signboard Fee</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Fire Insp. Fee</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Plate/Sticker</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Zoning Fees</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Penalty & Interest</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Tourism</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Adjustment</td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="invoice-price">
                        <div class="invoice-price-left">
                        </div>
                        <div class="invoice-price-right row">
                            <small>TOTAL PHP</small>
                            <label id="total2" style="color: white"></label>
                        </div>
                    </div>
                </div>
                <%--<div class="invoice-note">--%>
                <%--* Make all cheques payable to [Your Company Name]<br />--%>
                <%--* Payment is due within 30 days<br />--%>
                <%--* If you have any questions concerning this invoice, contact  [Name, Phone Number, Email]--%>
                <%--</div>--%>
                <div class="invoice-footer text-muted">
                    <p class="text-center m-b-5">
                        LGU-PAEIS ASSESSMENT
                    </p>
                    <%--<p class="text-center">--%>
                    <%--<span class="m-r-10"><i class="fa fa-globe"></i> matiasgallipoli.com</span>--%>
                    <%--<span class="m-r-10"><i class="fa fa-phone"></i> T:016-18192302</span>--%>
                    <%--<span class="m-r-10"><i class="fa fa-envelope"></i> rtiemps@gmail.com</span>--%>
                    <%--</p>--%>
                </div>
            </div>
            <!-- end invoice -->
        </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<%}}catch(SQLException | ClassNotFoundException e){
    out.print(e);
}%>
<!-- end page container -->


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
<script src="assets/js/assessment.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>