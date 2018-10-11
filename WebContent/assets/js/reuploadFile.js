$(document).ready(function () {
    App.init();
    TableManageResponsive.init();
    FormWizard.init();
    $("#apID").val($("#hidAPID").val());

    $("#submitBtn").click(function () {
        swal({
            title: "Are you sure?",
            text: "You will save your current changes",
            type: "warning",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Confirm!",
            showCancelButton: true,
            cancelButtonText: 'Cancel',
        }).then((result) => {
            if(result.value)
        {
            var reuploadFileForm = new FormData($('#reuploadFileForm')[0]); //working method
            $.ajax({
                type: "POST",
                url: "reuploadFilee",
                data: reuploadFileForm,
                enctype:"multipart/form-data",
                processData: false,
                contentType: false,
                success: function () {
                    swal({
                        type: 'success',
                        title: 'DONE!.',
                        text: 'Succesfully Uploaded',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if(result.value)
                    {
                        //location.reload(true);
                    }
                });

                },error: function () {
                    swal("error", "Please try again!", "error");
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