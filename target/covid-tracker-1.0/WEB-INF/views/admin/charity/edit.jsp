<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="charityAPI" value="/api/charity"/>
<c:url var="charityURL" value="/admin/charity/list"/>
<c:url var="editURL" value="/admin/charity/edit"/>
<html>
<head>
    <title>Edit Charity</title>
</head>
<body>
<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="CHARITY_DTO">
    <div class="form-element-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list">
                        <div class="basic-tb-hd">
                            <h2>Enter the charity information</h2>
                        </div>
                        <div class="row">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="check_name">Charity Name</label>
                                        <form:input path="name" id="check_name" placeholder ="Charity name" class="form-control"/>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="check_name">Charity Content</label>
                                        <form:input path="content" id="check_content" placeholder ="Charity content" class="form-control"/>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="check_name">Charity Address</label>
                                        <form:input placeholder ="Charity address" id="charity-address" class=" form-control" path="address"
                                                    cssStyle="width: 94%;display: inline" onfocus="enterLocation()" required="required"/>
                                        <span><img onclick="chooseLocation()"  class="buttonSearch" src="/template/web/img/icons/choose.png"/></span>
                                        <style> .buttonSearch:hover{ cursor: pointer } </style>
                                        <div id="charityMap" style="display:none;width:100%; height:50vh"></div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <br>

                    <form:hidden path="id" id="charityID"/>
                    <form:hidden path="cX" id="charityLat"/>
                    <form:hidden path="cY" id="charityLng"/>

                    <button id="btnAddOrUpdate" type="button" onclick="processing()" class="btn btn-success notika-btn-success">Update Charity</button>

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

        if($('#check_name').val() == '' || $('#check_content').val()=='' || $('#charity-address').val()==''){
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
        updateCharity(data);
    });

    function updateCharity(data) {
        $.ajax({
            url: '${charityAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                swal(
                    'Updated!',
                    'Your charity has been update.',
                    'success'
                ).then((result) => {
                    window.location.href = "${charityURL}";
                });
            },
            error: function (error) {
                swal(
                    'Update Fail!',
                    'Oop~ Something wrong!',
                    'danger'

                ).then((result) => {
                    if (result.value) {
                        window.location.href = "${charityURL}";
                    }
                });
            }
        });
    }
</script>
<%@ include file="/WEB-INF/views/web/map/charityMap.jsp" %>
</body>
</html>
