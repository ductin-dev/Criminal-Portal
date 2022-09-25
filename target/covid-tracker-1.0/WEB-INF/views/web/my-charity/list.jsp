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
    <title>Custom Charity</title>
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
<form action="<c:url value='/charity/custom/list'/>" id="formSubmit" method="get">
<div class="row">
    <div class="col-lg-9 col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2>
                    <i class="fa fa-flag-o red"></i><strong>Your List Charity</strong>
                </h2>
            </div>
            <div class="widget-box table-filter">
                <div class="table-btn-controls">
                    <div class="pull-right tableTools-container">
                        <div class="dt-buttons btn-overlap btn-group">

                            <a flag="info"
                               class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
                               title='Add Charity' href='${editURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
                            </a>

                            <button id="btnDelete" type="button" onclick="acceptDelete()"
                                    class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Delete Charity'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <table class="table bootstrap-datatable countries">
                    <thead>
                    <tr>
                        <th style="color:orange;" >Choose_Item</th>
                        <th style="color:orange;" >Name</th>
                        <th style="color:orange;" >Address</th>
                        <th style="color:orange;" >Content</th>
                        <th style="color:orange;" >Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="charityCustom" items="${CHARITY_CUSTOM.listDTO}">
                        <tr>
                            <td><input type="checkbox" id="checkbox_${charityCustom.id}" value="${charityCustom.id}"></td>
                            <td>${charityCustom.name}</td>
                            <td>${charityCustom.address}</td>
                            <td>${charityCustom.content}</td>
                            <td>
                                <c:url var="updateCharity" value="${editURL}">
                                    <c:param name="id" value="${charityCustom.id}"/>
                                </c:url>
                                <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                   title="Update Charity" href='${updateCharity}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                </a>
                            </td>
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
</form>

<script>


    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    var username = getParameterByName('userName');

    function processing(){
        swal({
            title: 'Processing',
            text: "Please wait a minute...",
            timer: 3000,
            showCancelButton: false,
            showConfirmButton: false,
            allowOutsideClick: false,
            closeOnClickOutside: false
        })
    }

    function acceptDelete(){
        swal({
            title: 'Confirm To Delete',
            text: "Are you sure you want to delete?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.value) {
                var ids = $('tbody input[type=checkbox]:checked').map(function () {
                    return $(this).val();
                }).get();
                processing();
                deleteCharity(ids);
            }
        });
    }

    function deleteCharity(data) {
        $.ajax({
            url: '${charityAPI}',
            type: 'DELETE',
            contentType: 'application/json',
            allowOutsideClick: false,
            data: JSON.stringify(data),
            success: function (result) {
                swal(
                    'Deleted!',
                    'Your charity has been deleted.',
                    'success'
                ).then((result) => {
                    window.location.href = "${charityURL}?userName="+username;
                });
            },
            error: function (error) {
                window.location.href = "${charityURL}?message=error_system";
            }
        });
    }

</script>
<script>
    document.title="Your Charity"
</script>
</body>
</html>