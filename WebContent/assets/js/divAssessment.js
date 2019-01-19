$(document).ready(function () {
	App.init();
	TableManageResponsive.init();
	
	
	$(".assessModal").click(function () {
		document.getElementById('aBussName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
		document.getElementById('aBussAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(8)").html();
		document.getElementById('aBussConTelno').innerHTML = $(this).closest("tbody tr").find("td:eq(9)").html();
		document.getElementById('aBussAuthRepName').innerHTML = $(this).closest("tbody tr").find("td:eq(10)").html();
		document.getElementById('aBussAuthRepAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(11)").html();
		document.getElementById('aBussNature').innerHTML = $(this).closest("tbody tr").find("td:eq(12)").html();
		document.getElementById('_AAP_REFERENCE_NO').value = $(this).closest("tbody tr").find("td:eq(13)").html().trim();
		
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
		}).then(function(result) {
			if(result.value)
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
						}).then(function(result) {
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