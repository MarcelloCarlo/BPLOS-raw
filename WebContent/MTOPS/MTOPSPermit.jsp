<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 2/1/2019
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<% LGUConnect conX = new LGUConnect();
    try {
        Connection connection = conX.getConnection();
        String perIdNo = request.getParameter("perIdNo");
        PreparedStatement getPermit = connection.prepareStatement("SELECT * FROM mtops_t_permit PER JOIN mtops_t_application_frm APF ON PER.APF_ID = APF.APF_ID JOIN mtops_t_official_receipt OFR ON APF.APF_ID = OFR.APF_ID JOIN mtops_r_toda TD ON APF.TODA = TD.TODA_ID WHERE PER.PERMIT_ID = ?");
        getPermit.setInt(1, Integer.parseInt(perIdNo));
        ResultSet permRs = getPermit.executeQuery();
        while (permRs.next()) {

%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <link rel="icon" href="extras/logo1.png">
    <title>PAEIS | MTOPS Permit</title>
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
<body>

<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="page-without-sidebar ">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin page-header -->
        <div>
            <h1 class="page-header hidden-print">MTOPS Permit</h1>
            <span class="hidden-print">
                <a href="javascript:" onclick="window.print()" class="btn btn-sm btn-success m-b-10"><i
                        class="fa fa-print m-r-5"></i> Print</a>
            </span>
        </div>

        <!-- begin invoice -->
       <div class="col-md-4 col-md-offset-4">
           <div class="invoice">
               <div class="invoice-company">

               </div>


               <div class="invoice-content">
                   <table class="col-sm-12" style="font-family: Arial; font-size: 10px;">
                       <thead>
                       <tr>

                           <center style="font-size: 12px; padding: 0px 0px 0px 0px;">
                               <p style="color: black;margin: 0"> Republic of the Philippines </p>
                               <p style="color: black;margin: 0"> National Capital Region  </p>
                               <strong style="color: black;margin: 0"> City of - Quezon City</strong>
                               <h3 style="color: black;margin: 0">OFFICE OF THE MAYOR</h3>
                               <h3 style="color: black;margin: 0">CITY TRICYCLE FRANCHISING & REGULATORY BOARD</h3>
                           </center>

                       </tr>
                       </thead>

                       <hr width="100%" >

                       <tbody class="container">
                       <tr>
                           <td class="col-sm-12">
                               <table class="col-sm-12">
                                   <tbody class="col-sm-12">
                                   <tr>
                                       <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: black;">
                                           <strong>MOTORIZED TRICYCLE</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: black;">
                                           <strong>OPERATOR'S PERMIT</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: center; color: black;">
                                           <strong>(MTOP) - 20xx-20xx</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: right; color: black;">
                                           as per Ord. No.: <label style="margin: 0"><%out.print(permRs.getString("OR_TW_CH_MO_NO"));%></label>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: right; color: black;">
                                           Date: <label  style="margin: 0"><%out.print(permRs.getString("PERMIT_DATE"));%></label>
                                       </td>
                                   </tr>
                                   </tbody>
                               </table>
                           </td>
                           <td class="col-sm-12" style="height: 50px; width: 50px; border: 1px; border-color: #0D3349; border-style: solid">
                           </td>
                       </tr>
                       <tr class="">
                              <td class="col-sm-6">
                                  <table style="margin: -1px 0px -1px -1px;" width="100%">
                                      <tbody>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              NAME OF OPERATOR
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              ADDRESS
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              MOTOR NUMBER
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              CHASSIS NUMBER
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              MAKE
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              PLATE NUMBER
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              MTOP NO.
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              PLACE OF OPERATION
                                          </td>
                                      </tr>
                                      </tbody>
                                  </table>
                              </td>
                              <td class="col-sm-6">
                                  <table class="width-100">
                                      <tbody>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              : <label style="margin: 0"><%out.print(permRs.getString("PERMIT_NO"));%></label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              : <label style="margin: 0"><%out.print(permRs.getString("APF_BRGY") +" " +permRs.getString("APF_CITY"));%></label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              : <label style="margin: 0"><%out.print(permRs.getString("MOTOR_NUMBER"));%></label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              : <label style="margin: 0"><%out.print(permRs.getString("CHASSIS_NUMBER"));%></label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              : <label style="margin: 0"><%out.print(permRs.getString("BIKE_NAME"));%></label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              : <label style="margin: 0"><%out.print(permRs.getString("PLATE_NUMBER"));%></label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              : <label style="margin: 0"><%out.print(permRs.getString("PERMIT_NO"));%></label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 100%; padding: 5px 0px 5px 15px; text-align: left; color: black;">
                                              : <label style="margin: 0"><%out.print(permRs.getString("TODA_NAME"));%></label>
                                          </td>
                                      </tr>
                                      </tbody>
                                  </table>
                              </td>
                       </tr>

                       </tbody>

                   </table>
                   <hr width="40%" align="left">
                   <hr>
                   <tr>
                       <p>OTHER NOTES</p>
                   </tr>
               </div>
               <!-- end invoice -->
           </div>
       </div>
        <!-- end #content -->

        <!-- begin scroll to top btn -->
        <a href="javascript:" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade"
           data-click="scroll-top"><i
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
</html>
<%
        }
        permRs.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>