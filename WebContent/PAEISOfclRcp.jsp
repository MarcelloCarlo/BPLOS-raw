<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/10/2018
  Time: 1:31 PM
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
    <link rel="icon" href="extras/logo1.png">
    <title>PAEIS | Official Receipt</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="icon" href="extras/logo1.png">

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
<%try{
    String tb_Id = request.getParameter("tb_Id");
    LGUConnect connect = new LGUConnect();
    Connection connection = connect.getConnection();
    PreparedStatement getOR = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_taxbill TXB JOIN rpt_t_rp_owner rtro on TXB.RPO_ID = rtro.RPO_ID JOIN rpt_t_rp_land rtrl on TXB.RPL_ID = rtrl.RPL_ID JOIN rpt_t_rptax rtr on TXB.RPTAX_ID = rtr.RPTAX_ID JOIN rpt_t_assessment rta on TXB.RPTA_ID = rta.RPTA_ID JOIN bpls_t_employee_profile btep on rta.APPROVED_BY = btep.EP_ID JOIN rpt_r_property_class rrpc on rtrl.PC_ID = rrpc.PC_ID JOIN rpt_r_property_type rrpt on rtrl.PT_ID = rrpt.PT_ID JOIN rpt_t_official_receipt OFR ON TXB.RPTTB_ID = OFR.RPTTB_ID  WHERE TXB.RPTTB_ID = ?");
    getOR.setInt(1,Integer.parseInt(tb_Id));
    ResultSet getORRs = getOR.executeQuery();
%>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->


<!-- begin #page-container -->
<div id="page-container" class="page-without-sidebar ">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin page-header -->
        <h1 class="page-header hidden-print">Official Receipt</h1>
        <!-- end page-header -->

        <!-- begin invoice -->
        <%while (getORRs.next()){%>
        <div class="invoice">
            <div class="invoice-company">
                    <span class="pull-right hidden-print">
                    <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i
                            class="fa fa-print m-r-5"></i> Print</a>
                    </span>
                Computerized Official Receipt (Original)
            </div>
            <div class="invoice-header">
                <div class="invoice-from">
                    <address class="m-t-5 m-b-5">
                        Machine Validation No:<br/>
                        Bill Number:<br/>
                        Payor:
                    </address>
                </div>
                <div class="invoice-to">
                    <address class="m-t-5 m-b-5">
                        <%=getORRs.getString("RPTOR_NUMBER")%><br/>
                        <%=getORRs.getString("RPTTB_BILL_NO")%><br/>
                        <%=getORRs.getString("RPO_FNAME") +" "+getORRs.getString("RPO_SNAME")%>
                    </address>
                </div>
                <div class="invoice-date">
                    <div class="date m-t-5"><%
                        SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");

                        String dateString = format.format( new Date()   );
                        Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse( getORRs.getString("RPTOR_DATE") );%><%=date%></div>
                    <div class="invoice-detail">
                        Treasurer:  <%=getORRs.getString("EP_FNAME") +" "+ getORRs.getString("EP_LNAME")%>
                    </div>
                </div>
            </div>
            <div class="invoice-content">
                <div class="table-responsive">
                    <table class="table table-invoice">
                        <thead>
                        <tr>
                            <th>NATURE OF COLLECTION</th>
                            <th>AMOUNT</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            PreparedStatement getFeeList = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_r_fee_list FL JOIN rpt_t_fl_tb rtft on FL.RPTFL_ID = rtft.RPTFL_ID WHERE RPTTB_ID = ?");
                            getFeeList.setInt(1,Integer.parseInt(getORRs.getString("TXB.RPTTB_ID")));
                            ResultSet getFeeListRs = getFeeList.executeQuery();

                            while (getFeeListRs.next()){%>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                <%=getFeeListRs.getString("RPTFL_NAME")%>
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                <%=getFeeListRs.getString("AMOUNT")%>
                            </td>
                        </tr>
                        <%--<tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                City Share
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                Barangay Share
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                Special Education Fund
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">

                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                Idle Land Tax
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                SHT
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                Garbage Fee (TRO 020514)
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                DISCOUNT
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                NET TAX
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                CR (NB)
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                BALANCE
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>
                        <tr style="vertical-align: top;">
                            <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                PENALTY 36.00% Sec 222 RA 7160
                            </td>
                            <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                TAX
                            </td>
                        </tr>--%>
                        <%}%>


                        </tbody>
                    </table>
                </div>
                <div class="invoice-price">
                    <div class="invoice-price-left">
                    </div>
                    <div class="invoice-price-right">
                        <small>TOTAL</small>
                        PHP <%=getORRs.getString("AMOUNT_DUE")%>
                    </div>
                </div>
            </div>
            <div class="invoice-note">
                * Write the number and date of this receipt on the back of the treasury warrant, check or money order
                received
            </div>
        </div>
        <%}%>
        <!-- end invoice -->
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
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-53034621-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
<%}catch (Exception e){
    e.printStackTrace();
}%>
</html>