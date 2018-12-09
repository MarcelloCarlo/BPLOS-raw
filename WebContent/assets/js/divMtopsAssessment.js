$(document).ready(function () {
	
	App.init();
	TableManageResponsive.init();
	$(".mtopsModal").click(function () {
		document.getElementById('nApplName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
		document.getElementById('nTODA').innerHTML = $(this).closest("tbody tr").find("td:eq(1)").html();
		document.getElementById('_AP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(5)").html().trim();
		
	});
	
	$('#btnCloseNewApplModal').on('hidden.bs.modal',function () {
		$("input:checkbox").prop("checked", false);
	});
	
	$('#closeNewPanelWindow').click(function () {
		//$("input:checkbox").prop("checked", false);
		$("input:checkbox").removeAttr('checked');
	});
	
	$('#btnAssMtopsAppl').click(function () {
		swal({
			title: "Are you sure?",
			text: "You will save your current changes",
			type: "warning",
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Confirm!",
			showCancelButton: true,
			cancelButtonText: 'Cancel'
		}).then(function(result) {
			if(result.value)
			{
				var assessMtopsApplForm = new FormData($('#assessMtopsApplForm')[0]); //working method
				$.ajax({
					type: "POST",
					url: "assessMtops",
					data: assessMtopsApplForm,
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
						swal("error", "The process encountered an error", "error");
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
		})
		;
	})
});