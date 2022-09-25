<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:url var="patientAPI" value="/api/patient"/>
<c:url var="patientURL" value="/admin/patient/list"/>
<c:url var="editURL" value="/admin/patient/edit"/>
<c:url var="newURL" value="/admin/patient/new"/>
<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">
    <title>Patient Management</title>

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
                        <h2>Patient Management</h2>
                        <p>Patient information</p>
                    </div>

                    <div class="widget-box table-filter">
                        <div class="table-btn-controls">
                            <div class="pull-right tableTools-container">
                                <div class="dt-buttons btn-overlap btn-group">
                                    <a flag="info"
                                       class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
                                       title='Add Patient' href='${newURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
                                    </a>

                                    <button id="btnDelete" type="button" onclick="acceptDelete()"
                                            class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Delete Patient'>
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
                                <th>bnX</th>
                                <th>bnY</th>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Status</th>
                                <th>Created_By</th>
                                <th>Modified_By</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="patientItem" items="${PATIENT_DTO.listDTO}">
                            <tr>
                                <td><input type="checkbox" id="checkbox_${patientItem.id}" value="${patientItem.id}"></td>
                                <td>${patientItem.bnX}</td>
                                <td>${patientItem.bnY}</td>
                                <td>${patientItem.code}</td>
                                <td>${patientItem.name}</td>
                                <td>${patientItem.address}</td>

                                <c:if test = "${patientItem.status == 0}">
                                    <th>Treating</th>
                                </c:if>

                                <c:if test = "${patientItem.status == 1}">
                                    <th>Recovered</th>
                                </c:if>

                                <c:if test = "${patientItem.status == -1}">
                                    <th>Death</th>
                                </c:if>


                                <td>${patientItem.createdBy}</td>
                                <td>${patientItem.modifiedBy}</td>
                                <td>
                                    <c:url var="updatePatient" value="${editURL}">
                                        <c:param name="id" value="${patientItem.id}"/>
                                    </c:url>
                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                       title="Update Patient" href='${updatePatient}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>Choose_Item</th>
                                <th>bnX</th>
                                <th>bnY</th>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Status</th>
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
                deleteArea(ids);
            }
        });
    }

    function deleteArea(data) {
        $.ajax({
            url: '${patientAPI}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                swal(
                    'Deleted!',
                    'Your patient has been deleted.',
                    'success'
                ).then((result) => {
                    window.location.href = "${patientURL}";
                });
            },
            error: function (error) {
                window.location.href = "${patientURL}?message=error_system";
            }
        });
    }
</script>
<script>
    document.title="Patient Management"
</script>
</body>

</html>