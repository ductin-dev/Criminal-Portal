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
    <title>Role List</title>

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
                        <h2>Role Management</h2>
                        <p>Role information</p>
                    </div>

                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                            <tr>
                                <th>Choose_Item</th>
                                <th>Name</th>
                                <th>Code</th>
                                <th>Created_By</th>
                                <th>Modified_By</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="roleItem" items="${ROLE_DTO.listDTO}">
                            <tr>
                                <td><input type="checkbox" id="checkbox_${roleItem.id}" value="${roleItem.id}"></td>
                                <td>${roleItem.name}</td>
                                <td>${roleItem.code}</td>
                                <td>${roleItem.createdBy}</td>
                                <td>${roleItem.modifiedBy}</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>Choose_Item</th>
                                <th>Name</th>
                                <th>Code</th>
                                <th>Created_By</th>
                                <th>Modified_By</th>
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
    document.title="Role List"
</script>

</body>

</html>