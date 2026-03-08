<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Grading Simulation - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    
    <div class="container">
        <header style="margin-bottom: 3rem;">
            <h1 style="text-transform: uppercase; letter-spacing: 2px;">Grading Simulation</h1>
            <p style="color: var(--text-secondary);">Calculate final grades based on sum of differences and parameter mapping.</p>
        </header>

        <div class="form-container" style="margin: 0; max-width: 600px;">
            <form action="${pageContext.request.contextPath}/simulation/calculate" method="post">
                <div class="form-group">
                    <label>Select Student</label>
                    <select name="idStudent" required>
                        <c:forEach var="s" items="${students}">
                            <option value="${s.id}">${s.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Select Exam</label>
                    <select name="idExam" required>
                        <c:forEach var="e" items="${exams}">
                            <option value="${e.id}">${e.name} (${e.subjectName})</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary" style="width: 100%; padding: 1rem;">Run Simulation</button>
            </form>
        </div>
    </div>
</body>
</html>
