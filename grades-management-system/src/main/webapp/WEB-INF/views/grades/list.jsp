<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Grades - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1 style="text-transform: uppercase;">Grades</h1>
            <a href="${pageContext.request.contextPath}/grades/add" class="btn btn-primary">Add Grade</a>
        </div>
        <table>
            <thead><tr><th>ID</th><th>Student</th><th>Exam</th><th>Value</th><th>Corrector</th><th>Actions</th></tr></thead>
            <tbody>
                <c:forEach var="g" items="${grades}">
                    <tr><td>${g.id}</td><td>${g.studentName}</td><td>${g.examName}</td><td>${g.value}</td><td>${g.correctorName}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/grades/edit/${g.id}" class="btn btn-outline" style="margin-right: 0.5rem;">Edit</a>
                        <a href="${pageContext.request.contextPath}/grades/delete/${g.id}" class="btn btn-danger" onclick="return confirm('Delete?')">Delete</a>
                    </td></tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
