<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Parameters - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1 style="text-transform: uppercase;">Parameters</h1>
            <a href="${pageContext.request.contextPath}/parameters/add" class="btn btn-primary">Add Parameter</a>
        </div>
        <table>
            <thead><tr><th>ID</th><th>Subject</th><th>Condition</th><th>Operator</th><th>Actions</th></tr></thead>
            <tbody>
                <c:forEach var="p" items="${parameters}">
                    <tr><td>${p.id}</td><td>${p.subjectName}</td><td>${p.comparisonSymbol} ${p.limitValue}</td><td>${p.operatorName}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/parameters/edit/${p.id}" class="btn btn-outline" style="margin-right: 0.5rem;">Edit</a>
                        <a href="${pageContext.request.contextPath}/parameters/delete/${p.id}" class="btn btn-danger" onclick="return confirm('Delete?')">Delete</a>
                    </td></tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
