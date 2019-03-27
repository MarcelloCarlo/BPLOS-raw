<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/10/2018
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%
    if(session.getAttribute("empname") == null || session.getAttribute("empid") == null){
        response.sendRedirect("PAEISLogin.jsp");
    }
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if !IE]><!-->

<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <meta HTTP-EQUIV="Pragma" content="no-cache"/>
    <meta HTTP-EQUIV="Expires" content="-1"/>
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link rel="icon" href="extras/logo1.png">
    <title>Revenue | Dashboard</title>
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
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/jquery-jvectormap/jquery-jvectormap.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet"/>
    <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <script src="extras/highcharts/code/highcharts.js"></script>
    <script src="extras/highcharts/code/modules/data.js"></script>
    <script src="extras/highcharts/code/modules/drilldown.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>

<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="REVDashboardComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li><a href="javascript:;">Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Dashboard</h1>
        <!-- end page-header -->

        <!-- begin row -->
        <div class="row">
            <!-- begin col-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="widget widget-stats bg-purple">
                    <div class="stats-icon"><i class="fa fa-file"></i></div>
                    <div class="stats-info">
                        <div><p>Business Permit</p></div>
                        <div>
                            <h4>Pending:
                                <%

                                    LGUConnect con = new LGUConnect();
                                    Connection con1 = con.getConnection();
                                    Statement aa = con1.createStatement();
                                    ResultSet ss = aa.executeQuery("SELECT COUNT(*) AS C FROM `bpls_t_bp_application` WHERE NOT (AP_STATUS = 'Success' OR AP_STATUS = 'Terminated')");
                                    while (ss.next()) {
                                        out.print(ss.getString("C"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>Released:
                                <%

                                    LGUConnect conn = new LGUConnect();
                                    Connection con2 = conn.getConnection();
                                    Statement bb = con2.createStatement();
                                    ResultSet tt = bb.executeQuery("SELECT COUNT(*) AS A FROM `bpls_t_bp_application` WHERE AP_STATUS = 'Success' ");
                                    while (tt.next()) {
                                        out.print(tt.getString("A"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>Renewed Permit:
                                <%

                                    LGUConnect cont = new LGUConnect();
                                    Connection con12 = cont.getConnection();
                                    Statement ml = con12.createStatement();
                                    ResultSet kk = ml.executeQuery("SELECT COUNT(*) AS A FROM `bpls_t_bp_application` WHERE AP_TYPE = 'Renew' ");
                                    while (kk.next()) {
                                        out.print(kk.getString("A"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>Terminated:
                                <%

                                    LGUConnect conm = new LGUConnect();
                                    Connection con3 = conm.getConnection();
                                    Statement cc = con3.createStatement();
                                    ResultSet uu = cc.executeQuery("SELECT COUNT(*) AS B FROM `bpls_t_bp_application` WHERE AP_STATUS = 'Terminated' ");
                                    while (uu.next()) {
                                        out.print(uu.getString("B"));
                                    }
                                %>
                            </h4>
                        </div>
                    </div>
                   <div class="stats-link">
                        <a href="REVBplsDtl.jsp">View Revenue Details <i class="fa fa-arrow-circle-o-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="widget widget-stats bg-purple">
                    <div class="stats-icon"><i class="fa fa-motorcycle"></i></div>
                    <div class="stats-info">
                        <div>
                            <p>MTOPS</p>
                        </div>
                        <div>
                            <h4>Pending:
                                <%

                                    LGUConnect conl = new LGUConnect();
                                    Connection con4 = conl.getConnection();
                                    Statement dd = con4.createStatement();
                                    ResultSet vv = dd.executeQuery("SELECT COUNT(*) AS D FROM `mtops_t_application_frm` WHERE NOT (APF_STATUS = 'Done' OR APF_STATUS = 'Terminated') ");
                                    while (vv.next()) {
                                        out.print(vv.getString("D"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>Released:
                                <%

                                    LGUConnect cono = new LGUConnect();
                                    Connection con5 = cono.getConnection();
                                    Statement ee = con5.createStatement();
                                    ResultSet ww = ee.executeQuery("SELECT COUNT(*) AS E FROM `mtops_t_application_frm` WHERE APF_STATUS = 'Done'");
                                    while (ww.next()) {
                                        out.print(ww.getString("E"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>Terminated:
                                <%

                                    LGUConnect conp = new LGUConnect();
                                    Connection con6 = conp.getConnection();
                                    Statement ff = con6.createStatement();
                                    ResultSet xx = ff.executeQuery("SELECT COUNT(*) AS F FROM `mtops_t_application_frm` WHERE APF_STATUS = 'Terminated' ");
                                    while (xx.next()) {
                                        out.print(xx.getString("F"));
                                    }
                                %>
                            </h4>
                        </div>
                    </div>
                  <div class="stats-link">
                        <a href="REVMtopsDtl.jsp">View Revenue Details <i class="fa fa-arrow-circle-o-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
        <div class="col-md-3 col-sm-6">
                <div class="widget widget-stats bg-purple">
                    <div class="stats-icon"><i class="fa fa-building"></i></div>
                    <div class="stats-info">
                        <div>
                            <p>RPTS</p>
                        </div>
                        <div>
                            <h4>Pending:
                                <%

                                    LGUConnect conq = new LGUConnect();
                                    Connection con7 = conq.getConnection();
                                    Statement gg = con7.createStatement();
                                    ResultSet yy = gg.executeQuery("SELECT SUM(OR_TOTAL_AMOUNT) AS G FROM `bpls_t_official_receipt`");
                                    while (yy.next()) {
                                        out.print(yy.getString("G"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>Released:
                                <%

                                    LGUConnect conq = new LGUConnect();
                                    Connection con7 = conq.getConnection();
                                    Statement gg = con7.createStatement();
                                    ResultSet yy = gg.executeQuery("SELECT SUM(OR_TOTAL_AMOUNT) AS G FROM `bpls_t_official_receipt`");
                                    while (yy.next()) {
                                        out.print(yy.getString("G"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>Terminated:
                                <%

                                    LGUConnect conq = new LGUConnect();
                                    Connection con7 = conq.getConnection();
                                    Statement gg = con7.createStatement();
                                    ResultSet yy = gg.executeQuery("SELECT SUM(OR_TOTAL_AMOUNT) AS G FROM `bpls_t_official_receipt`");
                                    while (yy.next()) {
                                        out.print(yy.getString("G"));
                                    }
                                %>
                            </h4>
                        </div>
                    </div>
                   <div class="stats-link">
                        <a href="REVRptDtl.jsp">View Revenue Details <i class="fa fa-arrow-circle-o-right"></i></a>
                   </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="widget widget-stats bg-purple">
                    <div class="stats-icon"><i class="fa fa-money"></i></div>
                    <div class="stats-info">
                        <div><p>Revenue</p></div>
                        <div>
                            <h4>BPLS:
                                <%

                                    LGUConnect conq = new LGUConnect();
                                    Connection con7 = conq.getConnection();
                                    Statement gg = con7.createStatement();
                                    ResultSet yy = gg.executeQuery("SELECT SUM(OR_TOTAL_AMOUNT) AS G FROM `bpls_t_official_receipt`");
                                    while (yy.next()) {
                                        out.print(yy.getString("G"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>MTOPS:
                                <%

                                    LGUConnect conr = new LGUConnect();
                                    Connection con8 = conr.getConnection();
                                    Statement hh = con8.createStatement();
                                    ResultSet zz = hh.executeQuery("SELECT SUM(OR_TOTAL_AMOUNT) AS H FROM `mtops_t_official_receipt`");
                                    while (zz.next()) {
                                        out.print(zz.getString("H"));
                                    }
                                %>
                            </h4>
                        </div>
                        <div>
                            <h4>RPTS:
                                <%

                                    LGUConnect cons = new LGUConnect();
                                    Connection con9 = cons.getConnection();
                                    Statement ii = con9.createStatement();
                                    ResultSet jj = ii.executeQuery("SELECT SUM(OR_TOTAL_AMOUNT) AS I FROM `mtops_t_official_receipt`");
                                    while (jj.next()) {
                                        out.print(jj.getString("I"));
                                    }
                                %>

                            </h4>
                        </div>
                    </div>
                   <div class="stats-link">
                        <a href="javascript:;">View Revenue Details <i class="fa fa-arrow-circle-o-right"></i></a>
                   </div>
                </div>
            </div>
            <!-- end col-3 -->
            <div class="col-md-12">  <div class="panel-body">
                <div id="lgu_rev" class="col-md-12"></div>
            </div></div>
            <div class="col-md-12">  <div class="panel-body">
                <div id="bpls" class="col-md-12"></div>
            </div></div>
            <div class="col-md-12">  <div class="panel-body">
                <div id="mtops" class="col-md-12"></div>
            </div></div>
            <div class="col-md-12">  <div class="panel-body">
                <div id="rpt" class="col-md-12"></div>
            </div></div>
        </div>
        <!-- end row -->

    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<!-- end page container -->


<jsp:include page="REVDashboardFooter.jsp"></jsp:include>

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
<script src="assets/plugins/flot/jquery.flot.min.js"></script>
<script src="assets/plugins/flot/jquery.flot.time.min.js"></script>
<script src="assets/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="assets/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="assets/plugins/sparkline/jquery.sparkline.js"></script>
<script src="assets/plugins/jquery-jvectormap/jquery-jvectormap.min.js"></script>
<script src="assets/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/js/dashboard.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/js/apps.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();
        Dashboard.init();
    });
</script>
<script type="text/javascript">
	var defaultTitle = "Annual Revenue";
	var drilldownTitle = "Monthly Revenue as of ";

	// Create the chart
	var chart = Highcharts.chart('lgu_rev', {
		chart: {
			type: 'column',
			events: {
				drilldown: function (e) {
					chart.setTitle({
						text: drilldownTitle + e.point.name
					});
				},
				drillup: function (e) {
					chart.setTitle({
						text: defaultTitle
					});
				}
			}
		},
		title: {
			text: defaultTitle
		},
		subtitle: {
			text: 'Click the point to show the monthly revenue of the selected year.'
		},
		xAxis: {
			type: 'category'
		},
		yAxis: {
			title: {
				text: 'Total Revenue (PHP)'
			}

		},
		legend: {
			enabled: false
		},
		plotOptions: {
			series: {
				borderWidth: 0,
				dataLabels: {
					enabled: true,
					format: 'PHP {point.y:.2f}'
				}
			}
		},

		tooltip: {
			headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
			pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>PHP {point.y:.2f}</b> of total<br/>'
		},

		"series": [
			{
				"name": "Current Total Revenue",
				"colorByPoint": false,
				"data": [<% try {
    LGUConnect chartDb = new LGUConnect();
    Connection chartConn = chartDb.getConnection();
    Statement chartStmt = chartConn.createStatement();
    ResultSet chartResult = chartStmt.executeQuery("SELECT YR,SUM(AMT), CONCAT('{name:''',YR, ''',y:', SUM(AMT),',drilldown:''', YR,'''}') AS YRREV FROM ((SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM bpls_t_official_receipt BP UNION ALL SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM mtops_t_official_receipt MT) AS CX) GROUP BY YR");
    while(chartResult.next()){%><%out.print(chartResult.getString("YRREV"));%>, <%
                }

            } catch (Exception e) {
                out.print(e);
            }%>]
			}

		]
		, "drilldown": {
			"series": [
				<% try {
    LGUConnect chartDb = new LGUConnect();
    Connection chartConn = chartDb.getConnection();
    Statement chartStmt = chartConn.createStatement();
    ResultSet chartResult = chartStmt.executeQuery("(SELECT CONCAT('{name:''',YEARS, ''',id:', '''', YEARS, ''',data:[', GROUP_CONCAT(PERMONTH), ']}') AS YRDRILLDN FROM (SELECT concat('[''', MONTHS, ''',', SUM(TOTAL), ']') AS PERMONTH,YEARS,Module FROM(SELECT YEAR(BP.OR_DATE) AS YEARS,MONTHNAME(BP.OR_DATE) AS MONTHS,SUM(BP.OR_TOTAL_AMOUNT) AS TOTAL,'BPLS' AS Module FROM bpls_t_official_receipt BP GROUP BY MONTH(OR_DATE) UNION ALL SELECT YEAR(MT.OR_DATE) AS YEARS,MONTHNAME(MT.OR_DATE) AS MONTHS,SUM(MT.OR_TOTAL_AMOUNT) AS TOTAL,'MTOPS' AS Module FROM mtops_t_official_receipt MT GROUP BY MONTH(OR_DATE)) AS X GROUP BY MONTHS ORDER BY MONTHS) AS V GROUP BY YEARS ORDER BY YEARS)");
    while(chartResult.next()){%> <%out.print(chartResult.getString("YRDRILLDN"));%>, <%
                }

            } catch (Exception e) {
                out.print(e);
            }%>
			]
		}
	});
</script>
<script type="text/javascript">
    var defaultTitle = "BPLS";
    var drilldownTitle = "Business Permits";

    // Create the chart
    var chart = Highcharts.chart('bpls', {
        chart: {
            type: 'pie',
            events: {
                drilldown: function (e) {
                    chart.setTitle({
                        text: drilldownTitle + e.point.name
                    });
                },
                drillup: function (e) {
                    chart.setTitle({
                        text: defaultTitle
                    });
                }
            }
        },
        title: {
            text: defaultTitle
        },
        subtitle: {
            text: 'Click the point to show the monthly revenue of the selected year.'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'Total Revenue (PHP)'
            }

        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: 'PHP {point.y:.2f}'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>PHP {point.y:.2f}</b> of total<br/>'
        },

        "series": [
            {
                "name": "Current Total Revenue",
                "colorByPoint": false,
                "data": [<% try {
    LGUConnect chartDb = new LGUConnect();
    Connection chartConn = chartDb.getConnection();
    Statement chartStmt = chartConn.createStatement();
    ResultSet chartResult = chartStmt.executeQuery("SELECT YR,SUM(AMT), CONCAT('{name:''',YR, ''',y:', SUM(AMT),',drilldown:''', YR,'''}') AS YRREV FROM ((SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM bpls_t_official_receipt BP UNION ALL SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM mtops_t_official_receipt MT) AS CX) GROUP BY YR");
    while(chartResult.next()){%><%out.print(chartResult.getString("YRREV"));%>, <%
                }

            } catch (Exception e) {
                out.print(e);
            }%>]
            }

        ]
        , "drilldown": {
            "series": [
                <% try {
    LGUConnect chartDb = new LGUConnect();
    Connection chartConn = chartDb.getConnection();
    Statement chartStmt = chartConn.createStatement();
    ResultSet chartResult = chartStmt.executeQuery("(SELECT CONCAT('{name:''',YEARS, ''',id:', '''', YEARS, ''',data:[', GROUP_CONCAT(PERMONTH), ']}') AS YRDRILLDN FROM (SELECT concat('[''', MONTHS, ''',', SUM(TOTAL), ']') AS PERMONTH,YEARS,Module FROM(SELECT YEAR(BP.OR_DATE) AS YEARS,MONTHNAME(BP.OR_DATE) AS MONTHS,SUM(BP.OR_TOTAL_AMOUNT) AS TOTAL,'BPLS' AS Module FROM bpls_t_official_receipt BP GROUP BY MONTH(OR_DATE) UNION ALL SELECT YEAR(MT.OR_DATE) AS YEARS,MONTHNAME(MT.OR_DATE) AS MONTHS,SUM(MT.OR_TOTAL_AMOUNT) AS TOTAL,'MTOPS' AS Module FROM mtops_t_official_receipt MT GROUP BY MONTH(OR_DATE)) AS X GROUP BY MONTHS ORDER BY MONTHS) AS V GROUP BY YEARS ORDER BY YEARS)");
    while(chartResult.next()){%> <%out.print(chartResult.getString("YRDRILLDN"));%>, <%
                }

            } catch (Exception e) {
                out.print(e);
            }%>
            ]
        }
    });
</script>
<script type="text/javascript">
    var defaultTitle = "Annual Revenue";
    var drilldownTitle = "Monthly Revenue as of ";

    // Create the chart
    var chart = Highcharts.chart('mtops', {
        chart: {
            type: 'pie',
            events: {
                drilldown: function (e) {
                    chart.setTitle({
                        text: drilldownTitle + e.point.name
                    });
                },
                drillup: function (e) {
                    chart.setTitle({
                        text: defaultTitle
                    });
                }
            }
        },
        title: {
            text: defaultTitle
        },
        subtitle: {
            text: 'Click the point to show the monthly revenue of the selected year.'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'Total Revenue (PHP)'
            }

        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: 'PHP {point.y:.2f}'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>PHP {point.y:.2f}</b> of total<br/>'
        },

        "series": [
            {
                "name": "Current Total Revenue",
                "colorByPoint": false,
                "data": [<% try {
    LGUConnect chartDb = new LGUConnect();
    Connection chartConn = chartDb.getConnection();
    Statement chartStmt = chartConn.createStatement();
    ResultSet chartResult = chartStmt.executeQuery("SELECT YR,SUM(AMT), CONCAT('{name:''',YR, ''',y:', SUM(AMT),',drilldown:''', YR,'''}') AS YRREV FROM ((SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM bpls_t_official_receipt BP UNION ALL SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM mtops_t_official_receipt MT) AS CX) GROUP BY YR");
    while(chartResult.next()){%><%out.print(chartResult.getString("YRREV"));%>, <%
                }

            } catch (Exception e) {
                out.print(e);
            }%>]
            }

        ]
        , "drilldown": {
            "series": [
                <% try {
    LGUConnect chartDb = new LGUConnect();
    Connection chartConn = chartDb.getConnection();
    Statement chartStmt = chartConn.createStatement();
    ResultSet chartResult = chartStmt.executeQuery("(SELECT CONCAT('{name:''',YEARS, ''',id:', '''', YEARS, ''',data:[', GROUP_CONCAT(PERMONTH), ']}') AS YRDRILLDN FROM (SELECT concat('[''', MONTHS, ''',', SUM(TOTAL), ']') AS PERMONTH,YEARS,Module FROM(SELECT YEAR(BP.OR_DATE) AS YEARS,MONTHNAME(BP.OR_DATE) AS MONTHS,SUM(BP.OR_TOTAL_AMOUNT) AS TOTAL,'BPLS' AS Module FROM bpls_t_official_receipt BP GROUP BY MONTH(OR_DATE) UNION ALL SELECT YEAR(MT.OR_DATE) AS YEARS,MONTHNAME(MT.OR_DATE) AS MONTHS,SUM(MT.OR_TOTAL_AMOUNT) AS TOTAL,'MTOPS' AS Module FROM mtops_t_official_receipt MT GROUP BY MONTH(OR_DATE)) AS X GROUP BY MONTHS ORDER BY MONTHS) AS V GROUP BY YEARS ORDER BY YEARS)");
    while(chartResult.next()){%> <%out.print(chartResult.getString("YRDRILLDN"));%>, <%
                }

            } catch (Exception e) {
                out.print(e);
            }%>
            ]
        }
    });
</script>
<script type="text/javascript">
    var defaultTitle = "Annual Revenue";
    var drilldownTitle = "Monthly Revenue as of ";

    // Create the chart
    var chart = Highcharts.chart('rpt', {
        chart: {
            type: 'pie',
            events: {
                drilldown: function (e) {
                    chart.setTitle({
                        text: drilldownTitle + e.point.name
                    });
                },
                drillup: function (e) {
                    chart.setTitle({
                        text: defaultTitle
                    });
                }
            }
        },
        title: {
            text: defaultTitle
        },
        subtitle: {
            text: 'Click the point to show the monthly revenue of the selected year.'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'Total Revenue (PHP)'
            }

        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: 'PHP {point.y:.2f}'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>PHP {point.y:.2f}</b> of total<br/>'
        },

        "series": [
            {
                "name": "Current Total Revenue",
                "colorByPoint": false,
                "data": [<% try {
    LGUConnect chartDb = new LGUConnect();
    Connection chartConn = chartDb.getConnection();
    Statement chartStmt = chartConn.createStatement();
    ResultSet chartResult = chartStmt.executeQuery("SELECT YR,SUM(AMT), CONCAT('{name:''',YR, ''',y:', SUM(AMT),',drilldown:''', YR,'''}') AS YRREV FROM ((SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM bpls_t_official_receipt BP UNION ALL SELECT YEAR(OR_DATE) AS YR,OR_TOTAL_AMOUNT AS AMT FROM mtops_t_official_receipt MT) AS CX) GROUP BY YR");
    while(chartResult.next()){%><%out.print(chartResult.getString("YRREV"));%>, <%
                }

            } catch (Exception e) {
                out.print(e);
            }%>]
            }

        ]
        , "drilldown": {
            "series": [
                <% try {
    LGUConnect chartDb = new LGUConnect();
    Connection chartConn = chartDb.getConnection();
    Statement chartStmt = chartConn.createStatement();
    ResultSet chartResult = chartStmt.executeQuery("(SELECT CONCAT('{name:''',YEARS, ''',id:', '''', YEARS, ''',data:[', GROUP_CONCAT(PERMONTH), ']}') AS YRDRILLDN FROM (SELECT concat('[''', MONTHS, ''',', SUM(TOTAL), ']') AS PERMONTH,YEARS,Module FROM(SELECT YEAR(BP.OR_DATE) AS YEARS,MONTHNAME(BP.OR_DATE) AS MONTHS,SUM(BP.OR_TOTAL_AMOUNT) AS TOTAL,'BPLS' AS Module FROM bpls_t_official_receipt BP GROUP BY MONTH(OR_DATE) UNION ALL SELECT YEAR(MT.OR_DATE) AS YEARS,MONTHNAME(MT.OR_DATE) AS MONTHS,SUM(MT.OR_TOTAL_AMOUNT) AS TOTAL,'MTOPS' AS Module FROM mtops_t_official_receipt MT GROUP BY MONTH(OR_DATE)) AS X GROUP BY MONTHS ORDER BY MONTHS) AS V GROUP BY YEARS ORDER BY YEARS)");
    while(chartResult.next()){%> <%out.print(chartResult.getString("YRDRILLDN"));%>, <%
                }

            } catch (Exception e) {
                out.print(e);
            }%>
            ]
        }
    });
</script>
</body>
</html>