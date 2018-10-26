$(document).ready(function () {
	App.init();
	FormWizard.init();
	TableManageResponsive.init();
	FormWizardValidation.init();
	FormPlugins.init();
	
	$('#birthdate').datetimepicker({
		format: "DD-MM-YYYY",
		
	});
	
	
	$('#btnUsrsubmit').click(function () {
		swal.mixin({
			confirmButtonText: 'Next &rarr;',
			showCancelButton: true,
			progressSteps: ['1']
		}).queue([
			'Confirm?',
		]).then(function(result) {
			if(result.value
			)
			{
				var insertUsrForm = new FormData($('#insertUsrForm')[0]);
				
				$.ajax({
					type: "POST",
					enctype: "multipart/form-data",
					url: "uploadSingleAppForm",
					data: insertUsrForm,
					processData: false,
					contentType: false,
					success: function (response) {
						swal({
							type: 'success',
							title: 'All Done!',
							html: 'Result -> '+JSON.stringify(response),
							confirmButtonText: 'Proceed'
						}).then(function(result) {
							if(result.value
							)
							{
								location.reload(true);
								/*var refx = "?refNo=" + response;
								//$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
								window.location.replace("BPLSRtSlip.jsp" + refx);*/
							}
						})
						;
					},
					error: function () {
						swal({
							type: 'error',
							title: 'Error, Please try again!',
							confirmButtonText: 'Proceed'
						}).then(function(result) {
							if(result.value
							)
							{
								location.reload(true);
								/*var refx = "?refNo=" + response;
								//$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
								window.location.replace("BPLSRtSlip.jsp" + refx);*/
							}
						})
						;
					}
				});
			}
		})
		return false;
	});
});