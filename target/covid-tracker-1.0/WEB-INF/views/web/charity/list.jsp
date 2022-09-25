<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<c:url var="charityAPI" value="/api/web/charity"/>
<c:url var="charityURL" value="/charity/custom/list"/>
<c:url var="editURL" value="/charity/custom/edit"/>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List Of Charity</title>
</head>

<body style="font-family: Arial, Sans-Serif,serif">


<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb" style="background: linear-gradient(to left, #F37335, #FDC830);
    font-size: 15px;
    font-weight: 700;
    color: cyan;">
            <li><i class="fa fa-home"></i><a style="color:white" href="<c:url value='/trang-chu'/>">List Charity</a></li>
        </ol>
    </div>
</div>


<!-- Today status end -->

    <div class="row">
        <div class="col-lg-9 col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>
                        <i class="fa fa-flag-o red"></i><strong>List Charity</strong>
                    </h2>
                </div>
                <div class="panel-body">
                    <table class="table bootstrap-datatable countries">
                        <thead>
                        <tr>
                            <th style="color:orange;border: 1px solid #ddd;padding: 8px; text-align: center" >Name</th>
                            <th style="color:orange; border: 1px solid #ddd;padding: 8px;text-align: center" >Address</th>
                            <th style="color:orange; border: 1px solid #ddd;padding: 8px;text-align: center" >Content</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="charityCustom" items="${CHARITY_DTO.listDTO}">
                            <tr>
                                <td style="border: 1px solid #ddd;padding: 8px;text-align: center">${charityCustom.name}</td>
                                <td style="border: 1px solid #ddd;padding: 8px;text-align: center">${charityCustom.address}</td>
                                <td style="border: 1px solid #ddd;padding: 8px;text-align: center">${charityCustom.content}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-3">

            <a href="https://www.facebook.com/satfomacej" target="_blank">
                <div class="social-box facebook" style="background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Capture.JPG?raw=true')">
                    <i class="fa fa-facebook">&nbsp;&nbsp;<span style="font-family: Arial">Tín</span></i>
                    <ul>
                        <li><strong>3560</strong> <span style="color:black;">friends</span></li>
                        <li><strong>594</strong> <span style="color:black;">followers</span></li>
                    </ul>
                </div></a>

            <a href="https://www.facebook.com/nhochiennhoc" target="_blank">
                <div class="social-box facebook" style="background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Capture2.JPG?raw=true')">
                    <i class="fa fa-facebook">&nbsp;&nbsp;<span style="font-family: Arial">Hiền</span></i>
                    <ul>
                        <li><strong>Private</strong> <span style="color:black;">friends</span></li>
                        <li><strong>Private</strong> <span style="color:black;">followers</span></li>
                    </ul>
                </div></a>

            <a href="https://www.facebook.com/huynx.dev.dn" target="_blank">
                <div class="social-box facebook" style="background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Captur2e.JPG?raw=true')">
                    <i class="fa fa-facebook">&nbsp;&nbsp;<span style="font-family: Arial">Huy</span></i>
                    <ul>
                        <li><strong>365</strong> <span style="color:black;">friends</span></li>
                        <li><strong>Private</strong> <span style="color:black;">followers</span></li>
                    </ul>
                </div></a>

            <a href="https://www.facebook.com/ShinCN2000" target="_blank">
                <div class="social-box facebook" style="background-image: url('https://github.com/satellite1012/SatelliteWebImage/blob/master/Cap22ture.JPG?raw=true')">
                    <i class="fa fa-facebook">&nbsp;&nbsp;<span style="font-family: Arial">Hưng</span></i>
                    <ul>
                        <li><strong>Private</strong> <span style="color:black;">friends</span></li>
                        <li><strong>Private</strong> <span style="color:black;">followers</span></li>
                    </ul>
                </div></a>
        </div>

    </div>

<script>
    document.title="List All Charity"
</script>
</body>
</html>