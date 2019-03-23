$(document).ready(function () {
    App.init();
    TableManageResponsive.init();
    FormWizardValidation.init();
    FormPlugins.init();

    $('#dateNSingBussDTIReg').datetimepicker({
        viewMode: 'years',
        format: "DD-MM-YYYY"
    });
    $('#dateNSingBussEstRentStart').datetimepicker({
        viewMode: 'years',
        format: "DD-MM-YYYY"
    });
    
    $('#txtNSingBussTelNo').mask('000-0000');
    
    $('#txtNSingBussFaxNo').mask('000-0000');
    
    $('#txtNSingTaxPayTINNo').mask('000000000000');
    
    $('#txtNSingPropIdxNo').mask('00000000000000');

    $('#txtNSingBussDTIRegNo').mask('00000000');

    $('#txtNSingEmpSSSNo').mask('000000000');

    $('#numNSingBussAreaSqmts').mask('###999.99');

    $('#numNSingBussUnitNo').mask('###999.99');

    $('#applicationFormSingle').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
    });
    
    $('#submitBtn').click(function () {
        swal.mixin({
            confirmButtonText: 'Next &rarr;',
            showCancelButton: true,
            progressSteps: ['1', '2']
        }).queue([{
            title: 'Verify Inputs?',
            text: 'Ensure that the fields are correct'
        },
            'Confirm?',
        ]).then(function (result) {
            if(result.value)
        {
            var formApplicationFormSingle = $('#applicationFormSingle')[0];
            var dataApplicationFormSingle = new FormData(formApplicationFormSingle);
            $.ajax({
                type: "POST",
                enctype: "multipart/form-data",
                url: "uploadSingleAppForm",
                data: dataApplicationFormSingle,
                processData: false,
                contentType: false,
                success: function (response) {
                    swal({
                        type: 'success',
                        title: 'All Done!',
                        html: 'Your Reference Number (Save It!): <b>' + JSON.stringify(response) + '</b> Your Application is subject to evaluation, Wait for further instructions. Ensure that your inserted contact number is active/valid!',
                        confirmButtonText: 'Proceed'
                    }).then(function (result){
                        if(result.value)
                    {
                        var refx = "?refNo=" + response;
                        //$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
                        window.location.replace("BPLSRtSlip.jsp" + refx);
                    }
                });
                },
                error: function () {
                    swal("error", "Process encountered an error", "error");
                }
            });
        }
    });
        return false;
    });
});