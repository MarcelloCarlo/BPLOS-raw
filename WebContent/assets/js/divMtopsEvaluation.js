$(document).ready(function () {
	App.init();
	TableManageResponsive.init();
	
	$(".mtopsModal").click(function () {
		document.getElementById('nApplName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
		document.getElementById('nTODA').innerHTML = $(this).closest("tbody tr").find("td:eq(1)").html();
		document.getElementById('AT_UNIFIED_FILE_NAME').innerHTML = $(this).closest("tbody tr").find("td:eq(5)").html();
		document.getElementById('_AP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(6)").html().trim();
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
				var mtopsApplForm = new FormData($('#mtopsApplForm')[0]); //working method
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
	                    swal("error", "Evaluation encountered an error", "error");
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