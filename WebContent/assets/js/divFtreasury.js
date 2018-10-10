$(document).ready(function() {
    App.init();
    TableManageResponsive.init();
$("#txtChng").attr('disabled', true);
    var sum = 0.00;
//iterate through each td based on class and add the values
    $(".amt").each(function() {

        //add only if the value is number
        if(!isNaN($(this).text()) /*&& $(this).value.length!=0*/) {
            sum += parseFloat($(this).text());
        }
        console.log($(this).text());
        $("#tdPerm").text($(this).text());
    });
$("#lblTotal").text(sum);

$("#txtAmt").on('input',function () {
    $("#txtChng").val(parseFloat($(this).val()) - sum);
});

$("#btnTreNewAppl").click(function () {

    var treaNewApplForm = new FormData($('#treaNewApplForm')[0]);
    swal({
        title: "Are you sure?",
        text: "You will save your current changes",
        type: "warning",
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Confirm!",
        showCancelButton: true,
        cancelButtonText: 'Cancel',
    }).then((result) => {
        if (result.value) {
        $.ajax({
            type:"POST",
            url:"setOfficialReceipt",
            data: treaNewApplForm,
            enctype:"multipart/form-data",
            processData: false,
            contentType: false,
            success: function (response) {
                swal({
                    type: 'success',
                    title: 'DONE!.',
                    text: 'Succesfully Processed',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value) {
                    var oRX = "?orNo="+response;
                    //$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
                    window.location.replace("BPLSORf.jsp"+oRX);
                }
            });

            }
        });
    } else if (result.dismiss === swal.DismissReason.cancel) {
        swalWithBootstrapButtons(
            'Cancelled',
            'Operation Halted',
            'error'
        )

    }
});
})
});
function goBack() {
    window.history.back();
}