<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="userWebAPI" value="/api/web/user"/>
<c:url var="homeURL" value="/trang-chu"/>
<c:url var="logutToUpdate" value="/logout"/>
<html>
<head>
    <title>Edit Charity</title>
</head>
<body>

<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb" style="background: linear-gradient(to left, #F37335, #FDC830);
    font-size: 15px;
    font-weight: 700;
    color: cyan;">
            <li><i class="fa fa-home"></i><a style="color:white" href="<c:url value='/trang-chu'/>">Sign up charity</a></li>
        </ol>
    </div>
</div>


<div class="row">
    <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="USER_SIGNUP">
        <div class="col-lg-12 col-md-12">
            <div class="form-element-list">
                <div class="basic-tb-hd">
                    <h2 style="color:darkorange;font-size: 32px;font-weight: 700;text-align: center;">Check account information before signing up to become the charity</h2>
                </div>
                <div class="row" style="    background: white; margin: 15px;border-radius: 10px;">
                    <div class="col-9 panel-body-map" style="position: absolute;background-color: white;left:3%;border-radius: 10px;width: 960px">
                        <div class="embed-responsive"  style="position:absolute;left:64%;">
                            <iframe src="https://public.domo.com/cards/wppvw" width="600" height="600" marginheight="0" marginwidth="0" frameborder="0"> </iframe>

                        </div>

                    </div>
                    <br><br>
                    <div style="left: 10%;position: absolute;width: 521px;">
                        <div class="form-group float-lb" style="font-size: 35px;width: 74%">
                            <div class="nk-int-st">
                                <h3 style="font-size: 22px;font-weight: 600;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-laughing" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path fill-rule="evenodd" d="M12.331 9.5a1 1 0 0 1 0 1A4.998 4.998 0 0 1 8 13a4.998 4.998 0 0 1-4.33-2.5A1 1 0 0 1 4.535 9h6.93a1 1 0 0 1 .866.5z"/>
                                    <path d="M7 6.5c0 .828-.448 0-1 0s-1 .828-1 0S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 0-1 0s-1 .828-1 0S9.448 5 10 5s1 .672 1 1.5z"/>
                                </svg>&nbsp;FULL NAME &nbsp;&nbsp;&nbsp;<form:input id="check_fullname" path="fullname" placeholder ="Full Name" class="form-control"/></h3>

                            </div>
                        </div>
                    </div>
                    <br><br><br><br><br>
                    <div style="left: 10%;position: absolute;width: 521px;">
                        <div class="form-group float-lb"  style="font-size: 35px;width: 74%">
                            <div class="nk-int-st">
                                <h3 style="font-size: 22px;font-weight: 600;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-telephone-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M2.267.98a1.636 1.636 0 0 1 2.448.152l1.681 2.162c.309.396.418.913.296 1.4l-.513 2.053a.636.636 0 0 0 .167.604L8.65 9.654a.636.636 0 0 0 .604.167l2.052-.513a1.636 1.636 0 0 1 1.401.296l2.162 1.681c.777.604.849 1.753.153 2.448l-.97.97c-.693.693-1.73.998-2.697.658a17.47 17.47 0 0 1-6.571-4.144A17.47 17.47 0 0 1 .639 4.646c-.34-.967-.035-2.004.658-2.698l.97-.969z"/>
                                </svg>&nbsp;PHONE NUMBER&nbsp;&nbsp;&nbsp;<form:input id="check_phone" path="phone" placeholder ="Phone Number" class="form-control"/></h3>

                            </div>
                        </div>
                    </div>
                    <br><br><br><br><br>
                    <div style="left: 10%;position: absolute;width: 521px;">
                        <div class="form-group float-lb"  style="font-size: 35px;width: 74%">
                            <div class="nk-int-st">
                                <h3 style="font-size: 22px;font-weight: 600;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-credit-card-2-back" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"/>
                                    <path d="M11 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1zM1 9h14v2H1V9z"/>
                                </svg>&nbsp;ADDRESS&nbsp;&nbsp;&nbsp;<form:input id="check_address" path="address" placeholder ="Address" class="form-control"/></h3>

                            </div>
                        </div>
                    </div>
                    <br><br><br><br><br>
                    <div style="left: 10%;position: absolute;width: 521px;">
                        <div class="form-group float-lb"  style="font-size: 35px;width: 74%">
                            <div class="nk-int-st">
                                <h3 style="font-size: 22px;font-weight: 600;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                                    <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                                </svg>&nbsp;EMAIL&nbsp;&nbsp;&nbsp;<form:input id="check_email" path="email" placeholder ="Infomation Charity" class="form-control"/></h3>

                            </div>
                        </div>
                    </div>
                    <br><br><br><hr><br><br>
                    <button onclick="processing()" id="btnSignUpCharity" type="button" onmouseenter="document.getElementById('btnSignUpCharity').style.backgroundColor='red'" style="position:absolute;left:10%; background:linear-gradient(to right, #fc4a1a, #f7b733); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */font-size: 25px;font-weight:700;border-radius: 5px;padding: 8px 15px 8px 15px;color:white">ASSIGN CHARITY</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="reset" class="btn btn-warning notika-btn-warning" style="    padding: 8px 15px 8px 15px;position:absolute;left:29%;font-size: 25px">Reset</button>
                    <br><br><br><br><br><br><br>

                </div>

            </div>
            <br>

            <form:hidden path="id" id="userName"/>

        </div>
    </form:form>


</div>

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

    $('#btnSignUpCharity').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        var valid_phone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        var valid_email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        var valid_fullname = /^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ \\s]+$/;
        var check_address = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓỖÔỖÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ/,. 0-9\s,'-]*$/;
        var email =  $('#check_email').val();
        var mobile = $('#check_phone').val();
        var address =$('#check_address').val();
        var fullname = $('#check_fullname').val();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        if ($('#check_phone').val() == '' || $('#check_fullname').val() == ''
            || $('#check_email').val() == '' || $('#check_address').val() == ''){
            swal(
                'Try Again',
                'Please fill up all neccessary field',
                'error'
            )
            return;
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

        signUpCharity(data,fullname,address,email,mobile);
    });

    function signUpCharity(data,fullname,address,email,mobile) {
        $.ajax({
            url: '${userWebAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                swal({
                    title: 'Sign Up Successful, now automatically log out for updates',
                    html: 	'<form:form class="form-horizontal" role="form" modelAttribute="USER_SIGNUP">'+
                        '       <div class="row">\n' +
                        '          <!-- profile-widget -->\n' +
                        '          <div class="col-lg-12">\n' +
                        '            <div class="profile-widget profile-widget-info">\n' +
                        '              <div class="panel-body">\n' +
                        '                <div class="col-lg-2 col-sm-2">\n' +
                        '                  <h4>*</h4>\n' +
                        '                  <div class="follow-ava">\n' +
                        '                    <img src=">${USER_SIGNUP.avatar}" alt="avatar">\n' +
                        '                  </div>\n' +
                        '                  <h4>${USER_SIGNUP.userName}</h4>\n' +
                        '                </div>\n' +
                        '\t\t\t\t\n' +
                        '                <div class="col-lg-4 col-sm-4 follow-info">\n' +
                        '          <p>Full name: '+fullname+'</p>\n' +
                        '\t\t\t\t  <p>Phone number: '+mobile+'</p>\n' +
                        '          <p>Email: '+email+'</p>\n' +
                        '\t\t\t\t  <p>Address: '+address+'</p>\n' +
                        '                  <h6>\n' +
                        '                     <span id="getTimeSystem"></span>\n' +
                        '                     <span id="getDateSystemL"></i></span>\n' +
                        '                  </h6>\n' +
                        '                </div>\n' +
                        '\t\t\t\t\n' +
                        '                <div class="col-lg-2 col-sm-6 follow-info weather-category">\n' +
                        '                  <ul>\n' +
                        '                    <li class="active">\n' +
                        '\n' +
                        '                      <i class="fa fa-comments fa-2x"> </i><br> Covid-19 pandemic is complicated, lets go through it together' +
                        '                    </li>\n' +
                        '\n' +
                        '                  </ul>\n' +
                        '                </div>\n' +
                        '                <div class="col-lg-2 col-sm-6 follow-info weather-category">\n' +
                        '                  <ul>\n' +
                        '                    <li class="active">\n' +
                        '\n' +
                        '                      <i class="fa fa-bell fa-2x"> </i><br> On behalf of government, thank you for your contribution to the community\n' +
                        '                    </li>\n' +
                        '\n' +
                        '                  </ul>\n' +
                        '                </div>\n' +
                        '                <div class="col-lg-2 col-sm-6 follow-info weather-category">\n' +
                        '                  <ul>\n' +
                        '                    <li class="active">\n' +
                        '\n' +
                        '                      <i class="fa fa-tachometer fa-2x"> </i><br> If you have trouble signing up for a charity, please contact us\n' +
                        '                    </li>\n' +
                        '\n' +
                        '                  </ul>\n' +
                        '                </div>\n' +
                        '              </div>\n' +
                        '            </div>\n' +
                        '          </div>\n' +
                        '        </div>\n'+
                        '<br>'+
                        '</form:form>'
                    ,
                    allowEscapeKey : false,
                    closeOnClickOutside: false,
                    allowOutsideClick: false,
                    closeOnEsc: false,
                    width: '1000px'
                }).then((result) => {
                    if (result.value) {
                        window.location.href = "${logutToUpdate}";
                    }
                });
            },
            error: function (error) {
                swal(
                    'Fail!',
                    'Something wrong!',
                    'warning'

                ).then((result) => {
                    if (result.value) {
                        window.location.href = "${homeURL}";
                    }
                });
            }
        });
    }

</script>
<script>
    document.title="Assigning Charity"
</script>
</body>
</html>
