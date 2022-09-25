<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="charityAPI" value="/api/web/charity"/>
<c:url var="charityURL" value="/charity/custom/list"/>
<c:url var="editURL" value="/charity/custom/edit"/>
<html>
<head>
    <title>Support Register</title>
</head>
<body>
<div class="row" >
    <div class="col-lg-12">
        <div class="basic-tb-hd">
            <h2 style="color:darkorange;font-size: 32px;font-weight: 700;text-align: center;">Please input information</h2>

        </div>
        <section class="panel">
            <header class="panel-heading">
                Input your information here
            </header>
            <div class="panel-body">
                <div class="form">

                        <form class="form-validate form-horizontal" role="form" action="/support-register" method="post" enctype="multipart/form-data">
                        <div class="form-group ">
                            <label class="control-label col-lg-2">Full Name<span class="required">*</span></label>
                            <div class="col-lg-8">
                                <input class=" form-control" id="check_name" name="name"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-lg-2">Phone Number<span class="required">*</span></label>
                            <div class="col-lg-8">
                                <input class=" form-control" id="check_phone" name="phone"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-lg-2">Family Circumstances<span class="required">*</span></label>
                            <div class="col-lg-8">
                                <input class=" form-control" id="check_detail" name="detail"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-lg-2">Address<span class="required">*</span></label>
                            <div class="col-lg-8">
                                <input id="charity-address" class=" form-control" name="address"
                                       cssStyle="width: 94%;display: inline" onfocus="enterLocation()" required="required"/>

                                <span><img onclick="chooseLocation()"  class="buttonSearch" src="/template/web/img/icons/choose.png"/></span>
                                <style> .buttonSearch:hover{ cursor: pointer } </style>
                                <div id="charityMap" style="display:none;width:100%; height:50vh"></div>

                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-lg-2">Your Image<span class="required">*</span></label>
                            <div class="col-lg-8">

                                <input  class=" form-control" type="file" id="image" name="image" />

                                <img src="" id="image-preview" alt="Your Image  Here" width="250" height="250"/>

                            </div>
                        </div>

                            <input type="hidden" id="imgBase64" name="imgBase64">

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-8">

                                <input style="color: #0E993C" class="btn btn-warning notika-btn-warning" type="submit" value="ASSIGN"/>
                                <button style="color: #0E993C" type="reset" class="btn btn-warning notika-btn-warning">Reset</button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
<img id="yourLocation" src="/template/web/img/icons/geolocation.png" style="display: none" width="40px" height="40px" onclick="currentLocation()"/>
<style> #yourLocation:hover{ cursor: pointer } </style>

${swal_success}

<script>
    var input = document.querySelector('input[type=file]');
    input.onchange = function() {
        var file = input.files[0],
            reader = new FileReader();

        reader.onloadend = function() {
            var b64 = reader.result.replace(/^data:.+;base64,/, '');
            console.log(b64);
            document.getElementById("imgBase64").value = b64;
            document.getElementById("image-preview").src = "data:image/png;base64,"+b64;
        };

        reader.readAsDataURL(file);
    };
</script>

<script>

    function processing() {
        swal({
            title: 'Processing',
            text: "Please wait a minute...",
            showCancelButton: false,
            showConfirmButton: false,
            allowOutsideClick: false,
            closeOnClickOutside: false
        })
    }

    $("#btnSign").click(function() {
        var valid_phone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        var valid_fullname = /^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ \\s]+$/;
        var check_address = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓỖÔỖÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ/,. 0-9\s,'-]*$/;
        var mobile = $('#check_phone').val();
        var address =$('#charity-address').val();
        var fullname = $('#check_fullname').val();
        var detail = $('#check_detail').val();

        if ($('#check_name').val() == '' || $('#check_phone').val() == ''
            || $('#charity-address').val() == '' || $('#check_detail').val() == ''){
            swal(
                'Try Again',
                'Please fill up all neccessary field',
                'error'
            )
            return false;
        }

        if(fullname !==''){
            if (valid_fullname.test(fullname) == false)
            {
                swal(
                    'Try Again',
                    'Full name can not be contain digit and special characters',
                    'error'
                )
                return false;
            }
        }
        if(mobile !==''){
            if (valid_phone.test(mobile) == false)
            {
                swal(
                    'Try Again',
                    'Incorrect phone number format',
                    'error'
                )
                return false;
            }
        }
        if(address !==''){
            if (check_address.test(address) == false)
            {
                swal(
                    'Try Again',
                    'Address can not be contain special characters',
                    'error'
                )
                return false;
            }
        }
        if(detail !==''){
            if (check_address.test(detail) == false)
            {
                swal(
                    'Try Again',
                    'Detail can not be contain digit and special characters',
                    'error'
                )
                return false;
            }
        }

        processing();
    });

</script>

<%@ include file="/WEB-INF/views/web/map/charityMap.jsp" %>
</body>
</html>
