<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
    <link rel="shortcut icon" href="<c:url value='/template/web/favicon.ico'/>">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <link href="<c:url value='/template/admin/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/owl.carousel.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/owl.theme.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/owl.transitions.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/meanmenu/meanmenu.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/animate.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/normalize.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/wave/waves.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/wave/button.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/scrollbar/jquery.mCustomScrollbar.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/notika-custom-icon.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/jquery.dataTables.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/main.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/style.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/admin/css/responsive.css'/>" rel="stylesheet" type="text/css">
    <script src="<c:url value='/template/admin/js/vendor/modernizr-2.8.3.min.js'/>"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- sweetalert -->
    <script src="<c:url value='/template/sweetalert/sweetalert2.min.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/template/sweetalert/sweetalert2.min.css' />" />

</head>
<body>

<%@ include file="/common/admin/header.jsp" %>
<%@ include file="/common/admin/menu.jsp" %>

<dec:body/>

<%@ include file="/common/admin/footer.jsp" %>

    <script src="<c:url value='/template/admin/js/vendor/jquery-1.12.4.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/wow.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery-price-slider.js'/>"></script>
    <script src="<c:url value='/template/admin/js/owl.carousel.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery.scrollUp.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/meanmenu/jquery.meanmenu.js'/>"></script>
    <script src="<c:url value='/template/admin/js/counterup/jquery.counterup.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/counterup/waypoints.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/counterup/counterup-active.js'/>"></script>
    <script src="<c:url value='/template/admin/js/scrollbar/jquery.mCustomScrollbar.concat.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/sparkline/jquery.sparkline.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/sparkline/sparkline-active.js'/>"></script>
    <script src="<c:url value='/template/admin/js/flot/jquery.flot.js'/>"></script>
    <script src="<c:url value='/template/admin/js/flot/jquery.flot.resize.js'/>"></script>
    <script src="<c:url value='/template/admin/js/flot/flot-active.js'/>"></script>
    <script src="<c:url value='/template/admin/js/knob/jquery.knob.js'/>"></script>
    <script src="<c:url value='/template/admin/js/knob/jquery.appear.js'/>"></script>
    <script src="<c:url value='/template/admin/js/knob/knob-active.js'/>"></script>
    <script src="<c:url value='/template/admin/js/chat/jquery.chat.js'/>"></script>
    <script src="<c:url value='/template/admin/js/todo/jquery.todo.js'/>"></script>
    <script src="<c:url value='/template/admin/js/wave/waves.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/wave/wave-active.js'/>"></script>
    <script src="<c:url value='/template/admin/js/plugins.js'/>"></script>
    <script src="<c:url value='/template/admin/js/data-table/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/data-table/data-table-act.js'/>"></script>
    <script src="<c:url value='/template/admin/js/main.js'/>"></script>
    <script src="<c:url value='/template/admin/js/tawk-chat.js'/>"></script>
<script>
    var s = document.title;
    if (s === "User List") {
        document.getElementById('a4').style.color="white";
        document.getElementById('li4').style.background="linear-gradient(to right, #F27121, #E94057, #8A2387)";
    }
    else if (s === "Role List") {
        document.getElementById('a5').style.color="white";
        document.getElementById('li5').style.background="linear-gradient(to right, #F27121, #E94057, #8A2387)";
    }
    else if (s === "Patient Management") {
        document.getElementById('a2').style.color="white";
        document.getElementById('li2').style.background="linear-gradient(to right, #F27121, #E94057, #8A2387)";
    }
    else if (s === "Charity List") {
        document.getElementById('a1').style.color="white";
        document.getElementById('li1').style.background="linear-gradient(to right, #F27121, #E94057, #8A2387)";
    }
    else if (s === "Area List") {
        document.getElementById('a3').style.color="white";
        document.getElementById('li3').style.background="linear-gradient(to right, #F27121, #E94057, #8A2387)";
    }
</script>
</body>
</html>