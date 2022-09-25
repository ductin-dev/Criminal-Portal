<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="areaAPI" value="/api/area"/>
<c:url var="areaURL" value="/admin/area/list"/>
<c:url var="editURL" value="/admin/area/edit"/>
<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">
    <title>User List</title>

</head>

<body>
<!-- Data Table area Start-->
<form action="<c:url value='/admin/area/list'/>" id="formSubmit" method="get">
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>User Management</h2>
                        <p>User information</p>
                    </div>

                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                            <tr>
                                <th>Choose_Item</th>
                                <th>Username</th>
                                <th>Full Name</th>
                                <th>Password</th>
                                <th>Roles</th>
                                <th>Avatar</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="userItem" items="${USER_DTO.listDTO}">
                            <tr>
                                <td><input type="checkbox" id="checkbox_${userItem.id}" value="${userItem.id}"></td>
                                <td>${userItem.userName}</td>
                                <td>${userItem.fullname}</td>
                                <td>${userItem.password}</td>
                                <td>${userItem.nameRole}</td>
                                <td><img src="${userItem.avatar}" alt="Avatar" width="150" height="150"></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>Choose_Item</th>
                                <th>Username</th>
                                <th>Full Name</th>
                                <th>Password</th>
                                <th>Roles</th>
                                <th>Avatar</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</form>
<script>
    document.title="User List"
</script>
</body>

</html>