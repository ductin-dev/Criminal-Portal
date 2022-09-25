<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head style="scroll-behavior: smooth;">
    <meta charset="UTF-8">
    <title>Page Home</title>
    <link rel="shortcut icon" href="<c:url value='/template/web/favicon.ico'/>">
    	<link href="<c:url value='/template/web/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    	<link href="<c:url value='/template/web/css/bootstrap-theme.css'/>" rel="stylesheet" type="text/css">
        <link href="<c:url value='/template/web/css/elegant-icons-style.css'/>" rel="stylesheet" type="text/css">
        <link href="<c:url value='/template/web/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">

        <link href="<c:url value='/template/web/css/owl.carousel.css'/>" rel="stylesheet" type="text/css">
        <link href="<c:url value='/template/web/css/jquery-jvectormap-1.2.2.css'/>" rel="stylesheet" type="text/css">
        <link href="<c:url value='/template/web/css/widgets.css'/>" rel="stylesheet" type="text/css">
        <link href="<c:url value='/template/web/css/style.css'/>" rel="stylesheet" type="text/css">
        <link href="<c:url value='/template/web/css/style-responsive.css'/>" rel="stylesheet" type="text/css">

        <link href="<c:url value='/template/web/css/jquery-ui-1.10.4.min.css'/>" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="<c:url value='/template/sweetalert/sweetalert2.min.js' />"></script>
        <link rel="stylesheet" href="<c:url value='/template/sweetalert/sweetalert2.min.css' />" />

        <!-- DATA TABLES WEB -->
         <link href="<c:url value='/template/admin/css/jquery.dataTables.min.css'/>" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
        <link href="<c:url value='/template/web/css/mapStyle.css'/>" rel="stylesheet" type="text/css">

</head>
<body style="font-family: Arial, Sans-Serif,serif">

 <section id="container" class="">
 	<%@ include file="/common/web/header.jsp" %>
 	<%@ include file="/common/web/menu.jsp" %>
	 <section id="main-content">

	  <section class="wrapper">
	 		<dec:body/>
	 </section>
	 	<%@ include file="/common/web/footer.jsp" %>
	 </section>
</section>

    <script src="<c:url value='/template/web/js/jquery.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery-ui-1.10.4.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery-1.8.3.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/template/web/js/jquery-ui-1.9.2.custom.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.scrollTo.min.js'/>"></script>
    <script src="<c:url value='/template/web/assets/jquery-knob/js/jquery.knob.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/template/web/js/jquery.sparkline.js'/>"></script>

    <script src="<c:url value='/template/web/js/owl.carousel.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.rateit.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.customSelect.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/scripts.js'/>"></script>

    <script src="<c:url value='/template/web/js/jquery-jvectormap-1.2.2.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery-jvectormap-world-mill-en.js'/>"></script>

    <script src="<c:url value='/template/web/js/jquery.autosize.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.placeholder.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/gdp-data.js'/>"></script>
    <script src="<c:url value='/template/web/js/morris.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/sparklines.js'/>"></script>

    <script src="<c:url value='/template/web/js/jquery.slimscroll.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.nicescroll.js'/>"></script>
    <script src="<c:url value='/template/admin/js/data-table/jquery.dataTables.min.js'/>"></script>


 <script>
 (function ($) {
 "use strict";

 var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
 (function(){
 var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
 s1.async=true;
 s1.src='https://embed.tawk.to/5f3e740ccc6a6a5947ad6066/default';
 s1.charset='UTF-8';
 s1.setAttribute('crossorigin','*');
 s0.parentNode.insertBefore(s1,s0);
 })();
 })(jQuery);
 </script>
 <script>
     var s = document.title;
     if (s === "Page Home") {
         document.getElementById('lihome').classList.add('active');
     }
     else if (s === "Your Charity") {
         document.getElementById('limycharity').classList.add('active');
         document.getElementById('ulcharity').style.display='block';
     }
     else if (s === "City Level") {
         document.getElementById('licitylevel').classList.add('active');
         document.getElementById('ulr').style.display='block';
     }
     else if (s === "Country Level") {
         document.getElementById('licountrylevel').classList.add('active');
         document.getElementById('ulr').style.display='block';
     }
     else if (s === "Visual Day") {
         document.getElementById('liday').classList.add('active');
         document.getElementById('ulvisual').style.display='block';
     }
     else if (s === "Visual City") {
         document.getElementById('licity').classList.add('active');
         document.getElementById('ulvisual').style.display='block';
     }
     else if (s === "Visual Age") {
         document.getElementById('liage').classList.add('active');
         document.getElementById('ulvisual').style.display='block';
     }
     else if (s === "Assigning Charity") {
         document.getElementById('liassigncharity').classList.add('active');
         document.getElementById('ulcharity').style.display='block';
     }
     else if (s === "List All Charity") {
         document.getElementById('liallcharity').classList.add('active');
         document.getElementById('ulcharity').style.display='block';
     }
     else if (s === "Priority List") {
         document.getElementById('liprioritylist').classList.add('active');
         document.getElementById('ulcharity').style.display='block';
     }
     document.getElementById('ultrash');
 </script>
</body>
</html>