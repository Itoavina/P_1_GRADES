<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Operator Configuration - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="form-container">
        <h2 style="margin-bottom: 2rem; text-transform: uppercase;">Operators</h2>
        <form:form action="${pageContext.request.contextPath}/operators/save" method="post" modelAttribute="operator">
            <form:hidden path="id" />
            <div class="form-group">
                <label>Name (e.g. Highest)</label>
                <form:input path="name" required="true" />
            </div>
            <div class="form-group">
                <label>Symbol/Logic (e.g. >)</label>
                <form:input path="symbol" required="true" />
            </div>
            <button type="submit" class="btn btn-primary" style="width: 100%; padding: 1rem;">Commit</button>
            <a href="${pageContext.request.contextPath}/operators" class="btn btn-outline" style="width: 100%; margin-top: 1rem; text-align: center;">Cancel</a>
        </form:form>
    </div>
</body>
</html>
