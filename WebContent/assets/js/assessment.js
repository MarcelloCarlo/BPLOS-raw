$(document).ready(function() {
    App.init();
    TableManageResponsive.init();

    var sum = 0;
//iterate through each td based on class and add the values
    $(".amt").each(function() {

        //add only if the value is number
        if(!isNaN($(this).text()) /*&& $(this).value.length!=0*/) {
            sum += parseFloat($(this).text());
        }
        console.log($(this).text());
        $("#tdPerm").text($(this).text());
    });
    $('#total').text(sum);
    $('#total2').text($('#total').text());

    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-53034621-1', 'auto');
    ga('send', 'pageview');
});