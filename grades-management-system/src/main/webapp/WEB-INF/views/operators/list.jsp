<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Operators - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1 style="text-transform: uppercase;">Operators</h1>
            <a href="${pageContext.request.contextPath}/operators/add" class="btn btn-primary">Add Operator</a>
        </div>
        <table>
            <thead><tr><th>ID</th><th>Name</th><th>Symbol/Logic</th><th>Actions</th></tr></thead>
            <tbody>
                <c:forEach var="o" items="${operators}">
                    <tr><td>${o.id}</td><td>${o.name}</td><td>${o.symbol}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/operators/edit/${o.id}" class="btn btn-outline" style="margin-right: 0.5rem;">Edit</a>
                        <a href="${pageContext.request.contextPath}/operators/delete/${o.id}" class="btn btn-danger" onclick="return confirm('Delete?')">Delete</a>
                    </td></tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
