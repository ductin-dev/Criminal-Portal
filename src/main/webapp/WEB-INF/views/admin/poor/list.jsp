<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="poorAPI" value="/api/poor"/>
<c:url var="poorURL" value="/admin/poor/list"/>
<c:url var="editURL" value="/admin/poor/edit"/>
<c:url var="newURL" value="/admin/poor/new"/>
<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">
    <title>Poor List</title>

</head>

<body>
<!-- Data Table area Start-->
<form action="<c:url value='/admin/poor/list'/>" id="formSubmit" method="get">
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>Poor Management</h2>
                        <p>Poor information</p>
                    </div>

                    <div class="widget-box table-filter">
                        <div class="table-btn-controls">
                            <div class="pull-right tableTools-container">
                                <div class="dt-buttons btn-overlap btn-group">
                                    <a flag="info"
                                       class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
                                       title='Add Poor' href='${newURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
                                    </a>

                                    <button id="btnDelete" type="button" onclick="acceptDelete()"
                                            class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Delete Poor'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>

                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                            <tr>
                                <th>Choose_Item</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Detail</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Image</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="poorItem" items="${POOR_DTO.listDTO}">
                            <tr>
                                <td><input type="checkbox" id="checkbox_${poorItem.id}" value="${poorItem.id}"></td>
                                <td>${poorItem.name}</td>
                                <td>${poorItem.address}</td>
                                <td>${poorItem.detail}</td>
                                <td>${poorItem.phone}</td>

                                <c:if test = "${poorItem.status == 1}">
                                    <th ><font color="#00bf00"></font>Active</th>
                                </c:if>

                                <c:if test = "${poorItem.status == -1}">
                                    <th><font color="#ff0000"></font>Not_Activated</th>
                                </c:if>

                                <td><img src="data:image/png;base64, ${poorItem.base64}" width="150" height="150" alt="Image" /></td>

                                <td>
                                    <c:url var="updatePoor" value="/admin/poor/edit">
                                        <c:param name="id" value="${poorItem.id}"/>
                                    </c:url>
                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                       title="Update Poor" href='${updatePoor}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>Choose_Item</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Detail</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Image</th>
                                <th>Action</th>
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
<!-- Data Table area End-->

<script>
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
                deletePoor(ids);
            }
        });
    }

    function deletePoor(data) {
        $.ajax({
            url: '${poorAPI}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                swal(
                    'Deleted!',
                    'Poor has been deleted.',
                    'success'
                ).then((result) => {
                    window.location.href = "${poorURL}";
                });
            },
            error: function (error) {
                window.location.href = "${poorURL}?message=error_system";
            }
        });
    }
</script>
<script>
    document.title="List poor"
</script>
</body>

</html>