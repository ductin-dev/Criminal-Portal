<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="charityAPI" value="/api/web/charity"/>
<c:url var="charityURL" value="/charity/custom/list"/>
<c:url var="editURL" value="/charity/custom/edit"/>
<html>
<head>
    <title>Edit Charity</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Input information
            </header>
            <div class="panel-body">
                <div class="form">
                    <form:form class="form-validate form-horizontal" role="form" id="formSubmit" modelAttribute="CHARITY_CUSTOM">

                        <div class="form-group ">
                            <label class="control-label col-lg-2">Charity Name<span class="required">*</span></label>
                            <div class="col-lg-8">
                                <form:input class=" form-control" path="name" id="charity-name"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-lg-2">Charity Address<span class="required">*</span></label>
                            <div class="col-lg-8">
                                <form:input id="charity-address" class=" form-control" path="address"
                                            cssStyle="width: 94%;display: inline" onfocus="enterLocation()" required="required"/>

                                <span><img onclick="chooseLocation()"  class="buttonSearch" src="/template/web/img/icons/choose.png"/></span>
                                <style> .buttonSearch:hover{ cursor: pointer } </style>
                                <div id="charityMap" style="display:none;width:100%; height:50vh"></div>

                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-lg-2">Charity Content<span class="required">*</span></label>
                            <div class="col-lg-8">
                                <form:input class=" form-control" path="content" id="charity-content"/>
                            </div>
                        </div>

                        <form:hidden path="id" id="charityID"/>
                        <form:hidden path="cX" id="charityLat"/>
                        <form:hidden path="cY" id="charityLng"/>

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-8">

                                <c:if test="${not empty CHARITY_CUSTOM.id}">
                                    <button id="btnAddOrUpdate" class="btn btn-primary" onclick="processing()" type="button">Update Charity</button>
                                </c:if>

                                <c:if test="${empty CHARITY_CUSTOM.id}">
                                    <button id="btnAddOrUpdate" type="button" class="btn btn-primary" onclick="processing()">Add Charity</button>
                                </c:if>

                                <button type="reset" class="btn btn-warning notika-btn-warning">Reset</button>

                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </section>
    </div>
</div>
<img id="yourLocation" src="/template/web/img/icons/geolocation.png" style="display: none" width="40px" height="40px" onclick="currentLocation()"/>
<style> #yourLocation:hover{ cursor: pointer } </style>
<script>
    var username = document.getElementById("userNameURL").value;

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
        var check_valid_string = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ/0-9\s,'-]*$/;
        var check_name = $('#charity-name').val();
        var check_content = $('#charity-content').val();
        var check_address = $('#charity-address').val();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        if($('#charity-name').val() == '' || $('#charity-content').val()=='' || $('#charity-address').val()==''){
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

        if(check_address !==''){
            if (check_valid_string.test(check_address) == false)
            {
                swal(
                    'Try Again',
                    'Address can not be contain special characters',
                    'error'
                )
                return;
            }
        }

        if(check_name !==''){
            if (check_valid_string.test(check_name) == false)
            {
                swal(
                    'Try Again',
                    'Name can not be contain special characters',
                    'error'
                )
                return;
            }
        }

        if(check_content !==''){
            if (check_valid_string.test(check_content) == false)
            {
                swal(
                    'Try Again',
                    'Content can not be contain special characters',
                    'error'
                )
                return;
            }
        }

        if ($('#charityID').val() == "") {
            addCharity(data);
        } else {
            updateCharity(data);
        }
    });

    function addCharity(data) {
        $.ajax({
            url: '${charityAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                swal(
                    'Added Success!',
                    'Your charity has been added.',
                    'success'

                ).then((result) => {
                    window.location.href = "${charityURL}?userName="+username;
                });

            },
            error: function (error) {
                swal(
                    'Add Fail!',
                    'Oop~ Something wrong!',
                    'danger'

                ).then((result) => {
                    if (result.value) {
                        window.location.href = "${charityURL}?userName="+username;
                    }
                });
            }
        });
    }

    function updateCharity(data) {
        $.ajax({
            url: '${charityAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                swal(
                    'Updated!',
                    'Your charity has been update.',
                    'success'

                ).then((result) => {
                    window.location.href = "${charityURL}?userName="+username;
                });
            },
            error: function (error) {
                swal(
                    'Update Fail!',
                    'Oop~ Something wrong!',
                    'danger'

                ).then((result) => {
                    if (result.value) {
                        window.location.href = "${charityURL}?userName="+username;
                    }
                });
            }
        });
    }
    //-------------------------------------------------------------------
</script>
<%@ include file="/WEB-INF/views/web/map/charityMap.jsp" %>
</body>
</html>
