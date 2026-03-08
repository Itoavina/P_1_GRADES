<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Subjects - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1 style="text-transform: uppercase;">Subjects</h1>
            <a href="${pageContext.request.contextPath}/subjects/add" class="btn btn-primary">Add Subject</a>
        </div>
        <table>
            <thead><tr><th>ID</th><th>Subject Name</th><th>Coefficient</th><th>Actions</th></tr></thead>
            <tbody>
                <c:forEach var="s" items="${subjects}">
                    <tr><td>${s.id}</td><td>${s.name}</td><td>${s.coefficient}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/subjects/edit/${s.id}" class="btn btn-outline" style="margin-right: 0.5rem;">Edit</a>
                        <a href="${pageContext.request.contextPath}/subjects/delete/${s.id}" class="btn btn-danger" onclick="return confirm('Delete?')">Delete</a>
                    </td></tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
