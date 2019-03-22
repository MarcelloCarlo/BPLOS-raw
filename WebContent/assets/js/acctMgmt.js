$(document).ready(function () {
	App.init();
	TableManageResponsive.init();
	
	$("#backBtn").click(function () {
		window.history.back();
	});
	
	$("#submitBtn").attr('disabled', true);
	
	$('#verPass').on('input',function(){
		var pass = $('#newPass').val();
		var pass2 = $('#verPass').val();
		if (pass2 != pass /*&& $(this).value.length!=0*/) {
			$("#alertLbl").text('The passwords didn\'t match!');
			$("#submitBtn").attr('disabled', true);
		} else{
			if(pass.length >= 8 && pass2.length >= 8){
				$("#submitBtn").attr('disabled', false);
			}
			
			$("#alertLbl").text(' ');}
		
	});
	
	$("#submitBtn").click(function () {
		
		var changePassFrm = new FormData($('#changePassFrm')[0]);
		swal({
			title: "Continue?",
			text: "Once The Password Changed, You Need To Login Again",
			type: "warning",
			confirmButtonColor: "#1a8ecb",
			confirmButtonText: "Confirm",
			showCancelButton: true,
			cancelButtonText: 'Cancel',
		}).then(function(result) {
			if(result.value)
			{
				$.ajax({
					type: "POST",
					url: "accountChangePass",
					data: changePassFrm,
					enctype: "multipart/form-data",
					processData: false,
					contentType: false,
					success: function (response) {
						if (response == "fail"){
						$("#lblCurrPass").text("Incorrect Password");}
						else {window.location.replace(response);}
					},
					error: function (jqXHR, textStatus, message){
						$("#lblCurrPass").text(message)
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
	});
	
	
});