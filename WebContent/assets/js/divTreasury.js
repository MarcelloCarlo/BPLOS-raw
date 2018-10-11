$(document).ready(function () {
    App.init();
    TableManageResponsive.init();

    document.getElementById('nBussName').innerHTML = $(this).closest("tbody tr").find("td:eq(0)").html();
    document.getElementById('nBussAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(9)").html();
    document.getElementById('nBussConTelno').innerHTML = $(this).closest("tbody tr").find("td:eq(10)").html();
    document.getElementById('nBussAuthRepName').innerHTML = $(this).closest("tbody tr").find("td:eq(11)").html();
    document.getElementById('nBussAuthRepAddr').innerHTML = $(this).closest("tbody tr").find("td:eq(12)").html();
    document.getElementById('nBussNature').innerHTML = $(this).closest("tbody tr").find("td:eq(39)").html();
});