$(document).ready(function () {

    App.init();
    TableManageResponsive.init();

    $(".newModal").click(function () {
        document.getElementById('nBussName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
        document.getElementById('nBussAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(8)").html();
        document.getElementById('nBussConTelno').innerHTML = $(this).closest("tbody tr").find("td:eq(9)").html();
        document.getElementById('nBussAuthRepName').innerHTML = $(this).closest("tbody tr").find("td:eq(10)").html();
        document.getElementById('nBussAuthRepAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(11)").html();
        //document.getElementById('AT_UNIFIED_FILE_NAME').innerHTML = $(this).closest("tbody tr").find("td:eq(13)").html();
        document.getElementById('nBussNature').innerHTML = $(this).closest("tbody tr").find("td:eq(12)").html();
        document.getElementById('_AP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(13)").html().trim();

        if ($(this).closest("tbody tr").find("td:eq(21)").text() === "null") {
            $("#txtMISC_REMARKS").value = 'None';
        } else {
            document.getElementById('txtMISC_REMARKS').value = $(this).closest("tbody tr").find("td:eq(21)").html().trim();
        }

        if ($(this).closest("tbody tr").find("td:eq(15)").text().trim() === "Pass") {
            $("#chkZONING_INS").prop("checked", true);
            $("#chkZONING_INS").attr("disabled", true);
        }
        if ($(this).closest("tbody tr").find("td:eq(16)").text().trim() === "Pass") {
            $("#chkFIRE_INS").prop("checked", true);
            $("#chkFIRE_INS").attr("disabled", true);
        }
        if ($(this).closest("tbody tr").find("td:eq(17)").text().trim() === "Pass") {
            $("#chkHS_INS").prop("checked", true);
            $("#chkHS_INS").attr("disabled", true);
        }
        if ($(this).closest("tbody tr").find("td:eq(18)").text().trim() === "Pass") {
            $("#chkBLDG_INS").prop("checked", true);
            $("#chkBLDG_INS").attr("disabled", true);
        }
        if ($(this).closest("tbody tr").find("td:eq(19)").text().trim() === "Pass") {
            $("#chkLABOR_INS").prop("checked", true);
            $("#chkLABOR_INS").attr("disabled", true);
        }
        if ($(this).closest("tbody tr").find("td:eq(20)").text().trim() === "Pass") {
            $("#chkMISC_INS").prop("checked", true);
            $("#chkMISC_INS").attr("disabled", true);
        }
    });


    $('#btnCloseNewApplModal').click(function () {
        $("#chkFIRE_INS").prop("checked", false);
        $("#chkHS_INS").prop("checked", false);
        $("#chkBLDG_INS").prop("checked", false);
        $("#chkLABOR_INS").prop("checked", false);
        $("#chkMISC_INS").prop("checked", false);
        $("#chkZONING_INS").prop("checked", false);
        $("#chkZONING_INS").attr("disabled", false);
        $("#chkFIRE_INS").attr("disabled", false);
        $("#chkHS_INS").attr("disabled", false);
        $("#chkBLDG_INS").attr("disabled", false);
        $("#chkLABOR_INS").attr("disabled", false);
        $("#chkMISC_INS").attr("disabled", false);
    });

    $('#closeNewPanelWindow').click(function () {
        $("#chkFIRE_INS").prop("checked", false);
        $("#chkHS_INS").prop("checked", false);
        $("#chkBLDG_INS").prop("checked", false);
        $("#chkLABOR_INS").prop("checked", false);
        $("#chkMISC_INS").prop("checked", false);
        $("#chkZONING_INS").prop("checked", false);
        $("#chkZONING_INS").attr("disabled", false);
        $("#chkFIRE_INS").attr("disabled", false);
        $("#chkHS_INS").attr("disabled", false);
        $("#chkBLDG_INS").attr("disabled", false);
        $("#chkLABOR_INS").attr("disabled", false);
        $("#chkMISC_INS").attr("disabled", false);
    });

    var click = $("#btnInvNewAppl").click(function () {
        // noinspection BadExpressionStatementJS
        swal({
            title: "Are you sure?",
            text: "You will save your current changes",
            type: "warning",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Confirm!",
            showCancelButton: true,
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if(result.value)
        {
            var datanewInsApplForm = new FormData($('#newInsApplForm')[0]); //working method
            $.ajax({
                type: "POST",
                url: "updateNewAppInspectionForm",
                data: datanewInsApplForm,
                processData: false,
                contentType: false,
                success: function () {
                    // noinspection BadExpressionStatementJS
                    swal({
                        type: 'success',
                        title: 'DONE!.',
                        text: 'Succesfully Evaluated',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if(result.value){
                        location.reload(true);
                    }
                });
                },
                error: function () {
                    swal("error", "The process encountered and error", "error");
                }
            });
        }
    });
    });
});
