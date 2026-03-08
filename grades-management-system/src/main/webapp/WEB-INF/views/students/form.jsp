<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Data Entry - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>

    <div class="form-container">
        <h2 style="margin-bottom: 2rem; text-transform: uppercase; letter-spacing: 1px;">
            ${student.id == null ? 'Initialize' : 'Update'} Record
        </h2>
        
        <form:form action="${pageContext.request.contextPath}/students/save" method="post" modelAttribute="student">
            <form:hidden path="id" />
            
            <div class="form-group">
                <label>Student Name</label>
                <form:input path="name" placeholder="Legal full name" required="true" />
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%; padding: 1rem; margin-top: 1rem;">
                Commit Changes
            </button>
            <a href="${pageContext.request.contextPath}/students" class="btn btn-outline" style="width: 100%; margin-top: 1rem; text-align: center;">
                Cancel
            </a>
        </form:form>
    </div>
</body>
</html>
