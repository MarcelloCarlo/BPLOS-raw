$(document).ready(function () {
    App.init();
    TableManageResponsive.init();
    FormWizardValidation.init();
    FormPlugins.init();

    $('#dateNSingBussDTIReg').datetimepicker({
        format: "DD-MM-YYYY"

    });
    $('#dateNSingBussEstRentStart').datetimepicker({
        format: "DD-MM-YYYY"
    });

    $('#submitMtopsBtn').click(function () {
        swal.mixin({
            confirmButtonText: 'Next &rarr;',
            showCancelButton: true,
            progressSteps: ['1', '2']
        }).queue([{
            title: 'Terms & Conditions',
            text: 'Do you agree on the terms and conditions?'
        },
            'Confirm?',
        ]).then((result) => {
            if(result.value
    )
        {
            var formApplicationFormMtops = $('#applicationFormMtops')[0];
            var dataApplicationFormMtops = new FormData(formApplicationFormMtops);
            $.ajax({
                type: "POST",
                enctype: "multipart/form-data",
                url: "uploadMtopsApplForm",
                data: dataApplicationFormMtops,
                processData: false,
                contentType: false,
                success: function (response) {
                    swal({
                        type: 'success',
                        title: 'All Done!',
                        html: 'Your Reference Number (Save It!): <b>' + JSON.stringify(response) + '</b> Your Application is subject to evaluation, Wait for further instructions. Ensure that your inserted contact number is active/valid!',
                        confirmButtonText: 'Proceed'
                    }).then((result) => {
                        if(result.value
                )
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
				if (false === $('form[name="applicationFormMtops"]').parsley().validate("wizard-st-1")) {
					return false
				}
			} else if (t.index == 1) {
				if (false === $('form[name="applicationFormMtops"]').parsley().validate("wizard-st-2")) {
					return false
				}
			} else if (t.index == 2) {
				if (false === $('form[name="applicationFormMtops"]').parsley().validate("wizard-st-3")) {
					return false
				}
			} else if (t.index == 3) {
				if (false === $('form[name="applicationFormMtops"]').parsley().validate("wizard-st-4")) {
					return false
				}
			} else if (t.index == 4) {
				if (false === $('form[name="applicationFormMtops"]').parsley().validate("wizard-st-5")) {
					return false
				}
			} else if (t.index == 5) {
				if (false === $('form[name="applicationFormMtops"]').parsley().validate("wizard-st-6")) {
					return false
				}
			} else if (t.index == 6) {
				if (false === $('form[name="applicationFormMtops"]').parsley().validate("wizard-st-7")) {
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
}()