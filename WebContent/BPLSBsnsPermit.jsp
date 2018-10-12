<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/10/2018
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>PAEIS | Business Permit</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="assets/css/animate.min.css" rel="stylesheet"/>
    <link href="assets/css/style.min.css" rel="stylesheet"/>
    <link href="assets/css/style-responsive.min.css" rel="stylesheet"/>
    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme"/>
    <link href="assets/css/invoice-print.min.css" rel="stylesheet"/>
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>

<% LGUConnect connect = new LGUConnect();
String bpNo = String.valueOf(request.getParameter("bpNo"));
String bpnum = "",bp_is_dt="",tp_nat = "",bu_name="",ar_name="",bu_pres="",bu_loc="",bp_val_yr="",bu_cap="",bn_name="",bn_clas="",bp_rem="",sss_no="",tp_tin="",bp_empNo="",bu_area="",pres_rep="",or_no="",tb_billed = "",amount="";
int tb_id = 0;

try {
    Connection connection = connect.getConnection();
    PreparedStatement releaseAll = (PreparedStatement) connection.prepareStatement("SELECT * FROM view_bussperm WHERE BP_NUMBER = ?");
    releaseAll.setString(1,bpNo);
    ResultSet rsAll = releaseAll.executeQuery();
    while (rsAll.next()){
    bpnum = String.valueOf(rsAll.getString("BP_NUMBER"));
    bp_is_dt = new SimpleDateFormat("MMMM dd, yyyy").format(rsAll.getDate("BP_ISSUED_DATE"));
    tp_nat = String.valueOf(rsAll.getString("TP_NATIONALITY"));
    bu_name = String.valueOf(rsAll.getString("BU_NAME"));
    ar_name = String.valueOf(rsAll.getString("AR_NAME"));
    bu_pres = String.valueOf(rsAll.getString("BU_PRESIDENT"));
    bu_loc = String.valueOf(rsAll.getString("BU_LOCATION"));
    bp_val_yr = new SimpleDateFormat("MMMM dd, yyyy").format(rsAll.getDate("BP_VALID_YEARS"));
    bu_cap = String.valueOf(rsAll.getFloat("BU_CAPITALIZATION"));
    bn_name = String.valueOf(rsAll.getString("BN_NAME"));
    bn_clas = String.valueOf(rsAll.getString("BN_CLASSIFICATION").equalsIgnoreCase("L")? "Large Scale": "Small Scale" );
    bp_rem = String.valueOf(rsAll.getString("BP_REMARKS"));
    bp_empNo = String.valueOf(rsAll.getInt("BU_EMP_NO"));
    sss_no = String.valueOf(rsAll.getString("TP_SSS_NO"));
    tp_tin = String.valueOf(rsAll.getString("TP_TIN"));
    bu_area = String.valueOf(rsAll.getFloat("BU_AREA"));
    tb_id = rsAll.getInt("TB_ID");
    tb_billed = new SimpleDateFormat("MMMM dd, yyyy").format(rsAll.getDate("TB_DATE_BILLED"));

    if (bu_pres.equalsIgnoreCase("null") || bu_pres.isEmpty()){
        pres_rep = ar_name + "- REPRESENTATIVE";
    } else {
        pres_rep = bu_pres + "- PRESIDENT";
    }
    }

    PreparedStatement getTxBl = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_official_receipt WHERE TB_ID = ?");
    getTxBl.setInt(1,tb_id);
    ResultSet rsTx = getTxBl.executeQuery();
    while (rsTx.next()){
        or_no = String.valueOf(rsTx.getString("OR_TW_CH_MO_NO"));
        amount = String.valueOf(rsTx.getBigDecimal("OR_TOTAL_AMOUNT"));
    }
%>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->


<!-- begin #page-container -->
<div id="page-container" class="page-without-sidebar ">

    <!-- begin #content -->
    <div id="content" class="content">

        <!-- begin invoice -->
        <div class="invoice">
            <div class="invoice-company">
                    <span class="pull-right hidden-print">
                    <%--<a href="javascript:;" class="btn btn-sm btn-success m-b-10"><i class="fa fa-download m-r-5"></i> Export as PDF</a>--%>
                    <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i
                            class="fa fa-print m-r-5"></i> Print</a>
                    </span>
                Business Permit
            </div>
            <div class="invoice-header">
                <div class="invoice-from">
                    <address class="m-t-5 m-b-5">
                        This certifies that<br/>
                        with registered trade name as<br/>
                        as represented by<br/>
                        with business address at
                    </address>
                </div>
                <div class="invoice-to">
                    <address class="m-t-5 m-b-5">
                        <%=bu_name%><br/>
                        <%=bu_name%><br/>
                        <%=pres_rep%><br/>
                        <%=bu_loc%>
                    </address>
                </div>
                <div class="invoice-date">
                    <div class="date m-t-5"><%=bp_is_dt%></div>
                    <div class="invoice-detail">
                        Nationality <%=tp_nat%>
                    </div>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <address>
                    has been granted a <strong>BUSINESS PERMIT</strong> to operate the following business/es under
                    ordinance No. SP-91,
                    S-93, otherwise known as the 1993 Quezon City Revenue Code, and the ordinance/s indicated at the
                    back hereof, subject
                    to such other pertinent ordinances, laws and related administrative implementary regulations.
                </address>
            </div>
            <%--<div class="invoice-header">--%>
            <%--<address>--%>
            <%--has been granted a <strong>BUSINESS PERMIT</strong> to operate the following business/es under ordinance No. SP-91,--%>
            <%--S-93, otherwise known as the 1993 Quezon City Revenue Code, and the ordinance/s indicated at the back hereof, subject--%>
            <%--to such other pertinent ordinances, laws and related administrative implementary regulations.--%>
            <%--</address>--%>
            <%--</div>--%>
            <div class="invoice-content">
                <div class="table-responsive">
                    <h2>VALID UNTIL <small><%=bp_val_yr%></small></h2>
                    <table class="table table-invoice">
                        <thead>
                        <tr>
                            <th>KIND OF BUSINESS</th>

                            <th>REMARKS</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><%=bn_name%> (<%=bn_clas%>) <br> CAPITALIZED AT <%=bu_cap%></td>
                            <td><%=bp_rem%></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="panel-body col-md-6">
                            <h5>
                                TOTAL NO. OF EMPLOYEES <%=bp_empNo%>
                            </h5>
                            <h5>
                                SSS No. <%=sss_no%>
                            </h5>
                        </div>
                        <div class="panel-body col-md-6">
                            <h5>
                                AREA OF ESTABLISHMENT <%=bu_area%>
                            </h5>
                            <h5>
                                TIN <%=tp_tin%>
                            </h5>
                        </div>
                    </div>
                    <table class="table table-invoice">
                        <thead>
                        <tr>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="table table-invoice">
                        <thead>
                        <tr>
                            <th class="text-center">SUBJECT TO THE CONDITIONS AT THE BACK HERE OF</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>PERMIT FEE & CITY TAX TO BE PAID ON OR BEFORE:</td>
                            <td>INSERT PAYMENT HERE</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="panel-body">
                        <h5 class="pull-right text-center">
                            PARTICULARS OF PAYMENT<br/>
                        </h5>
                        <br>
                        <br>
                        <p class="pull-right">
                            Official Receipt No. <%=or_no%><br/>
                            Date of Payment <%=tb_billed%><br/>
                            Period Covered<%=bp_val_yr%><br/>
                        <br/>
                            <strong>Total Amount Paid: P <%=amount%></strong>
                        </p>

                </div>

                <%--<div class="invoice-price">--%>
                    <%--<div class="invoice-price-left">--%>
                        <%--<div class="invoice-price-row">--%>
                            <%--&lt;%&ndash;<div class="sub-price">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<small>SUBTOTAL</small>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;$4,500.00&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="sub-price">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<i class="fa fa-plus"></i>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="sub-price">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<small>PAYPAL FEE (5.4%)</small>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;$108.00&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="invoice-price-right">--%>
                        <%--<small>TOTAL</small>--%>
                        <%--Insert Total Here--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>
            <div class="invoice-note">
                * Write the number and date of this receipt on the back of the treasury warrant, check or money order
                received
            </div>
            <%--<div class="invoice-footer text-muted">--%>
            <%--<p class="text-center m-b-5">--%>
            <%--THANK YOU FOR YOUR BUSINESS--%>
            <%--</p>--%>
            <%--<p class="text-center">--%>
            <%--<span class="m-r-10"><i class="fa fa-globe"></i> matiasgallipoli.com</span>--%>
            <%--<span class="m-r-10"><i class="fa fa-phone"></i> T:016-18192302</span>--%>
            <%--<span class="m-r-10"><i class="fa fa-envelope"></i> rtiemps@gmail.com</span>--%>
            <%--</p>--%>
            <%--</div>--%>
        </div>
        <!-- end invoice -->
    </div>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
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
<!-- ================== END PAGE LEVEL JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->


<script>
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