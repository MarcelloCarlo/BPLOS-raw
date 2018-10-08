$(document).ready(function () {
    App.init();
    TableManageResponsive.init();
    FormWizardValidation.init();
    FormPlugins.init();

    $('#dateNSingBussDTIReg').datetimepicker({
        format: "DD-MM-YYYY",

    });
    $('#dateNSingBussEstRentStart').datetimepicker({
        format: "DD-MM-YYYY",
    });

    $('#submitBtn').click( function () {
            swal.mixin({
                confirmButtonText: 'Next &rarr;',
                showCancelButton: true,
                progressSteps: ['1', '2']
            }).queue([{
                title: 'Terms & Conditions',
                text: 'Chaining swal2 modals is easy'
            },
                'Confirm?',
            ]).then((result) => {
                if (result.value) {
                var formApplicationFormSingle = $('#applicationFormSingle')[0];
                var dataApplicationFormSingle = new FormData(formApplicationFormSingle);
                $.ajax({
                    type: "POST",
                    enctype:"multipart/form-data",
                    url: "uploadSingleAppForm",
                    data: dataApplicationFormSingle,
                    processData: false,
                    contentType: false,
                    success: function(response){
                        swal({
                            type: 'success',
                            title: 'All Done!',
                            html: 'Your Reference Number (Save It!): <b>' + JSON.stringify(response) + '</b> Your Application is subject to evaluation, Wait for further instructions. Ensure that your inserted contact number is active/valid!',
                            confirmButtonText: 'Proceed'
                        }).then((result) => {
                            if (result.value) {
                                var refx = "?refNo="+response;
                                //$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
                                window.open("BPLSRtSlip.jsp"+refx);
                            }
                            window.close();
                        });
                    },
                    error: function () {
                        swal("error", "Process encountered an error", "error");
                    }
                });
            }
        })
            return false;
        });
});