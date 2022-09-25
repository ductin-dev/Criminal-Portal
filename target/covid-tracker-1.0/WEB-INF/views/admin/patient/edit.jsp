<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="patientAPI" value="/api/patient"/>
<c:url var="patientURL" value="/admin/patient/list"/>
<c:url var="editURL" value="/admin/patient/edit"/>
<c:url var="newURL" value="/admin/patient/new"/>
<html>
<head>
    <title>Edit Patient</title>
</head>
<body>
<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="PATIENT_DTO">
    <div class="form-element-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list">
                        <div class="basic-tb-hd">
                            <h2>Enter the patient information</h2>
                        </div>
                        <div class="row">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="check_code">Patient Code</label>
                                        <form:input id="check_code" path="code" placeholder ="Patient code" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="check_name">Patient Name</label>
                                        <form:input id="check_name" path="name" placeholder ="Patient name" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group float-lb">
                                    <div class="nk-int-st">
                                        <label for="charity-address">Patient Address</label>
                                        <form:input placeholder ="Patient address" id="charity-address" class=" form-control" path="address"
                                                    cssStyle="width: 94%;display: inline" onfocus="enterLocation()" required="required"/>
                                        <span><img onclick="chooseLocation()"  class="buttonSearch" src="/template/web/img/icons/choose.png"/></span>
                                        <style> .buttonSearch:hover{ cursor: pointer } </style>
                                        <div id="charityMap" style="display:none;width:100%; height:50vh"></div>
                                    </div>
                                </div>
                            </div>

                            <c:if test="${not empty PATIENT_DTO.id}">
                                <form:select path="status" id="status">
                                    <form:option value="0" label="Treating"/>
                                    <form:option value="1" label="Recovered"/>
                                    <form:option value="-1" label="Deaths"/>
                                </form:select>
                            </c:if>

                        </div>

                    </div>
                    <br>

                    <form:hidden path="id" id="patientID"/>
                    <form:hidden path="bnX" id="charityLat"/>
                    <form:hidden path="bnY" id="charityLng"/>

                        <button id="btnAddOrUpdate" type="button" onclick="processing()" class="btn btn-success notika-btn-success">Update Patient</button>


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

        if($('#check_code').val() == '' || $('#check_name').val()=='' || $('#charity-address').val()==''){
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
        updatePatient(data);
    });



    function updatePatient(data) {
        $.ajax({
            url: '${patientAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                swal(
                    'Updated!',
                    'Your patient has been update.',
                    'success'
                ).then((result) => {
                    window.location.href = "${patientURL}";
                });
            },
            error: function (error) {
                swal(
                    'Update Fail!',
                    'Oop~ Something wrong!',
                    'warning'

                ).then((result) => {
                    if (result.value) {
                        window.location.href = "${patientURL}";
                    }
                });
            }
        });
    }
</script>
<%@ include file="/WEB-INF/views/web/map/charityMap.jsp" %>
</body>
</html>
