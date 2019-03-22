$(document).ready(function () {
	$('#btnAssMtopsAppl').prop('disabled',true);
	$('#MFF').click(function () {
		//check if checkbox is checked
		if ($(this).is(':checked')) {
			
			$('#btnAssMtopsAppl').prop('disabled',false); //enable input
			
		}else {$('#btnAssMtopsAppl').prop('disabled',true);}
	});
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
		$("input:checkbox").prop('checked',false);
	});
	
	$('#btnAssMtopsAppl').click(function () {
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