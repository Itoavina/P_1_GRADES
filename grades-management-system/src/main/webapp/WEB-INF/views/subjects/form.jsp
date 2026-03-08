<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Subject Registry - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="form-container">
        <h2 style="margin-bottom: 2rem; text-transform: uppercase;">Subjects</h2>
        <form:form action="${pageContext.request.contextPath}/subjects/save" method="post" modelAttribute="subject">
            <form:hidden path="id" />
            <div class="form-group">
                <label>Name</label>
                <form:input path="name" required="true" />
            </div>
            <div class="form-group">
                <label>Coefficient</label>
                <form:input path="coefficient" type="number" step="0.1" required="true" />
            </div>
            <button type="submit" class="btn btn-primary" style="width: 100%; padding: 1rem;">Commit</button>
            <a href="${pageContext.request.contextPath}/subjects" class="btn btn-outline" style="width: 100%; margin-top: 1rem; text-align: center;">Cancel</a>
        </form:form>
    </div>
</body>
</html>
