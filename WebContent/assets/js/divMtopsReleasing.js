$(document).ready(function () {
	App.init();
	TableManageResponsive.init();
	
	$('.modalRel').click(function () {
		document.getElementById('_AP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(5)").html().trim();
	});
	
	$("#btnRelNewAppl").click(function () {
		swal({
			title: "Are you sure?",
			text: "You will save your current changes",
			type: "warning",
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Confirm!",
			showCancelButton: true,
			cancelButtonText: 'Cancel'
		}).then(function (result) {
			if(result.value){
				var relApplForm = new FormData($('#relApplForm')[0]);
				$.ajax({
					type: "POST",
					url: "releaseMtops",
					data: relApplForm,
					enctype: "multipart/form-data",
					processData: false,
					contentType: false,
					success: function (response) {
						swal({
							type: 'success',
							title: 'DONE!.',
							text: 'Succesfully Processed',
							confirmButtonText: 'OK'
						}).then(function (result) {
							if(result.value){
								console.log(response);
								var oRX = "?perIdNo=" + response;
								//$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
								window.location.replace("MTOPSPermit.jsp"+oRX);
							}
						});}
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