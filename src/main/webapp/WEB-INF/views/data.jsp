
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<div class="container mt-4">
    <div class="row mt-4">
        <div class="col">
            <h3 class="my-4">Welcome ${username}</h3>

            <div class="card card-primary">
                <div class="card-header">Pass Percentage for Each Department</div>
                <div class="card-body">

                    <table class="table table-striped table-bordered">
                        <tr>
                            <th>Department</th>
                            <th>Student ID</th>
                            <th>Marks</th>
                            <th>Pass %</th>
                        </tr>
                        <c:forEach var="department"  items="${departments}" varStatus="status">
                            <tr>
                                <td align="center" valign="middle">${department}</td>
                                <td style="padding-left:0; padding-right: 0; padding-bottom: 0">
                                    <table class="table mb-0">

                                        <c:forEach var="student"  items="${students}" varStatus="num">
                                            <c:choose>
                                                <c:when test="${student.department == department}">
                                                    <tr>
                                                        <td onclick="openModal(this)"
                                                            id="${student.studentId}"
                                                            data-student-name="${student.studentName}"
                                                            data-mark="${student.marks}"
                                                            style="cursor: pointer">
                                                                ${student.studentId}
                                                        </td>
                                                    </tr>
                                                </c:when>
                                            </c:choose>

                                        </c:forEach>
                                    </table>
                                </td>
                                <td style="padding-left:0; padding-right: 0; padding-bottom: 0">
                                    <table class="table mb-0">

                                        <c:forEach var="student"  items="${students}">
                                            <c:choose>
                                                <c:when test="${student.department == department}">
                                                    <tr>
                                                        <td>${student.marks}</td>
                                                    </tr>
                                                </c:when>
                                            </c:choose>

                                        </c:forEach>
                                    </table>
                                </td>
                                <td align="center" valign="middle">${Math.round(passPercentages[status.index])}</td>
                            </tr>
                        </c:forEach>
                    </table>

                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <table class="table">
                                        <tr>
                                            <th>Student Name</th>
                                            <th>Pass</th>
                                        </tr>
                                        <tr>
                                            <td id="studentName"></td>
                                            <td id="studentPass"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="text-end"><a href="/logout">Logout</a></div>

        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script>
    function openModal(e){
        const studentName = e.dataset.studentName;
        const mark = e.dataset.mark;
        console.log("EVEN", e, studentName, mark)

        const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
        myModal.show();

        const myModalEl = document.getElementById('exampleModal')
        myModalEl.addEventListener('shown.bs.modal', event => {
            document.getElementById("studentName").innerText = studentName;
            document.getElementById("studentPass").innerHTML = mark >= 40 ? "<span style='color: green'>Pass</span>" : "<span style='color: red'>Fail</span>";
        })
    }
</script>
</body>
</html>

