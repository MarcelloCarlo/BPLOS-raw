/*
Template Name: Color Admin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.7
Version: 2.1.0
Author: Sean Ngu
Website: http://www.seantheme.com/color-admin-v2.1/admin/html/
*/
var handleBootstrapWizardsValidation = function () {
    "use strict";
    $("#wizard").bwizard({
        validating: function (e, t) {
            if (t.index == 0) {
                if (false === $('form[name="applicationFormSingle"]').parsley().validate("wizard-st-1")) {
                    return false
                }
            } else if (t.index == 1) {
                if (false === $('form[name="applicationFormSingle"]').parsley().validate("wizard-st-2")) {
                    return false
                }
            } else if (t.index == 2) {
                if (false === $('form[name="applicationFormSingle"]').parsley().validate("wizard-st-3")) {
                    return false
                }
            } else if (t.index == 3) {
                if (false === $('form[name="applicationFormSingle"]').parsley().validate("wizard-st-4")) {
                    return false
                }
            } else if (t.index == 4) {
                if (false === $('form[name="applicationFormSingle"]').parsley().validate("wizard-st-5")) {
                    return false
                }
            } else if (t.index == 5) {
                if (false === $('form[name="applicationFormSingle"]').parsley().validate("wizard-st-6")) {
                    return false
                }
            } else if (t.index == 6) {
                if (false === $('form[name="applicationFormSingle"]').parsley().validate("wizard-st-7")) {
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