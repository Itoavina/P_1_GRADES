<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Grade Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="fragments/navbar.jsp" %>

    <div class="container">
        <header style="margin-bottom: 4rem; text-align: left;">
            <h1 style="font-size: 3rem; font-weight: 900; letter-spacing: -1px;">DASHBOARD</h1>
            <p style="color: var(--text-secondary);">${message}</p>
        </header>

        <div class="grid">
            <a href="${pageContext.request.contextPath}/students" class="card">
                <h3>Students</h3>
                <p>Registry of identified students and academic profiles.</p>
            </a>
            <a href="${pageContext.request.contextPath}/correctors" class="card">
                <h3>Correctors</h3>
                <p>Authorized personnel for evaluation and validation.</p>
            </a>
            <a href="${pageContext.request.contextPath}/subjects" class="card">
                <h3>Subjects</h3>
                <p>Curriculum modules and credit weightings.</p>
            </a>
            <a href="${pageContext.request.contextPath}/exams" class="card">
                <h3>Exams</h3>
                <p>Scheduled assessments and testing sessions.</p>
            </a>
            <a href="${pageContext.request.contextPath}/operators" class="card">
                <h3>Operators</h3>
                <p>Logic identifiers for grading computation.</p>
            </a>
            <a href="${pageContext.request.contextPath}/parameters" class="card">
                <h3>Parameters</h3>
                <p>Control ranges for automated grade processing.</p>
            </a>
            <a href="${pageContext.request.contextPath}/grades" class="card">
                <h3>Grades</h3>
                <p>Consolidated academic results and records.</p>
            </a>
        </div>

        <div class="status ${dbStatus.contains('Failed') ? 'fail' : 'success'}">
            SYSTEM_DB_LINK: ${dbStatus}
        </div>
    </div>
</body>
</html>
