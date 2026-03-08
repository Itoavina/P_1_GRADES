<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Grade Registry - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="form-container">
        <h2 style="margin-bottom: 2rem; text-transform: uppercase;">Grades</h2>
        <form:form action="${pageContext.request.contextPath}/grades/save" method="post" modelAttribute="grade">
            <form:hidden path="id" />
            <div class="form-group">
                <label>Student</label>
                <form:select path="idStudent">
                    <form:options items="${students}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>
            <div class="form-group">
                <label>Exam</label>
                <form:select path="idExam">
                    <form:options items="${exams}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>
            <div class="form-group">
                <label>Value</label>
                <form:input path="value" type="number" step="0.01" required="true" />
            </div>
            <div class="form-group">
                <label>Corrector</label>
                <form:select path="idCorrector">
                    <form:options items="${correctors}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>
            <button type="submit" class="btn btn-primary" style="width: 100%; padding: 1rem;">Commit</button>
            <a href="${pageContext.request.contextPath}/grades" class="btn btn-outline" style="width: 100%; margin-top: 1rem; text-align: center;">Cancel</a>
        </form:form>
    </div>
</body>
</html>
