$(document).ready(function () {
	App.init();
	TableManageResponsive.init();
	
	$(".mtopsModal").click(function () {
		/*document.getElementById('nApplName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
		document.getElementById('nTODA').innerHTML = $(this).closest("tbody tr").find("td:eq(9)").html();
		document.getElementById('AT_UNIFIED_FILE_NAME').innerHTML = $(this).closest("tbody tr").find("td:eq(13)").html();
		document.getElementById('nBussNature').innerHTML = $(this).closest("tbody tr").find("td:eq(39)").html();
		document.getElementById('_AT_ID').value = $(this).closest("tbody tr").find("td:eq(14)").html().trim();
		document.getElementById('_AP_ID').value = $(this).closest("tbody tr").find("td:eq(15)").html().trim();
		document.getElementById('_AP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(40)").html().trim();
		document.getElementById('_BN_CLASSIFICATION').value = $(this).closest("tbody tr").find("td:eq(42)").html().trim();*/
		
	});
	
	$("#fileDownload").click(function () {
		// event.preventDefault();
		var apID = Number($("#_AP_REFERENCE_NO").val());
		var link = "?apID=" + apID;
		window.open("downloadAttachmentMtops" + link);
		/* fID.empty();
		 apID.empty();*/
	});
	
	$('.evaluation-modal-mtops').on('hidden.bs.modal', function () {
		$("input:checkbox").prop("checked", false);
		$("#AT_MISC_DOCUMENTS").prop("checked", false);
		$("#_AT_ID").empty();
		$("#_AP_ID").empty();
		$("#_AP_REFERENCE_NO").empty();
		$("#_BN_CLASSIFICATION").empty();
		
	});
	
	$('#btnMtopsAppl').click(function () {
		swal({
			title: "Are you sure?",
			text: "You will save your current changes",
			type: "warning",
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Confirm!",
			showCancelButton: true,
			cancelButtonText: 'Cancel',
		}).then(function (result) {
			if (result.value
			) {
				var mtopsApplFormm = new FormData($('#mtopsApplForm')[0]); //working method
				$.ajax({
					type: "POST",
					url: "evaluateMtops",
					data: mtopsApplForm,
					processData: false,
					contentType: false,
                    success: function (response) {
                        swal({
                            type: 'success',
                            title: 'DONE!.',
                            html: 'Result: <b>' + JSON.stringify(response),
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
                        swal("error", "Evaluation encountered and error", "error");
                    }
				});
			}
			else  {
				swalWithBootstrapButtons(
					'Cancelled',
					'Operation Halted',
					'error'
				)
				
			}
		});
		
	});
	
});