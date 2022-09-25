<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<c:url var="charityAPI" value="/api/web/charity"/>
<c:url var="userWebAPI" value="/api/web/user"/>
<c:url var="charityURL" value="/charity/custom/list"/>
<c:url var="editURL" value="/charity/custom/edit"/>
<c:url var="homeURL" value="/trang-chu"/>
<!DOCTYPE html>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Visual Age</title>
</head>

<body style="font-family: Arial, Sans-Serif,serif">

<div class="row">
	<div class="col-lg-12">
		<ol class="breadcrumb" style="background: linear-gradient(to left, #F37335, #FDC830);
    font-size: 15px;
    font-weight: 700;
    color: cyan;">
			<li><i class="fa fa-home"></i><a style="color:white" href="<c:url value='/trang-chu'/>">Data Analysis by <span style="color:orangered">HTH Team</span> using DOMO and BI Algorithm</a></li>
		</ol>
	</div>
</div>

<!--Data-->
<div class="container-fluid">
	<div class="row">
		<section id="headsection">

			<div class="col-md-12 col-xs-12">

				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>Infected person in Vietnam stacked by age &nbsp;&nbsp;|&nbsp;&nbsp;<span class="mytext">Update frequently on HTH's Database base on GOV </span></strong>
						</h2>
						<div class="panel-actions">
							<a onclick='success1()' class="btn-setting"><i
									class="fa fa-rotate-right"></i></a>
							<a href="#headsection"
							   class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body-map">
						<div class="embed-responsive">
						<iframe src="https://public.domo.com/cards/xkkwr" width="100%" height="600" marginheight="0" marginwidth="0" frameborder="0"></iframe>
						</div></div>
				</div>

			</div>

		</section>
	</div></div>

<br><br><br><br><br><br><br><br>

<!-- Facebook -->
<div class="row">
	<!--/col-->
	<div class="col-md-12">

		<a href="https://www.facebook.com/satfomacej" target="_blank">
			<div class="social-box facebook col-md-3" style="padding:10px;border-radius: 5px;">
				<i class="fa fa-facebook">&nbsp;&nbsp;<span style="font-family: Arial,serif">Tín</span></i>
				<ul style="height:80px;background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Capture.JPG?raw=true')">
					<li style="background: rgba(0,0,0,0.7)"><strong style="color:cornflowerblue">3560</strong> <span style="color:white;font-weight: 700">friends</span></li>
					<li style="background: rgba(0,0,0,0.7)"><strong style="color:cornflowerblue">594</strong> <span style="color:white;font-weight: 700">followers</span></li>
				</ul>
			</div></a>

		<a href="https://www.facebook.com/nhochiennhoc" target="_blank">
			<div class="social-box facebook col-md-3" style="padding:10px;border-radius: 5px;">
				<i class="fa fa-facebook">&nbsp;&nbsp;<span style="font-family: Arial,serif">Hiền</span></i>
				<ul style="height:80px;background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Capture2.JPG?raw=true')">
					<li style="background: rgba(0,0,0,0.7)"><strong style="color:cornflowerblue">Private</strong> <span style="color:white;font-weight: 700">friends</span></li>
					<li style="background: rgba(0,0,0,0.7)"><strong style="color:cornflowerblue">Private</strong> <span style="color:white;font-weight: 700">followers</span></li>
				</ul>
			</div></a>

		<a href="https://www.facebook.com/huynx.dev.dn" target="_blank">
			<div class="social-box facebook col-md-3" style="padding:10px;border-radius: 5px;">
				<i class="fa fa-facebook">&nbsp;&nbsp;<span style="font-family: Arial,serif">Huy</span></i>
				<ul style="height:80px;background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Captur2e.JPG?raw=true')">
					<li style="background: rgba(0,0,0,0.7)"><strong style="color:cornflowerblue">365</strong> <span style="color:white;font-weight: 700">friends</span></li>
					<li style="background: rgba(0,0,0,0.7)"><strong style="color:cornflowerblue">Private</strong> <span style="color:white;font-weight: 700">followers</span></li>
				</ul>
			</div></a>

		<a href="https://www.facebook.com/ShinCN2000" target="_blank">
			<div class="social-box facebook col-md-3" style="padding:10px;border-radius: 5px">
				<i class="fa fa-facebook">&nbsp;&nbsp;<span style="font-family: Arial,serif">Hưng</span></i>
				<ul style="height:80px;background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Cap22ture.JPG?raw=true')">
					<li style="background: rgba(0,0,0,0.7)"><strong style="color:cornflowerblue">Private</strong> <span style="color:white;font-weight: 700">friends</span></li>
					<li style="background: rgba(0,0,0,0.7)"><strong style="color:cornflowerblue">Private</strong> <span style="color:white;font-weight: 700">followers</span></li>
				</ul>
			</div></a>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	function success1(){
		Swal.fire({
			position: 'top-end',
			icon: 'success',
			width: 800,
			html: '<h2 style="color:orange;font-weight: 700;">The data have been update </h2><br><h6>HTH Team | Resfes 2020</h6>',
			showConfirmButton: false,
			timer: 1500
		})
	}
</script>

<script>
	document.title="Visual Age"
</script>
<style>
	.mytext {
		font-weight: 700;
		background: linear-gradient(to left, #F37335, #FDC830);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}
</style>
</body>
</html>