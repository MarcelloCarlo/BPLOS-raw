$(document).ready(function () {
	App.init();
	TableManageResponsive.init();
	
	$("#txtChng").attr('disabled', true);
	var sum = 0.00;
//iterate through each td based on class and add the values
	$(".amt").each(function () {
		
		//add only if the value is number
		if (!isNaN($(this).text()) /*&& $(this).value.length!=0*/) {
			sum += parseFloat($(this).text());
		}
		console.log($(this).text());
		$("#tdPerm").text($(this).text());
	});
	$("#lblTotal").text(parseFloat(sum).toFixed(2));
	$("#totalAmt").val(parseFloat(sum).toFixed(2));
	$("#txtAmt").on('input', function () {
		$("#txtChng").val(parseFloat(parseFloat($(this).val()).toFixed(2) - parseFloat(sum).toFixed(2)).toFixed(2));
	});
	
});

function goBack() {
	window.history.back();
};
$("#btnTresNewAppl").click(function () {
	
	var treaNewApplForm = new FormData($('#treaNewApplForm')[0]);
	swal({
		title: "Are you sure?",
		text: "You will save your current changes",
		type: "warning",
		confirmButtonColor: "#62a3cb",
		confirmButtonText: "Confirm!",
		showCancelButton: true,
		cancelButtonText: 'Cancel',
	}).then(function(result) {
		if(result.value)
		{
			$.ajax({
				type: "POST",
				url: "treasuryMtops",
				data: treaNewApplForm,
				enctype: "multipart/form-data",
				processData: false,
				contentType: false,
				success: function (response) {
					swal({
						type: 'success',
						title: 'DONE!.',
						text: 'Succesfully Processed',
						confirmButtonText: 'OK'
					}).then(function(result) {
						if(result.value)
						{
							window.location.replace("BPLSTIndex.jsp");
							//$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
							//window.location.replace("BPLSORf.jsp"+oRX);
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
});