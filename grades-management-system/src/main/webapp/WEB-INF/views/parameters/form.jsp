<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Parameter Registry - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    <div class="form-container">
        <h2 style="margin-bottom: 2rem; text-transform: uppercase;">Parameters</h2>
        <form:form action="${pageContext.request.contextPath}/parameters/save" method="post" modelAttribute="parameter">
            <form:hidden path="id" />
            <div class="form-group">
                <label>Subject</label>
                <form:select path="idSubject">
                    <form:options items="${subjects}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>
            <div class="form-group" style="display: flex; gap: 1rem;">
                <div style="flex: 1;">
                    <label>Min Value</label>
                    <form:input path="minValue" type="number" step="0.01" required="true" />
                </div>
                <div style="flex: 1;">
                    <label>Max Value</label>
                    <form:input path="maxValue" type="number" step="0.01" required="true" />
                </div>
            </div>
            <div class="form-group">
                <label>Operator</label>
                <form:select path="idOperator">
                    <form:options items="${operators}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>
            <button type="submit" class="btn btn-primary" style="width: 100%; padding: 1rem;">Commit</button>
            <a href="${pageContext.request.contextPath}/parameters" class="btn btn-outline" style="width: 100%; margin-top: 1rem; text-align: center;">Cancel</a>
        </form:form>
    </div>
</body>
</html>
