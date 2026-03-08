<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exams - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1 style="text-transform: uppercase;">Exams</h1>
            <a href="${pageContext.request.contextPath}/exams/add" class="btn btn-primary">Create Exam</a>
        </div>
        <table>
            <thead><tr><th>ID</th><th>Subject</th><th>Exam Name</th><th>Date</th><th>Actions</th></tr></thead>
            <tbody>
                <c:forEach var="e" items="${exams}">
                    <tr><td>${e.id}</td><td>${e.subjectName}</td><td>${e.name}</td><td>${e.examDate}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/exams/edit/${e.id}" class="btn btn-outline" style="margin-right: 0.5rem;">Edit</a>
                        <a href="${pageContext.request.contextPath}/exams/delete/${e.id}" class="btn btn-danger" onclick="return confirm('Delete?')">Delete</a>
                    </td></tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
