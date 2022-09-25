<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="charityAPI" value="/api/charity"/>
<c:url var="charityURL" value="/admin/charity/list"/>
<c:url var="editURL" value="/admin/charity/edit"/>
<c:url var="newURL" value="/admin/charity/new"/>
<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">
    <title>Charity List</title>

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
                        <h2>Charity Management</h2>
                        <p>Charity information</p>
                    </div>

                    <div class="widget-box table-filter">
                        <div class="table-btn-controls">
                            <div class="pull-right tableTools-container">
                                <div class="dt-buttons btn-overlap btn-group">

                                    <a flag="info"
                                       class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
                                       title='Add Charity' href='${newURL}'>
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
                    <br>

                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                            <tr>
                                <th>Choose_Item</th>
                                <th>cX</th>
                                <th>cY</th>
                                <th>cName</th>
                                <th>cAddress</th>
                                <th>cContent</th>
                                <th>Created_By</th>
                                <th>Modified_By</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="charityItem" items="${CHARITY_DTO.listDTO}">
                            <tr>
                                <td><input type="checkbox" id="checkbox_${charityItem.id}" value="${charityItem.id}"></td>
                                <td>${charityItem.cX}</td>
                                <td>${charityItem.cY}</td>
                                <td>${charityItem.name}</td>
                                <td>${charityItem.address}</td>
                                <td>${charityItem.content}</td>
                                <td>${charityItem.createdBy}</td>
                                <td>${charityItem.modifiedBy}</td>
                                <td>
                                    <c:url var="updateArea" value="${editURL}">
                                        <c:param name="id" value="${charityItem.id}"/>
                                    </c:url>
                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                       title="Update Charity" href='${updateArea}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>Choose_Item</th>
                                <th>cX</th>
                                <th>cY</th>
                                <th>cName</th>
                                <th>cAddress</th>
                                <th>cContent</th>
                                <th>Created_By</th>
                                <th>Modified_By</th>
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
                deleteCharity(ids);
            }
        });
    }

    function deleteCharity(data) {
        $.ajax({
            url: '${charityAPI}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                swal(
                    'Deleted!',
                    'Your charity has been deleted.',
                    'success'
                ).then((result) => {
                    window.location.href = "${charityURL}";
                });
            },
            error: function (error) {
                window.location.href = "${charityURL}?message=error_system";
            }
        });
    }
</script>
<script>
    document.title="Charity List"
</script>
</body>

</html>