<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Students - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>

    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1 style="text-transform: uppercase; letter-spacing: 2px;">Students</h1>
            <a href="${pageContext.request.contextPath}/students/add" class="btn btn-primary">Add Student</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/students/edit/${student.id}" class="btn btn-outline" style="margin-right: 0.5rem;">Edit</a>
                            <a href="${pageContext.request.contextPath}/students/delete/${student.id}" 
                               class="btn btn-danger" 
                               onclick="return confirm('Confirm deletion of records?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty students}">
                    <tr>
                        <td colspan="3" style="text-align: center; color: var(--text-secondary); padding: 4rem;">
                            NO_DATA_FOUND: Please initialize student records.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
