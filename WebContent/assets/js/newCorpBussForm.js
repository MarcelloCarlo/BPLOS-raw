$(document).ready(function () {
    App.init();
    TableManageResponsive.init();
    FormWizardValidation.init();
    FormPlugins.init();
	$('#applicationFormSingle').on('keyup keypress', function(e) {
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13) {
			e.preventDefault();
			return false;
		}
	});
    $('#dateNCorpBussSECReg').datetimepicker({
        viewMode: 'years',
        format: "DD-MM-YYYY"

    });
    $('#dateNCorpBussEstRentStart').datetimepicker({
        viewMode: 'years',
        format: "DD-MM-YYYY"
    });

    $('#txtNCorpTelNo').mask('000-0000');

    $('#txtNCorpFaxNo').mask('000-0000');

    $('#txtNCorpTaxPayTINNo').mask('000000000000');

    $('#txtNCorpPropIdxNo').mask('00000000000000');

    $('#txtNCorpBussSECRegNo').mask('00000000');

    $('#txtNCorpEmpSSSNo').mask('000000000');

    $('#numNCorpBussAreaSqmts').mask('###999.99');

    $('#numNCorpBussUnitNo').mask('###999.99');


    $('#applicationFormCorp').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
    });

    $('#submitBtn').click(function () {
        swal({
            title: "Are you sure?",
            text: "You will save your current changes",
            type: "warning",
            confirmButtonColor: "#62a3cb",
            confirmButtonText: "Confirm!",
            showCancelButton: true,
            cancelButtonText: 'Cancel'
        }).then(function (result) {
            if(result.value)
        {
            var applicationFormCorp = new FormData($('#applicationFormCorp')[0]);
            $.ajax({
                type: "POST",
                enctype: "multipart/form-data",
                url: "uploadCorpAppForm",
                data: applicationFormCorp,
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
                })
                    ;
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


var handleBootstrapWizardsValidation = function () {
	"use strict";
	$("#wizard").bwizard({
		validating: function (e, t) {
			if (t.index == 0) {
				if (false === $('form[name="applicationFormCorp"]').parsley().validate("wizard-st-1")) {
					return false
				}
			} else if (t.index == 1) {
				if (false === $('form[name="applicationFormCorp"]').parsley().validate("wizard-st-2")) {
					return false
				}
			} else if (t.index == 2) {
				if (false === $('form[name="applicationFormCorp"]').parsley().validate("wizard-st-3")) {
					return false
				}
			} else if (t.index == 3) {
				if (false === $('form[name="applicationFormCorp"]').parsley().validate("wizard-st-4")) {
					return false
				}
			} else if (t.index == 4) {
				if (false === $('form[name="applicationFormCorp"]').parsley().validate("wizard-st-5")) {
					return false
				}
			} else if (t.index == 5) {
				if (false === $('form[name="applicationFormCorp"]').parsley().validate("wizard-st-6")) {
					return false
				}
			} else if (t.index == 6) {
				if (false === $('form[name="applicationFormCorp"]').parsley().validate("wizard-st-7")) {
					return false
				}
			}
		}
	})
};
var FormWizardValidation = function () {
	"use strict";
	return {
		init: function () {
			handleBootstrapWizardsValidation()
		}
	}
}();