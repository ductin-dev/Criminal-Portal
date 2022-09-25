<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%--reset if user login by other account--%>
<c:set var="notShow" value="0" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>

<body>

<div class="container-login100" style="float:right;background-color:#ff4e00;background-image:linear-gradient(315deg, #ff4e00 0%, #ec9f05 74%);
">
    <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30" style="padding:0px;left: 8%;position: absolute;width: 750px;height: max-content;object-fit: cover;opacity: 0.8;">

                <script src="https://apps.elfsight.com/p/platform.js" defer></script>
                <div class="elfsight-app-c36a5ad1-e8ae-4817-a180-ac87fdda3c74"></div>

    </div>

    <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30" style="right:8%;position: absolute;">
        <form action="j_spring_security_check" id="formLogin" method="post" class="login100-form validate-form">
				<span class="login100-form-title p-b-37" style="color: orange;">
					Sign In
				</span>

            <c:if test="${param.incorrectAccount != null}">
                <div class="alert alert-danger">
                    Username or password incorrect
                </div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">
                    You not permission
                </div>
            </c:if>

            <div class="wrap-input100 validate-input m-b-20" data-validate="Enter username">
                <input class="input100" type="text" id="userName" name="j_username" placeholder="Enter username">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input m-b-25" data-validate = "Enter password">
                <input class="input100" type="password" id="password" name="j_password" placeholder="Enter password">
                <span class="focus-input100"></span>
            </div>

            <div class="container-login100-form-btn">
                <button class="login100-form-btn" type="submit" style="background-color: darkorange">Sign In</button>
            </div>

            <div class="text-center p-t-57 p-b-20">
					<span class="txt1">
						Or login with
					</span>
            </div>

            <div class="flex-c p-b-112">
                <a href="#" class="login100-social-item">
                    <i class="fa fa-facebook-f" style="color:gray;"></i>
                </a>

                <a href="#" class="login100-social-item"><i class="fa fa-google" style="color:gray;"></i>
                </a>
            </div>

            <div class="text-center">
                <a href="<c:url value='/register'/>" class="txt2 hov1">
                    Sign Up
                </a>
            </div>
        </form>


    </div>
</div>

<div id="dropDownSelect1"></div>

</body>

</html>