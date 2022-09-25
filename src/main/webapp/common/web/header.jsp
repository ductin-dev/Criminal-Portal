<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.covidtracker.util.SecurityUtils" %>
<c:url var="charityCustomURL" value="/charity/custom/list"/>

<header class="header dark-bg">
    <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
    </div>
    <img src="${pageContext.request.contextPath}/template/web/logo.png" alt="gg" style="width: 50px;position: absolute">
    <!--logo start-->
    <a href="<c:url value='/trang-chu'/> " class="logo" style="margin-top:10px;font-weight: 600;font-size:30px">

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Covid <span class="lite" style="font-weight: 600;font-size:30px">Tracker &nbsp; <span  style="color:white;font-size: 12px;font-weight: 500;font-family: Arial"> Resfes 2020&nbsp;&nbsp;&nbsp;</span></span></a>
    <!--logo end-->

    <div class="nav search-row" id="top_menu">
        <!--  search form start -->
        <ul class="nav top-menu">
            <li>
                <form class="navbar-form">
                    <input class="form-control" placeholder="Search" type="text" style="font-size: 20px">
                </form>
            </li>
        </ul>
        <!--  search form end -->
    </div>

    <div class="top-nav notification-row">
        <!-- notificatoin dropdown start-->
        <ul class="nav pull-right top-menu">

            <security:authorize access = "isAnonymous()">
                <li style="font-weight: 600;" class="nav-item"><a class="nav-link" href="<c:url value='/login'/>" >Login</a></li>
                <li  style="font-weight: 600;" class="nav-item"><a class="nav-link" href="<c:url value='/register'/>">Sign Up</a></li>
            </security:authorize>

            <security:authorize access = "isAuthenticated()">
                <!-- user login dropdown start-->
                <input type="hidden" id="userNameURL" value="<%=SecurityUtils.getPrincipal().getUsername()%>">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="profile-ava">
									<img alt="" src="<%=SecurityUtils.getPrincipal().getAvatar()%>" width="40" height="40">
								</span>
                        <span class="username" style="color:white;font-size: 19px;"><%=SecurityUtils.getPrincipal().getFullname()%></span>
                        <b class="caret"></b>
                    </a>

                    <ul class="dropdown-menu extended logout">
                        <div class="log-arrow-up"></div>
                        <li style="font-weight: 600;" class="eborder-top">
                            <a href="#"><i class="icon_profile"></i> PROFILE</a>
                        </li>

                        <security:authorize access = "hasAnyRole('ADMIN','MOD')">
                            <c:url var="listCustom" value="${charityCustomURL}">
                                <c:param name="userName" value="<%=SecurityUtils.getPrincipal().getUsername()%>"/>
                            </c:url>
                            <li style="font-weight: 600;">
                                <a href="<c:url value='${listCustom}'/>"><i class="icon_document"></i> MY CHARITY</a>
                            </li>
                        </security:authorize>

                        <security:authorize access = "hasAnyRole('USER')">

                            <li>
                                <c:url var="singUpCharity" value="/sign-up/charity">
                                    <c:param name="userName" value="<%=SecurityUtils.getPrincipal().getUsername()%>"/>
                                </c:url>

                                <a href="${singUpCharity}"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-basket" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10.243 1.071a.5.5 0 0 1 .686.172l3 5a.5.5 0 1 1-.858.514l-3-5a.5.5 0 0 1 .172-.686zm-4.486 0a.5.5 0 0 0-.686.172l-3 5a.5.5 0 1 0 .858.514l3-5a.5.5 0 0 0-.172-.686z"></path>
                                    <path fill-rule="evenodd" d="M1 7v1h14V7H1zM.5 6a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 .5.5h15a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 0-.5-.5H.5z"></path>
                                    <path fill-rule="evenodd" d="M14 9H2v5a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V9zM2 8a1 1 0 0 0-1 1v5a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V9a1 1 0 0 0-1-1H2z"></path>
                                    <path fill-rule="evenodd" d="M4 10a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3a.5.5 0 0 1 .5-.5z"></path>
                                </svg>&nbsp;&nbsp;&nbsp;&nbsp;SIGN UP CHARITY</a>

                            </li>

                        </security:authorize>

                        <li style="background-color: orangered;font-weight: 600">
                            <a href="<c:url value='/logout'/>"><i class="icon_key_alt"></i> Log Out</a>
                        </li>

                    </ul>

                </li>
                <!-- user login dropdown end -->
            </security:authorize>
        </ul>
        <!-- notificatoin dropdown end-->
    </div>
</header>
<!--header end-->