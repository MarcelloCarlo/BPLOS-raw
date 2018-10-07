$(document).ready(function() {
    App.init();
    TableManageResponsive.init();

    $('#loginEmpForm').parsley().on('field:validated', function () {
        var ok = $('.parsley-error').length === 0;
        $('.bs-callout-info').toggleClass('hidden', !ok);
        $('.bs-callout-warning').toggleClass('hidden', ok);

    })
        .on('form:submit', function () {
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
                    var loginEmpForm = new FormData($('#loginEmpForm')[0]);
                    $.ajax({
                        type: "POST",
                        enctype:"multipart/form-data",
                        url: "uploadSingleAppForm",
                        data: loginEmpForm,
                        processData: false,
                        contentType: false,
                        error: function(response){
                            swal({
                                type: 'success',
                                title: 'All Done!',
                                html: 'Your Reference Number (Save It!): <b>' + JSON.stringify(response) + '</b> Your Application is subject to evaluation, Wait for further instructions. Ensure that your inserted contact number is active/valid!'


                            })
                        }
                    });
                }
            })
            return false;
        });

    $("#newBtn").click(function () {
        var formX = $("#newForm").val();
        if ( formX === "nSing"){
            window.open("BPLSAplSglBus.jsp");
        }else if (formX === "nCorp") {
            window.open("BPLSAplCrpBus.jsp");
        } else if (formX === "rSing") {

        } else if (formX === "rCorp") {

        }
    });
});