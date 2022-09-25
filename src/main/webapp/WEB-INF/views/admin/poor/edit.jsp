<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="poorAPI" value="/api/poor"/>
<c:url var="poorURL" value="/admin/poor/list"/>
<html>
<head>
    <title>Edit Poor</title>
</head>
<body>
<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="POOR_DTO">
    <div class="form-element-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list">
                        <div class="basic-tb-hd">
                            <h2>Check information</h2>
                        </div>
                        <div class="row">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="check_detail">Full Name</label>
                                        <form:input path="name" id="check_detail" placeholder ="Detail" class="form-control"/>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="check_detail">Phone Number</label>
                                        <form:input path="phone" id="check_detail" placeholder ="Detail" class="form-control"/>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="check_detail">Family Circumstances</label>
                                        <form:input path="detail" id="check_detail" placeholder ="Detail" class="form-control"/>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="charity-address">Area Address</label>
                                        <form:input id="charity-address" class=" form-control" path="address"
                                                    cssStyle="width: 94%;display: inline" onfocus="enterLocation()" required="required"/>
                                        <span><img onclick="chooseLocation()"  class="buttonSearch" src="/template/web/img/icons/choose.png"/></span>
                                        <style> .buttonSearch:hover{ cursor: pointer } </style>
                                        <div id="charityMap" style="display:none;width:100%; height:50vh"></div>
                                    </div>

                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="image-poor">Image: </label>
                                        <img src="data:image/png;base64, ${POOR_DTO.base64}" id="image-poor" alt="Image" width="250" height="250"/>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <br>
                    <form:hidden path="base64" id="base64"/>
                    <form:hidden path="id" id="id"/>

                    <button id="btnAddOrUpdate" type="button" onclick="processing()" class="btn btn-success notika-btn-success">Active</button>

                    <button type="reset" class="btn btn-warning notika-btn-warning">Reset</button>
                </div>
            </div>
        </div>
    </div>
</form:form>
<img id="yourLocation" src="/template/web/img/icons/geolocation.png" style="display: none" width="40px" height="40px" onclick="currentLocation()"/>
<style> #yourLocation:hover{ cursor: pointer } </style>
<script>

    function processing(){
        swal({
            title: 'Processing',
            text: "Please wait a minute...",
            showCancelButton: false,
            showConfirmButton: false,
            allowOutsideClick: false,
            closeOnClickOutside: false
        })
    }

    $('#btnAddOrUpdate').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        if($('#check_address').val() == '' || $('#check_detail').val()==''){
            swal(
                'Try again!',
                'Please fill up all neccessary field. ',
                'error'
            )
            return;
        }

        if($('#charityLat').val() == '' || $('#charityLng').val()==''){
            swal(
                'Try again!',
                'Cannot identify this address. ',
                'error'
            )
            return;
        }

        updateArea(data);
    });

    function updateArea(data) {
        $.ajax({
            url: '${poorAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                swal(
                    'Updated!',
                    'Your area has been update.',
                    'success'
                ).then((result) => {
                    window.location.href = "${poorURL}";
                });
            },
            error: function (error) {
                swal(
                    'Update Fail!',
                    'Oop~ Something wrong!',
                    'warning'

                ).then((result) => {
                    if (result.value) {
                        window.location.href = "${poorURL}";
                    }
                });
            }
        });
    }
</script>
<%@ include file="/WEB-INF/views/web/map/charityMap.jsp" %>
</body>
</html>
