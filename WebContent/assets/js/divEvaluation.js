$(document).ready(function () {
    App.init();
    TableManageResponsive.init();
    
    $(".renewModal").click(function () {
	    document.getElementById('rBussName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
	    document.getElementById('rBussAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(9)").html();
	    document.getElementById('nBussConTelno').innerHTML = $(this).closest("tbody tr").find("td:eq(10)").html();
	    document.getElementById('rBussAuthRepName').innerHTML = $(this).closest("tbody tr").find("td:eq(11)").html();
	    document.getElementById('rBussAuthRepAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(12)").html();
	    document.getElementById('AT_UNIFIED_FILE_NAMEr').innerHTML = $(this).closest("tbody tr").find("td:eq(13)").html();
	    document.getElementById('rBussNature').innerHTML = $(this).closest("tbody tr").find("td:eq(39)").html();
	    document.getElementById('_AT_IDr').value = $(this).closest("tbody tr").find("td:eq(14)").html().trim();
	    document.getElementById('_AP_IDr').value = $(this).closest("tbody tr").find("td:eq(15)").html().trim();
	    document.getElementById('_AP_REFERENCE_NOr').value = $(this).closest("tbody tr").find("td:eq(40)").html().trim();
	    document.getElementById('_BN_CLASSIFICATIONr').value = $(this).closest("tbody tr").find("td:eq(42)").html().trim();
    });

    $(".newModal").click(function () {
        document.getElementById('nBussName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
        document.getElementById('nBussAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(9)").html();
        document.getElementById('nBussConTelno').innerHTML = $(this).closest("tbody tr").find("td:eq(10)").html();
        document.getElementById('nBussAuthRepName').innerHTML = $(this).closest("tbody tr").find("td:eq(11)").html();
        document.getElementById('nBussAuthRepAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(12)").html();
        document.getElementById('AT_UNIFIED_FILE_NAME').innerHTML = $(this).closest("tbody tr").find("td:eq(13)").html();
        document.getElementById('nBussNature').innerHTML = $(this).closest("tbody tr").find("td:eq(39)").html();
        document.getElementById('_AT_ID').value = $(this).closest("tbody tr").find("td:eq(14)").html().trim();
        document.getElementById('_AP_ID').value = $(this).closest("tbody tr").find("td:eq(15)").html().trim();
        document.getElementById('_AP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(40)").html().trim();
        document.getElementById('_BN_CLASSIFICATION').value = $(this).closest("tbody tr").find("td:eq(42)").html().trim();

        if ($(this).closest("tbody tr").find("td:eq(41)").html().trim() === "OT-SIN") {
            $("#AT_SEC_REGISTRATION").hide("swing");
            $("#secID").hide("fast");
        } else if ($(this).closest("tbody tr").find("td:eq(41)").html().trim() === "OT-PRT") {
            $("#AT_DTI_REGISTRATION").hide("fast");
            $("#dtiID").hide("swing");
        }

        if ($(this).closest("tbody tr").find("td:eq(6)").html().trim() === "null") {
            document.getElementById('nBussOwner').innerHTML = "None";
        } else {
            document.getElementById('nBussOwner').innerHTML = $(this).closest("tbody tr").find("td:eq(6)").html();
        }

        /*if ($(this).closest("tbody tr").find("td:eq(38)").text().trim() === "null") {
            $("#AP_Remarks").val("");
        }*/

        if ($(this).closest("tbody tr").find("td:eq(16)").text().trim() === "Pass") {
            $("#AT_BRGY_CLEARANCE").prop("checked", true);
        }

        if ($(this).closest("tbody tr").find("td:eq(17)").text().trim() === "Pass") {
            $("#AT_DTI_REGISTRATION").prop("checked", true);
        }

        if ($(this).closest("tbody tr").find("td:eq(18)").text().trim() === "Pass") {
            $("#AT_SEC_REGISTRATION").prop("checked", true);
        }

        if ($(this).closest("tbody tr").find("td:eq(19)").text().trim() === "Pass") {
            $("#AT_TITLE_TO_PROPERTY").prop("checked", true);
        }

        if ($(this).closest("tbody tr").find("td:eq(21)").text().trim() === "Pass") {
            $("#AT_CONTRACT_OF_LEASE").prop("checked", true);
        }

        if ($(this).closest("tbody tr").find("td:eq(23)").text().trim() === "Pass") {
            $("#AT_AUTHORIZATION").prop("checked", true);
        }

        if ($(this).closest("tbody tr").find("td:eq(37)").text().trim() === "Pass") {
            $("#AT_MISC_DOCUMENTS").prop("checked", true);
        }

    });

    $("#fileDownload").click(function (event) {
        // event.preventDefault();
        var fID = Number($("#_AT_ID").val());
        var apID = Number($("#_AP_ID").val());
        var link = "?fID=" + fID + "&apID=" + apID;
        window.open("downloadAttachment" + link);
        /* fID.empty();
         apID.empty();*/
    });
	
	$("#fileDownloadr").click(function (event) {
		// event.preventDefault();
		var fID = Number($("#_AT_IDr").val());
		var apID = Number($("#_AP_IDr").val());
		var link = "?fID=" + fID + "&apID=" + apID;
		window.open("downloadAttachment" + link);
		/* fID.empty();
		 apID.empty();*/
	});

    $('.evaluation-modal-new').on('hidden.bs.modal', function () {
        $("#AT_SEC_REGISTRATION").show("swing");
        $("#secID").show("fast");
        $("#AT_DTI_REGISTRATION").show("fast");
        $("#dtiID").show("swing");
        $("#AT_BRGY_CLEARANCE").prop("checked", false);
        $("#AT_DTI_REGISTRATION").prop("checked", false);
        $("#AT_SEC_REGISTRATION").prop("checked", false);
        $("#AT_TITLE_TO_PROPERTY").prop("checked", false);
        $("#AT_CONTRACT_OF_LEASE").prop("checked", false);
        $("#AT_AUTHORIZATION").prop("checked", false);
        $("#AT_MISC_DOCUMENTS").prop("checked", false);
        $("#_AT_ID").empty();
        $("#_AP_ID").empty();
        $("#_AP_REFERENCE_NO").empty();
        $("#_BN_CLASSIFICATION").empty();

    });

    $(".evaluation-modal-terminate").on('hidden.bs.modal', function () {
        $("#tRefNo").text("");
        $("#tBussName").text("");
        $("#tBussNature").text("");
        $("#tBussAuthRepName").text("");
        $("#tBussOwner").text("");
    });

    $('#btnNewAppl').click(function () {
        if ($("#AT_BRGY_CLEARANCE").is(':checked') && ($("#AT_DTI_REGISTRATION").is(':checked') || $("#AT_SEC_REGISTRATION").is(':checked')) && $("#AT_TITLE_TO_PROPERTY").is(':checked') && $("#AT_CONTRACT_OF_LEASE").is(':checked') && $("#AT_AUTHORIZATION").is(':checked') && $("#AT_MISC_DOCUMENTS").is(':checked')) {
            swal({
                title: "Are you sure?",
                text: "You will save your current changes",
                type: "warning",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel',
            }).then((result) => {
                if(result.value
        )
            {
                var datanewApplForm = new FormData($('#newApplForm')[0]); //working method
                $.ajax({
                    type: "POST",
                    url: "updateNewAppEvaluationForm",
                    data: datanewApplForm,
                    processData: false,
                    contentType: false,
                    success: function () {
                        swal({
                            type: 'success',
                            title: 'DONE!.',
                            text: 'Succesfully Evaluated',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if(result.value
                    )
                        {
                            location.reload(true);
                        }
                    })
                        ;

                    }/*,
                    error: function () {
                        swal("error", "Evaluation encountered and error", "error");
                    }*/
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
        } else {

            var swalWithBootstrapButtons = swal.mixin({
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            })

            swalWithBootstrapButtons({
                title: 'Missing Requirements',
                text: "There are missing/invalid requirement(s), Continue?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Terminate',
                cancelButtonText: 'Re-Evaluate',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                $(".evaluation-modal-terminate").modal('toggle');
                $("#tRefNo").append($("#_AP_REFERENCE_NO").val().trim());
                $("#tRefNoh").val($("#_AP_REFERENCE_NO").val().trim());
                $("#tBussName").append($("#nBussName").text().trim());
                $("#tBussNature").append($("#nBussNature").text().trim());
                $("#tBussAuthRepName").append($("#nBussAuthRepName").text().trim());
                $("#tBussOwner").append($("#nBussOwner").text().trim());
                $(".evaluation-modal-new").modal('toggle');
            } else if (
                // Read more about handling dismissals
                result.dismiss === swal.DismissReason.cancel
            ) { //Re-evaluate
                $(".evaluation-modal-reevval").modal('toggle');
                $("#reRefNo").append($("#_AP_REFERENCE_NO").val().trim());
                $("#reRefNoh").val($("#_AP_REFERENCE_NO").val().trim());
                $(".evaluation-modal-new").modal('toggle');
            }
        })

        }

        $("#btnTermAppl").click(function () {
            swal({
                title: "Are you sure?",
                text: "You will save your current changes",
                type: "warning",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel',
            }).then((result) => {
                if(result.value)
            {
                var terminateApplForm = new FormData($('#terminateApplForm')[0]);
                $.ajax({
                    type: "POST",
                    url: "terminateApplForm",
                    data: terminateApplForm,
                    processData: false,
                    contentType: false,
                    success: function () {
                        swal({
                            type: 'success',
                            title: 'DONE!.',
                            text: 'Succesfully Terminated',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if(result.value
                    )
                        {
                            location.reload(true);
                        }
                    });

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

        })
    });

    $(".assessModal").click(function () {
        document.getElementById('aBussName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
        document.getElementById('aBussAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(9)").html();
        document.getElementById('aBussConTelno').innerHTML = $(this).closest("tbody tr").find("td:eq(10)").html();
        document.getElementById('aBussAuthRepName').innerHTML = $(this).closest("tbody tr").find("td:eq(11)").html();
        document.getElementById('aBussAuthRepAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(12)").html();
        document.getElementById('aBussNature').innerHTML = $(this).closest("tbody tr").find("td:eq(39)").html();
        document.getElementById('_AAP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(40)").html().trim();

        if ($(this).closest("tbody tr").find("td:eq(6)").html().trim() === "null") {
            document.getElementById('aBussOwner').innerHTML = "None";
        } else {
            document.getElementById('aBussOwner').innerHTML = $(this).closest("tbody tr").find("td:eq(6)").html();
        }

    });
    $('.evaluation-modal-assess').on('hidden.bs.modal', function () {

        $("#chkMayorsPerm").prop("checked", false);
        $("#chkCity_Tax").prop("checked", false);
        $("#chkGarbage_Fee").prop("checked", false);
        $("#chkSanitary_Fee").prop("checked", false);
        $("#chkBLDG_Fee").prop("checked", false);
        $("#chkELECI_Fee").prop("checked", false);
        $("#chkPLUMI_Fee").prop("checked", false);
        $("#chkSIGBRD_Fee").prop("checked", false);
        $("#chkFS_Fee").prop("checked", false);
        $("#chkNRPS_Fee").prop("checked", false);
        $("#chkZoning_Fee").prop("checked", false);
        $("#chkTourism_Fee").prop("checked", false);
        $("#chkQCBRD_Fee").prop("checked", false);
        $("#chkADJ_Fee").prop("checked", false);
        $("#chkDISC_Fee").prop("checked", false);
        $("#chkPENDEL_Fee").prop("checked", false);
        $("#chkADJTOUR_Fee").prop("checked", false);
        $("#chkSPECPER_Fee").prop("checked", false);
        $("#chkADD_Fee").prop("checked", false);
        $("#chkCTC_Fee").prop("checked", false);
        $("#_AAP_REFERENCE_NO").empty();

    });

    $('.evaluation-modal-reevval').on('hidden.bs.modal', function () {
        $("#reRefNo").text('');

    });

    $("#btnRevAppl").click(function () {
        swal({
            title: "Are you sure?",
            text: "You will save your current changes",
            type: "warning",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Confirm!",
            showCancelButton: true,
            cancelButtonText: 'Cancel',
        }).then((result) => {
            if(result.value)
        {
            var reEvalApplForm = new FormData($('#reEvalApplForm')[0]);
            $.ajax({
                type: "POST",
                url: "reEvaluateApplForm",
                data: reEvalApplForm,
                processData: false,
                contentType: false,
                success: function () {
                    swal({
                        type: 'success',
                        title: 'DONE!.',
                        text: 'Succesfully Terminated',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if(result.value)
                    {
                        location.reload(true);
                    }
                });

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
    })


    $("#btnAssNewAppl").click(function () {

        if (!$("#chkMayorsPerm").is(':checked')) {
            $("#chkMayorsPerm").prop("checked", true);
        }

        var assessNewApplForm = new FormData($('#assessNewApplForm')[0]);

        swal({
            title: "Are you sure?",
            text: "You will save your current changes",
            type: "warning",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Confirm!",
            showCancelButton: true,
            cancelButtonText: 'Cancel',
        }).then((result) => {
            if(result.value
    )
        {
            $.ajax({
                type: "POST",
                url: "assessNewApplForm",
                data: assessNewApplForm,
                enctype: "multipart/form-data",
                processData: false,
                contentType: false,
                success: function () {
                    swal({
                        type: 'success',
                        title: 'DONE!.',
                        text: 'Succesfully Assessed',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if(result.value
                )
                    {
                        location.reload(true);
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
    })
        ;
    })
});