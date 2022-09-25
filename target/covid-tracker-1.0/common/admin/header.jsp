<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.covidtracker.util.SecurityUtils" %>

<div class="header-top-area" style="background-image: linear-gradient(90deg, rgba(120,70,22,1) 0%, rgba(21,13,2,1) 100%);">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <div class="logo-area">
                    <a id="agotohome" onmouseenter="changeColorA1A()" onmouseleave="changeColorA1B()" style="font-size: 22px;font-weight: 600;color: orange;" href="<c:url value='/trang-chu'/>"><img src="<c:url value= '/template/admin/img/logo/logo.jpg'/>" alt="" />
                        &nbsp;&nbsp;&nbsp;&nbsp;BACK TO HOME PAGE
                    </a>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="header-top-menu">
                    <ul class="nav navbar-nav notika-top-nav">
                        <li class="light-blue dropdown-modal">
                            <a href='<c:url value='/logout'/>' style="padding: 20px">
                                <i class="ace-icon fa fa-power-off"></i>
                                Log Out
                            </a>
                        </li>
                        <li class="light-blue dropdown-modal">
                            <a href='#' style="padding: 20px">
                                <i class=""></i>
                               Welcome, <%=SecurityUtils.getPrincipal().getFullname()%>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    function changeColorA1A(){
        document.getElementById("agotohome").style.color="white";
    }
    function changeColorA1B(){
        document.getElementById("agotohome").style.color="orange";
    }
</script>

