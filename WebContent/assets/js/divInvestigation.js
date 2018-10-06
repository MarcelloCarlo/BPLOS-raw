$(document).ready(function () {

    App.init();
    TableManageResponsive.init();
    $("#numMonths").prop('disabled', true);
    "use strict";
    $("#numMonths").mask("99");

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

    $("#chkRectify").change(function () {
        if (this.checked){
            $("#numMonths").prop('disabled', false);
            $("#numMonths").prop('required', true);
        } else {
            $("#numMonths").prop('disabled', true);
            $("#numMonths").prop('required', false);
        }
    });

    $('.investigation-modal-new').on('hidden.bs.modal', function () {
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
        $("#chkRectify").prop("checked", false);
        $("#numMonths").prop('disabled', true);
        $("#txtMISC_REMARKS").value = "";
        $("#numMonths").val("");
    });

    $("#btnInvNewAppl").click(function () {
        if($("#chkZONING_INS").is(':checked') && $("#chkFIRE_INS").is(':checked') && $("#chkHS_INS").is(':checked') && $("#chkBLDG_INS").is(':checked') && $("#chkLABOR_INS").is(':checked') && $("#chkMISC_INS").is(':checked') && !$("#chkRectify").is(':checked') ){
            //Assessment
            // noinspection BadExpressionStatementJS
            swal({
                title: "Continue Assessment?",
                text: "You will save your current changes",
                type: "warning",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if(result.value)
            {
                $("#chkZONING_INS").attr("disabled", false);
                $("#chkFIRE_INS").attr("disabled", false);
                $("#chkHS_INS").attr("disabled", false);
                $("#chkBLDG_INS").attr("disabled", false);
                $("#chkLABOR_INS").attr("disabled", false);
                $("#chkMISC_INS").attr("disabled", false);
                var datanewAsInvApplForm = new FormData($('#newInvApplForm')[0]); //working method
                $.ajax({
                    type: "POST",
                    url: "updateNewAppInvestigationForm",
                    enctype:"multipart/form-data",
                    data: datanewAsInvApplForm,
                    processData: false,
                    contentType: false,
                    success: function () {
                        $("#chkZONING_INS").attr("disabled", true);
                        $("#chkFIRE_INS").attr("disabled", true);
                        $("#chkHS_INS").attr("disabled", true);
                        $("#chkBLDG_INS").attr("disabled", true);
                        $("#chkLABOR_INS").attr("disabled", false);
                        $("#chkMISC_INS").attr("disabled", false);
                        // noinspection BadExpressionStatementJS
                        swal({
                            type: 'success',
                            title: 'DONE!.',
                            text: 'Succesfully Investigated',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if(result.value){
                            location.reload(true);
                        }
                    });
                    },
                    error: function () {
                        swal("error", "The process encountered and error. Try again or contact your system administrator", "error");
                    }
                });
            }
        });
        }else if ( $("#chkRectify").is(':checked') && $("#numMonths").val()!==""){
            //Rectify
            // noinspection BadExpressionStatementJS
            swal({
                title: "Request Rectification?",
                text: "You will save your current changes",
                type: "warning",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if(result.value)
            {
                var datanewRcInvApplForm = new FormData($('#newInvApplForm')[0]); //working method
                $.ajax({
                    type: "POST",
                    url: "updateNewAppInvestigationForm",
                    data: datanewRcInvApplForm,
                    enctype:"multipart/form-data",
                    processData: false,
                    contentType: false,
                    success: function () {
                        // noinspection BadExpressionStatementJS
                        swal({
                            type: 'success',
                            title: 'DONE!.',
                            text: 'Rectification Sent!',
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

        } else{
            //Terminate
            $(".investigation-modal-terminate").modal('toggle');
            $("#tRefNo").append($("#_AP_REFERENCE_NO").val().trim());
            $("#tRefNoh").val($("#_AP_REFERENCE_NO").val().trim());
            $("#tBussName").append($("#nBussName").text().trim());
            $("#tBussNature").append($("#nBussNature").text().trim());
            $("#tBussAuthRepName").append($("#nBussAuthRepName").text().trim());
            $("#tBussOwner").append($("#nBussOwner").text().trim());
            $(".investigation-modal-new").modal('toggle');
        }

        $(".investigation-modal-terminate").on('hidden.bs.modal', function () {
            $("#tRefNo").val("");
            $("#tRefNoh").val("");
            $("#tBussName").val("");
            $("#tBussNature").val("");
            $("#tBussAuthRepName").val("");
            $("#tBussOwner").val("");
            $("#txtRemarks").val("");
        });
    });
});
