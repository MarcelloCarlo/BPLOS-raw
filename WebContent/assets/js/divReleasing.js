$(document).ready(function () {
    App.init();
    TableManageResponsive.init();

    $('.modalRel').click(function () {
        document.getElementById('rRefno').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
        document.getElementById('rBuNa').innerHTML = $(this).closest("tbody tr").find("td:eq(1)").html();
        document.getElementById('rBuN').innerHTML = $(this).closest("tbody tr").find("td:eq(2)").html();
        document.getElementById('rTPN').innerHTML = $(this).closest("tbody tr").find("td:eq(3)").html();
        document.getElementById('rDB').innerHTML = $(this).closest("tbody tr").find("td:eq(4)").html();
        document.getElementById('AP_REF').value = $(this).closest("tbody tr").find("td:eq(0)").html();
        document.getElementById('tbId').value = $(this).closest("tbody tr").find("td:eq(5)").html().trim();
    });
    
    
    $("#btnRelNewAppl").click(function () {
	    swal({
		    title: "Are you sure?",
		    text: "You will save your current changes",
		    type: "warning",
		    confirmButtonColor: "#DD6B55",
		    confirmButtonText: "Confirm!",
		    showCancelButton: true,
		    cancelButtonText: 'Cancel',
	    }).then((result) => {
		    if(result.value){
		    var relApplForm = new FormData($('#relApplForm')[0]);
		    $.ajax({
			    type: "POST",
			    url: "releasePermit",
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
				    }).then((result) => {
					    if(result.value){
					    	console.log(response);
					    var oRX = "?bpNo=" + response;
						//$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
						window.location.replace("BPLSBsnsPermit.jsp"+oRX);
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