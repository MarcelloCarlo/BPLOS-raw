$(document).ready(function () {

    App.init();
    TableManageResponsive.init();
	var a,g,c;
    $(".newModal").click(function () {
        a =  $(this).closest("tbody tr").find("td:eq(0)").html();
        b = $(this).closest("tbody tr").find("td:eq(1)").html();
        c = $(this).closest("tbody tr").find("td:eq(13)").html();
        document.getElementById('nBussName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
        document.getElementById('nBussAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(8)").html();
        document.getElementById('nBussConTelno').innerHTML = $(this).closest("tbody tr").find("td:eq(9)").html();
        document.getElementById('nBussAuthRepName').innerHTML = $(this).closest("tbody tr").find("td:eq(10)").html();
        document.getElementById('nBussAuthRepAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(11)").html();
        //document.getElementById('AT_UNIFIED_FILE_NAME').innerHTML = $(this).closest("tbody tr").find("td:eq(13)").html();
        document.getElementById('nBussNature').innerHTML = $(this).closest("tbody tr").find("td:eq(12)").html();
        document.getElementById('_AP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(13)").html().trim();

        if ($(this).closest("tbody tr").find("td:eq(6)").text() === "null") {
            document.getElementById('nBussOwner').value = 'None';
        }

    });
	
	$(".missionOrder").click(function () {
		$('#bu_Name').val(a);
		$('#bn_Name').val(b);
		$('#bu_Loc').val(c);
	});

    $('#btnCloseNewApplModal').click(function () {
        $("#chkBLDG_INS").prop("checked", false);
        $("#chkFIRE_INS").prop("checked", false);
        $("#chkHS_INS").prop("checked", false);
        $("#chkLABOR_INS").prop("checked", false);
        $("#chkMISC_INS").prop("checked", false);
        $("#chkZONING_INS").prop("checked", false);
    });

    $('#closeNewPanelWindow').click(function () {
        $("#chkBLDG_INS").prop("checked", false);
        $("#chkFIRE_INS").prop("checked", false);
        $("#chkHS_INS").prop("checked", false);
        $("#chkLABOR_INS").prop("checked", false);
        $("#chkMISC_INS").prop("checked", false);
        $("#chkZONING_INS").prop("checked", false);
    });

    $("#btnInsNewAppl").click(function () {
        swal({
            title: "Are you sure?",
            text: "You will save your current changes",
            type: "warning",
            confirmButtonColor: "#62a3cb",
            confirmButtonText: "Confirm!",
            showCancelButton: true,
            cancelButtonText: 'Cancel'
        }).then(function(result) {
            if(result.value
    )
        {
            var datanewInsApplForm = new FormData($('#newInsApplForm')[0]); //working method
            $.ajax({
                type: "POST",
                url: "inspectApplForm",
                data: datanewInsApplForm,
                processData: false,
                contentType: false,
                success: function () {
                    swal({
                        type: 'success',
                        title: 'DONE!.',
                        text: 'Succesfully Evaluated',
                        confirmButtonText: 'OK'
                    }).then(function(result) {
                        if(result.value
                )
                    {
                        location.reload(true);
                    }
                })
                    ;
                },
                error: function () {
                    swal("error", "The process encountered and error", "error");
                }
            });
        }
    })
        ;
    })
})