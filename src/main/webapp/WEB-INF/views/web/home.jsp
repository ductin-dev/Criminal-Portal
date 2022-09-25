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
	<title>Trang chủ</title>
</head>

<body style="font-family: Arial, Sans-Serif,serif">
<div class="row">
	<div class="col-lg-12">
		<ol class="breadcrumb" style="background: linear-gradient(to left, #F37335, #FDC830);
    font-size: 15px;
    font-weight: 700;
    color: cyan;">
			<li><i class="fa fa-home"></i><a style="color:white" href="<c:url value='/trang-chu'/>">Home</a></li>
		</ol>
	</div>
</div>

<!--Google Map-->
<div class="row">
	<section id="headsection">
	<div class="col-lg-12 col-md-12">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h2>

                    <i class="fa fa-map-marker red"></i><strong>COVID19 MAP  &nbsp;&nbsp;| &nbsp;&nbsp; <span class="mytext">Data from HTH team's database, update frequently base on GOV</span></strong>
				</h2>
				<div class="panel-actions">
					<a onclick='success1()' class="btn-setting"><i
							class="fa fa-rotate-right"></i></a>
					<a href="#headsection"
					   class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
				</div>
			</div>
			<div class="panel-body-map" style="height: 100vh">
				<div id="googleMap" style="display:none; width:100%; height:100vh"></div>
				<div id="noteMap" style="display: none">
					<button class="button-note" id="blockedAreas" value="deactive" onclick="blockOnly();return false;">
						<span><img src="template/web/img/icons/block.png"/></span> Blocked area
					</button>
					<button class="button-note" id="curePatients" value="deactive" onclick="cureOnly();return false;">
						<span><img src="template/web/img/icons/cure.png"/></span> Infected people
					</button>
					<button class="button-note" id="wellPatients" value="deactive" onclick="wellOnly();return false;">
						<span><img src="template/web/img/icons/well.png"/></span> Alive
					</button>
					<button class="button-note" id="deathPatients" value="deactive" onclick="deathOnly();return false;">
						<span><img src="template/web/img/icons/death.png"/></span> Deceased
					</button>
					<button class="button-note" id="charityPlaces" value="deactive" onclick="charityOnly();return false;">
						<span><img src="template/web/img/icons/charity.png"/></span> Charity place <i class="zmdi zmdi-plus-circle"></i>
					</button>
				</div>
				<div id="search-box-form" style="display: none">
					<i class="zmdi zmdi-menu" onclick="showAdvancedSearch()"></i>
					<input id="search-box" class="search-box" type="text" placeholder="Enter your place/keyword to search" autocomplete="off">
					<button id="buttonSearch"  class="buttonSearch" onclick="placeSearch('yourLocation')"><span><img src="template/web/img/icons/search.png"/></span></button>
					<div id="advanced-search" class="advanced-search">
						<input id="advanced-search-box" class="search-box" type="text" placeholder="Enter your specific area for nearby search" style="width:70%; margin-left:5%" autocomplete="off">
						<button class="buttonSearch" title="Choose location" onclick="chooseLocation()"><span><img src="template/web/img/icons/choose.png"/></span></button>
					</div>
				</div>

				<div id="listing" style="display: none">
					<button style="border:none; padding:0;" onclick="hideListResult()"><i class="zmdi zmdi-close-circle"></i></button>
					<table id="resultsTable">
						<tbody id="results">
						</tbody>
					</table>
				</div>
				<img id="yourLocation" style="display: none" src="template/web/img/icons/geolocation.png" width="40px" height="40px" onclick="yourLocation()"/>
			</div>
		</div>
	</div>
	</section>
</div>

<style>
    .mytext {
        font-weight: 700;
        background: linear-gradient(to left, #F37335, #FDC830);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }
</style>
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
	function processing(){
		swal({
			title: 'Processing',
			text: "Please wait a minute...",
			timer: 3000,
			showCancelButton: false,
			showConfirmButton: false,
			allowOutsideClick: false,
			closeOnClickOutside: false
		})
	}

</script>
<%@ include file="/WEB-INF/views/web/map/covidMap.jsp" %>
</body>

</html>