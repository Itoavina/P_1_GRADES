<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Correctors - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1 style="text-transform: uppercase; letter-spacing: 2px;">Correctors</h1>
            <a href="${pageContext.request.contextPath}/correctors/add" class="btn btn-primary">Add Corrector</a>
        </div>
        <table>
            <thead><tr><th>ID</th><th>Name</th><th>Actions</th></tr></thead>
            <tbody>
                <c:forEach var="c" items="${correctors}">
                    <tr><td>${c.id}</td><td>${c.name}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/correctors/edit/${c.id}" class="btn btn-outline" style="margin-right: 0.5rem;">Edit</a>
                        <a href="${pageContext.request.contextPath}/correctors/delete/${c.id}" class="btn btn-danger" onclick="return confirm('Delete?')">Delete</a>
                    </td></tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
