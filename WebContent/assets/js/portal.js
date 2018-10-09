$(document).ready(function() {
    App.init();
    LoginV2.init();

    $('#loginBtn').click( function () {
        var loginEmpForm = new FormData($('#loginEmpForm')[0]);
        $.ajax({
            type: "POST",
            url: "LoginServlet",
            enctype:"multipart/form-data",
            data: loginEmpForm,
            processData: false,
            contentType: false,
            error: function(response){
                swal({
                    type: 'error',
                    title: 'Login Failed!',
                })
            }
        });
    });

    $("#bplsBtn").click(function () {
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