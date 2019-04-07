<%@ page import="com.sun.jdi.event.ExceptionEvent" %>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <link rel="icon" href="extras/logo1.png">
    <title>PAEIS | Real Property Tax</title>
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
<%try{
    String tb_Id = request.getParameter("tb_Id"), taxBillNo = request.getParameter("taxBillNo");
    LGUConnect connect = new LGUConnect();
    Connection connection = connect.getConnection();
    PreparedStatement getTaxBill = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_taxbill TXB JOIN rpt_t_rp_owner rtro on TXB.RPO_ID = rtro.RPO_ID JOIN rpt_t_rp_land rtrl on TXB.RPL_ID = rtrl.RPL_ID JOIN rpt_t_rptax rtr on TXB.RPTAX_ID = rtr.RPTAX_ID JOIN rpt_t_assessment rta on TXB.RPTA_ID = rta.RPTA_ID JOIN bpls_t_employee_profile btep on rta.APPROVED_BY = btep.EP_ID JOIN rpt_r_property_class rrpc on rtrl.PC_ID = rrpc.PC_ID JOIN rpt_r_property_type rrpt on rtrl.PT_ID = rrpt.PT_ID WHERE RPTTB_ID = ? AND RPTTB_BILL_NO = ?");
    getTaxBill.setInt(1,Integer.parseInt(tb_Id));
    getTaxBill.setString(2,taxBillNo);
    ResultSet getTaxBillRs = getTaxBill.executeQuery();
%>
<body>

<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="page-without-sidebar ">
    <%while (getTaxBillRs.next()){%>
    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin page-header -->
        <div>
             <h1 class="page-header hidden-print">Tax Bill</h1>
            <span class="hidden-print">
                <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i
                    class="fa fa-print m-r-5"></i> Print</a>
            </span>
        </div>
        <div>
            <span class="hidden-print">
                <form enctype="multipart/form-data" id="confirmORForm" name="confirmORForm">
                    <input class="hidden" type="hidden" name="txbId" hidden value='<%=getTaxBillRs.getString("TXB.RPL_ID")%>'>
                <button  type="button" id="btnConfirmOR" class="btn btn-sm btn-primary"><i
                        class="fa fa-money m-r-5"></i> Generate Payment</button>
            </form>
            </span>
        </div>

        <!-- begin invoice -->
        <div class="invoice">
            <div class="invoice-company">

            </div>


            <div class="invoice-content">
                <table border="1" style="font-family: Arial; font-size: 10px;" width="100%">
                    <thead>
                    <tr>

                        <center style="font-size: 12px; padding: 10px 0px 10px 0px;">
                            <p style="color: blue;"> OFFICE OF THE CITY TREASURER - QUEZON CITY, METRO MANILA </p>
                            <h3 style="color: blue;">REAL PROPERTY TAX BILL</h3>
                            <%--<p style="color: red;">THIS IS NOT VALID AS OFFICIAL RECEIPT </p>--%>
                        </center>

                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td style="width: 50%;">
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 50%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Tax Declaration No.
                                    </td>

                                    <td style="width: 50%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Property Index No.
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%; padding: 5px 0px 5px 15px;">
                                        <%=getTaxBillRs.getString("TAX_DEC_NO")%>
                                    </td>

                                    <td style="width: 50%; padding: 5px 0px 5px 15px;">
                                        <%=getTaxBillRs.getString("RPL_PIN")%>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Name and Postal Address of Owner
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px;">
                                        <%=getTaxBillRs.getString("RPO_FNAME") +" "+getTaxBillRs.getString("RPO_SNAME") +" "+getTaxBillRs.getString("RPO_ADDR")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Location of Property (Lot & Block No.)
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px;">
                                        <%=getTaxBillRs.getString("RPL_L_STREET") +" "+getTaxBillRs.getString("RPL_L_BRGY") +" "+getTaxBillRs.getString("RPL_L_DIST_MUNI")+" "+getTaxBillRs.getString("RPL_L_CITY_PROV")%>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 20%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Class
                                    </td>
                                    <td style="width: 40%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Assessed Value
                                    </td>
                                    <td style="width: 40%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Verified By
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; padding: 5px 0px 5px 15px;">
                                        <%=getTaxBillRs.getString("PC_CODE") +"-"+getTaxBillRs.getString("PC_DESC")%>
                                    </td>
                                    <td style="width: 40%; padding: 5px 0px 5px 15px;">
                                        <%=getTaxBillRs.getString("PT_DESC")%> <br>
                                       PHP <%=getTaxBillRs.getString("ASSESSED_VAL")%>
                                    </td>
                                    <td style="width: 40%; padding: 5px 0px 5px 15px;">
                                        <%=getTaxBillRs.getString("EP_FNAME") +" "+ getTaxBillRs.getString("EP_LNAME")%>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Verified Last Payment
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px;">
                                        EEF 2011 NEW <br>
                                        2011-2011
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; color: blue;">
                                        Bill Number: <span style= "color: black;"><%=getTaxBillRs.getString("RPTTB_BILL_NO")%></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; color: blue;">
                                        Bank Reference:
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; color: blue;">
                                        Important: Notify the City Assessor's Office for any change in postal address.
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>

                        <td style="width: 50%;">
                            <table border="1" style="margin: -10px 0px -1px -1px;"  width="100%">
                                <tbody>
                                <tr style="vertical-align: top;">
                                    <td style="width: 20%;  text-align: center; color: blue;">
                                        Tax Year
                                    </td>

                                    <td style="width: 20%; padding: 5px 0px 5px 15px; text-align: center; color: blue;">
                                        Installment No.
                                    </td>

                                    <td style="width: 30%; padding: 5px 0px 5px 15px; border-color: white; text-align: center; color: blue; ">
                                        THIS PAYMENT
                                    </td>

                                    <td style="width: 30%; padding: 5px 0px 5px 15px; text-align: left; color: blue; border-color: white;">

                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; padding: 5px 0px 5px 15px; ">
                                        <%

                                            String year = getTaxBillRs.getString("TAX_YEAR");
                                            String [] sameParts = year.split("-");
                                            String taxYear = sameParts[0];

                                            pageContext.setAttribute("taxYear", taxYear);
                                            %>
                                        <c:out value="${taxYear}"/>
                                    </td>

                                    <td style="width: 20%; padding: 5px 0px 5px 15px;  ">
                                        <%=getTaxBillRs.getString("INSTALLMENT")%>
                                    </td>

                                    <td style="width: 30%; padding: 5px 0px 5px 15px; border-color: white;">

                                    </td>

                                    <td style="width: 30%; padding: 5px 5px 5px 15px; text-align: center; color: blue; border-color: white;">
                                        TOTAL
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px; font-size: 9px;"  width="100%">
                                <tbody>
                                <%
                                    PreparedStatement getFeeList = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_r_fee_list FL JOIN rpt_t_fl_tb rtft on FL.RPTFL_ID = rtft.RPTFL_ID WHERE RPTTB_ID = ?");
                                    getFeeList.setInt(1,Integer.parseInt(getTaxBillRs.getString("RPTTB_ID")));
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
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 15px 0px 5px 15px; ">

                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">

                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 15px 0px 5px 15px; ">

                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">

                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 15px 0px 5px 15px; ">

                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">

                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 15px 0px 5px 15px; ">

                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">

                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 15px 0px 5px 15px; ">

                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">

                                    </td>
                                </tr>
                                <tr style="vertical-align: top;">
                                    <td style="width: 70%; padding: 5px 0px 5px 15px; ">
                                        AMOUNT DUE
                                    </td>
                                    <td style="width: 30%; padding: 5px 0px 5px 15px; ">
                                        <%=getTaxBillRs.getString("AMOUNT_DUE")%>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table border="1" style="margin: -1px 0px -1px -1px;" width="100%">
                                <tbody>
                                <tr>
                                    <td style="width: 100%; padding: 5px 0px 5px 15px; color: blue;">
                                        Important: Present this bill to the teller when payment is made. Subject to payment of deficiency taxes if any.
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <!-- end invoice -->
        </div>
        <!-- end #content -->
        <%}%>
        <!-- begin scroll to top btn -->
        <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
                class="fa fa-angle-up"></i></a>
        <!-- end scroll to top btn -->
    </div>
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
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
    <script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
    <script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
    <script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
    <script src="assets/js/table-manage-responsive.demo.min.js"></script>
    <script src="assets/js/apps.min.js"></script>
    <!-- ================== END PAGE LEVEL JS ================== -->



    <script>
        $(document).ready(function () {
            App.init();
            TableManageResponsive.init();

            $("#btnConfirmOR").click(function () {
                var confirmORForm = new FormData($('#confirmORForm')[0]);
                swal({
                    title: "Are you sure?",
                    text: "You will save your current changes",
                    type: "warning",
                    confirmButtonColor: "#62a3cb",
                    confirmButtonText: "Confirm!",
                    showCancelButton: true,
                    cancelButtonText: 'Cancel'
                }).then(function(result) {
                    if(result.value)
                    {
                        $.ajax({
                            type: "POST",
                            url: "editOfficialReceipt",
                            data: confirmORForm,
                            enctype: "multipart/form-data",
                            processData: false,
                            contentType: false,
                            success: function (response) {
                                swal({
                                    type: 'success',
                                    title: 'DONE!.',
                                    text: 'Succesfully Processed',
                                    confirmButtonText: 'OK'
                                }).then(function(result) {
                                    if(result.value)
                                    {
                                        window.location.replace("RPTTaxBillList.jsp");
                                        //$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
                                        //window.location.replace("BPLSORf.jsp"+oRX);
                                    }
                                })
                                ;

                            }
                        });
                    }
                    else
                    if (result.dismiss === swal.DismissReason.cancel) {
                        swalWithBootstrapButtons(
                            'Cancelled',
                            'Operation Halted',
                            'error'
                        )

                    }
                });
            });

        });
    </script>
</body>
<%}catch (Exception e){
    e.printStackTrace();
}%>
</html>