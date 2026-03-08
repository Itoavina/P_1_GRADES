<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exam Registry - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="form-container">
        <h2 style="margin-bottom: 2rem; text-transform: uppercase;">Exams</h2>
        <form:form action="${pageContext.request.contextPath}/exams/save" method="post" modelAttribute="exam">
            <form:hidden path="id" />
            <div class="form-group">
                <label>Subject</label>
                <form:select path="idSubject">
                    <form:options items="${subjects}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>
            <div class="form-group">
                <label>Name</label>
                <form:input path="name" required="true" />
            </div>
            <div class="form-group">
                <label>Date</label>
                <form:input path="examDate" type="date" required="true" />
            </div>
            <button type="submit" class="btn btn-primary" style="width: 100%; padding: 1rem;">Commit</button>
            <a href="${pageContext.request.contextPath}/exams" class="btn btn-outline" style="width: 100%; margin-top: 1rem; text-align: center;">Cancel</a>
        </form:form>
    </div>
</body>
</html>
