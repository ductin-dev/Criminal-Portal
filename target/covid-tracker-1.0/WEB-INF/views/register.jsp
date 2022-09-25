<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="registerAPI" value="/api/register"/>
<c:url var="loginURL" value="/login"/>
<c:url var="registerURL" value="/register"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
</head>

<body>

<div class="page-wrapper bg-gra-03 p-t-45 p-b-50" style="background-color:#ff4e00;background-image:linear-gradient(315deg, #ff4e00 0%, #ec9f05 74%);">
    <div class="wrapper wrapper--w790">
        <div class="card card-5" >
            <div class="card-heading">
                <h2 class="title">Covid Tracker Registration</h2>
            </div>

            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                    <p class="text-center">${message}</p>
                </div>
            </c:if>

            <div class="card-body" style="padding-bottom: 100px;background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Untitled-1.png?raw=true')">
                <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="USER_DTO">
                    <div class="form-row">
                        <div class="name" style="color:black">User Name&nbsp;&nbsp;<span style="color:red">(*)</span></div>
                        <div class="value">
                            <div class="input-group">
                                <form:input id="check_username" class="input--style-5" type="text" path="userName"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="name" style="color:black">Password&nbsp;&nbsp;<span style="color:red">(*)</span></div>
                        <div class="value">
                            <div class="input-group">
                                <form:input id="check_password" class="input--style-5" type="password" path="password"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="name" style="color:black">Full Name&nbsp;&nbsp;<span style="color:red">(*)</span></div>
                        <div class="value">
                            <div class="input-group">
                                <form:input id="check_fullname" class="input--style-5" type="text" path="fullname"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="name" style="color:black">Phone&nbsp;&nbsp;<span style="color:red">(*)</span></div>
                        <div class="value">
                            <div class="input-group">
                                <form:input id="check_phone" class="input--style-5" type="text" path="phone"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-row" >
                        <div class="name" style="color:black">Email&nbsp;&nbsp;<span style="color:red">(*)</span></div>
                        <div class="value">
                            <div class="input-group">
                                <form:input id ="check_email" class="input--style-5" type="text" path="email"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="name" style="color:black">Address&nbsp;&nbsp;<span style="color:red">(*)</span></div>
                        <div class="value">
                            <div class="input-group">
                                <form:input id="check_address" class="input--style-5" type="text" path="address"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="name" style="color:black">Avatar Link</div>
                        <div class="value">
                            <div class="input-group">
                                <form:input class="input--style-5" type="text" path="avatar"/>
                            </div>
                        </div>
                    </div>


                    <div class="col-12 justify-content-center">
                        <style>

                            .btnRegister:hover + .hide {
                                display: block;
                                color: orangered;
                            }
                        </style>
                        <button id="btnRegister" onclick="processing()" class="btn-warning"  style="padding:10px;left: 40%;position: absolute;background-color:orange;color:white;font-size: 28px;border-radius: 8px;">REGISTER</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>


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

    $('#btnRegister').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        var valid_phone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        var valid_email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        var valid_username = /^(?!.*__.*)(?!.*\.\..*)[a-z0-9_.]+$/;
        var valid_password = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
        var valid_fullname = /^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ \\s]+$/;
        var check_address = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓỖÔỖÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ/,. 0-9\s,'-]*$/;
        var email =  $('#check_email').val();
        var mobile = $('#check_phone').val();
        var username = $('#check_username').val();
        var password = $('#check_password').val();
        var fullname = $('#check_fullname').val();
        var address =$('#check_address').val();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });

        if ($('#check_username').val() == '' || $('#check_password').val() == ''
            || $('#check_phone').val() == '' || $('#check_fullname').val() == ''
            || $('#check_email').val() == '' || $('#check_address').val() == ''){
            swal(
                'Try Again',
                'Please fill up all neccessary field',
                'error'
            )
            return;
        }

        if(fullname !==''){
            if (valid_fullname.test(fullname) == false)
            {
                swal(
                    'Try Again',
                    'Full name can not be contain digit and special characters',
                    'error'
                )
                return;
            }
        }

        if(username !==''){
            if (valid_username.test(username) == false)
            {
                swal({
                        type: 'error',
                        html: '<h1>Try Again</h1>' +
                            '<p>Username can only contain any letters from a to z and any numbers from 0 through 9</p>'+
                            '<p>Username can not be contain space and special characters</p>',
                        width: '750px'
                    }
                )
                return;
            }
        }

        if(password !==''){
            if (valid_password.test(password) == false)
            {
                swal({
                        type: 'error',
                        html: '<h1>Try Again</h1>' +
                            '<p>Password must be between 6 and 30 characters</p>'+
                            '<p>Password must contain at least one uppercase letter (ex: A, B etc)</p>'+
                            '<p>Password must contain at least one lowercase letter(ex: a, b etc)</p>'+
                            '<p>Password must contain at least one digit (ex: 1, 2 etc)</p>'+
                            '<p></p>',
                        width: '750px'
                    }
                )

                return;
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
                return;
            }
        }

        if(email !==''){
            if (valid_email.test(email) == false)
            {
                swal(
                    'Try Again',
                    'Incorrect E-mail format',
                    'error'
                )
                return;
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
                return;
            }
        }

        addAccount(data);
    });

    function addAccount(data) {
        $.ajax({
            url: '${registerAPI}',
            allowOutsideClick: false,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                swal(
                    'Sign Up Success!',
                    'Your account has been registered!',
                    'success'
                ).then((result) => {
                    window.location.href = "${loginURL}";
                });
            },
            error: function (error) {
                window.location.href = "${registerURL}?message="+"existed_account";
            }
        });
    }


</script>

</body>

</html>