<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 1/31/2019
  Time: 1:24 AM
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
    <title>RPT | Tax Declaration</title>
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
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<%
    String getAssVal = "",assLvlId = "";
    String rplId = request.getParameter("rplId");
    try{
    LGUConnect connect = new LGUConnect();
    Connection connection = connect.getConnection();
    PreparedStatement getLandInfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_t_rp_land RPL JOIN rpt_t_rp_owner rtro on RPL.RPO_ID = rtro.RPO_ID JOIN rpt_r_actual_use rrau on RPL.AU_ID = rrau.AU_ID JOIN rpt_r_property_type rrpt on RPL.PT_ID = rrpt.PT_ID JOIN rpt_r_property_class rrpc on RPL.PC_ID = rrpc.PC_ID where RPL_ID = ?");
    getLandInfo.setInt(1, Integer.parseInt(rplId));
    ResultSet resultSet = getLandInfo.executeQuery();
%>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="RPTComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <%while (resultSet.next()){
        PreparedStatement getAsslvl = (PreparedStatement) connection.prepareStatement("SELECT * FROM rpt_r_assessment_lvl WHERE PT_ID = ? AND PC_ID = ? GROUP BY AL_ID");
        getAsslvl.setInt(1, Integer.parseInt(resultSet.getString("RPL.PT_ID")));
        getAsslvl.setInt(2,Integer.parseInt(resultSet.getString("RPL.PC_ID")));
        ResultSet resultSet1 = getAsslvl.executeQuery();
        while (resultSet1.next()){
            getAssVal = resultSet1.getString("AL_VAL");
            assLvlId = resultSet1.getString("AL_ID");
        }
    %>
    <div id="content" class="content">
        <div class="row">
            <!-- begin col-12 -->
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                        </div>
                        <h4 class="panel-title">Tax Declaration</h4>
                    </div>
                    <div class="panel-body">
                        <form enctype="multipart/form-data" name="assessRPTForm" id="assessRPTForm">
                            <input class="hidden" type="hidden" name="RPL_ID" value='<%=resultSet.getString("RPL.RPL_ID")%>'>
                            <input class="hidden" type="hidden" name="PT_ID" value='<%=resultSet.getString("rrpt.PT_ID")%>'>
                            <input class="hidden" type="hidden" name="PC_ID" value='<%=resultSet.getString("rrpc.PC_ID")%>'>
                            <input class="hidden" type="hidden" name="AU_ID" value='<%=resultSet.getString("rrau.AU_ID")%>'>
                            <input class="hidden" type="hidden" name="AL_ID" value='<%=assLvlId%>'>
                            <input class="hidden" type="hidden" name="EP_ID" value='<%=session.getAttribute("empid")%>'>
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Property Index Number</label>
                                            <input type="text" name="pin" placeholder="PIN"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_PIN")%>'/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>First Name</label>
                                            <input type="text" name="survey" placeholder=""
                                                   class="form-control" disabled value='<%=resultSet.getString("RPO_FNAME")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Middle Name</label>
                                            <input type="text" name="lot" placeholder=""
                                                   class="form-control" disabled value='<%=resultSet.getString("RPO_MNAME")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input type="text" name="blk" placeholder=""
                                                   class="form-control" disabled value='<%=resultSet.getString("RPO_SNAME")%>'/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" name="owner" placeholder="Owner"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPO_EMAIL")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Tel No</label>
                                            <input type="text" name="ownertel"
                                                   placeholder="Tel No:"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPO_CONT")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>TIN</label>
                                            <input type="text" name="ownertin"
                                                   placeholder="TIN"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPO_TIN")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" name="owneradd" placeholder="Address"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPO_ADDR")%>'/>
                                        </div>
                                    </div>

                                </div>

                                <h4 class="pull-left width-full">Property Location</h4>
                                <!-- begin row -->
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>No./Street</label>
                                            <input type="text" name="nostreet" placeholder="No./Street"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_L_STREET")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Brgy/District</label>
                                            <input type="text" name="brgydis"
                                                   placeholder="Brgy/District"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_L_BRGY")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Municipality</label>
                                            <input type="text" name="munic"
                                                   placeholder="Municipality"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_L_DIST_MUNI")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Province/City</label>
                                            <input type="text" name="procit" placeholder="Province/City"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_L_CITY_PROV")%>'/>
                                        </div>
                                    </div>

                                </div>

                                <h4 class="pull-left width-full">Property Boundaries</h4>

                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>North</label>
                                            <input type="text" name="north" placeholder="North"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_B_NORTH")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>East</label>
                                            <input type="text" name="east" placeholder="East"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_B_EAST")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>South</label>
                                            <input type="text" name="south" placeholder="South"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_B_SOUTH")%>'/>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>West</label>
                                            <input type="text" name="west" placeholder="West"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_B_WEST")%>'/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Area</label>
                                            <input type="text" name="west" placeholder="West"
                                                   class="form-control" disabled value='<%=resultSet.getString("RPL_AREA")%>'/>
                                        </div>
                                    </div>

                                </div>

                                <h4 class="pull-left width-full">Kind of Property Assessed</h4>

                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <label></label>
                                            <select name="optAssessType" class="form-control" data-style="btn-white"
                                                    tabindex="-1">
                                                <option value="TX">Taxable</option>
                                                <option value="EX">Exempt</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <hr>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Property Class</label>
                                            <div class="controls">
                                                <input type="text" name="pprtyclss" placeholder="Property Class"
                                                       class="form-control" disabled value='<%=resultSet.getString("PC_DESC")%>'/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Actual Use</label>
                                            <div class="controls">
                                                <input type="text" name="actluse"
                                                       placeholder="Actual Use"
                                                       class="form-control" disabled value='<%=resultSet.getString("AU_DESC")%>' />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Market Value (PHP)</label>
                                            <div class="controls">
                                                <input type="text" name="marketVal" id="marketVal" placeholder="Market Value"
                                                       class="form-control" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Assessment Level (%)</label>
                                            <div class="controls">
                                                <input type="text" name="assessLvlPerc" id="assessLvlPerc"
                                                       placeholder="Assessment Level"
                                                       class="form-control" disabled value='<%=Float.parseFloat(getAssVal) * 100%>'/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Assessed Value (PHP)</label>
                                            <div class="controls">
                                                <input type="text" name="assessVal" id="assessVal"
                                                       class="form-control disabled" />
                                            </div>

                                                <input type="hidden" name="assessValX" id="assessValX"
                                                       class="hidden" />
                                        </div>
                                    </div>
                                </div>


                                <br>

                            </fieldset>
                            <button class="btn btn-sm btn-white" onclick="goBack()">Close</button>
                            <button type="button" id="btnAssessRPT" class="btn btn-sm btn-success">Process
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%}%>
    <!-- end #content -->
    <!-- #modal-assess -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<jsp:include page="RPTFooter.jsp"></jsp:include>

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
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();

        $("#assessVal").attr('disabled', true);
        var sum = parseFloat(<%=getAssVal%>);
        var blank = 0.00;
//iterate through each td based on class and add the values
        $(".amt").each(function () {

            //add only if the value is number
            if (!isNaN($(this).text()) /*&& $(this).value.length!=0*/) {
                sum += parseFloat($(this).text());
            } else {sum = 0.00;}
            console.log($(this).text());
            $("#tdPerm").text($(this).text());
        });
        $("#lblTotal").text(parseFloat(sum).toFixed(2));
        $("#totalAmt").val(parseFloat(sum).toFixed(2));
        $("#marketVal").keyup( function () {
	        if (isNaN($(this).val()) ||  $(this).val().length === 0){
		        $("#assessVal").val(0.00);
		        $("#assessValX").val(0.00);
	        } else {
		        $("#assessVal").val(parseFloat(parseFloat($(this).val()).toFixed(2) * parseFloat(sum).toFixed(2)).toFixed(2));
		        $("#assessValX").val(parseFloat(parseFloat($(this).val()).toFixed(2) * parseFloat(sum).toFixed(2)).toFixed(2));
            }
        });


        $("#btnAssessRPT").click(function () {
            var assessRPTForm = new FormData($('#assessRPTForm')[0]);
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
                        url: "insertAssessRPT",
                        data: assessRPTForm,
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
                                    window.location.replace("RPTPrprty.jsp");
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