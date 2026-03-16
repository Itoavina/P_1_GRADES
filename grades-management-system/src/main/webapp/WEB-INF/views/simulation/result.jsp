<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simulation Result - Grades.OS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
    <style>
        .result-section { background: var(--bg-card); border: 1px solid var(--border); padding: 2rem; border-radius: 4px; margin-bottom: 2rem; }
        .data-label { font-size: 0.75rem; color: var(--text-secondary); text-transform: uppercase; display: block; margin-bottom: 0.25rem; }
        .data-value { font-size: 1.25rem; font-weight: 700; margin-bottom: 1.5rem; display: block; }
        .grade-chip { display: inline-block; background: var(--bg-main); border: 1px solid var(--border); padding: 0.5rem 1rem; border-radius: 2px; margin-right: 0.5rem; }
        .final-grade-box { text-align: center; border: 2px solid var(--accent); padding: 2rem; margin-top: 1rem; }
    </style>
</head>
<body>
    <%@ include file="../fragments/navbar.jsp" %>
    
    <div class="container">
        <header style="margin-bottom: 2rem;">
            <h1 style="text-transform: uppercase;">Simulation Result</h1>
            <p><a href="${pageContext.request.contextPath}/simulation" style="color: var(--text-secondary);">&larr; Back to Selection</a></p>
        </header>

        <c:choose>
            <c:when test="${empty result.originalGrades}">
                <div class="status fail">
                    NO_DATA_LINK: No grades recorded for ${result.student.name} in exam ${result.exam.name}.
                </div>
            </c:when>
            <c:otherwise>
                <div class="grid">
                    <div class="result-section">
                        <span class="data-label">Subject & Exam</span>
                        <span class="data-value">${result.exam.subjectName} / ${result.exam.name}</span>
                        
                        <span class="data-label">Individual Grades Found</span>
                        <div style="margin-bottom: 1.5rem;">
                            <c:forEach var="g" items="${result.originalGrades}">
                                <div class="grade-chip">${g.value} <span style="font-size: 0.6rem; color: var(--text-secondary);">(${g.correctorName})</span></div>
                            </c:forEach>
                        </div>

                        <span class="data-label">Sum of Differences (Delta)</span>
                        <span class="data-value">${result.sumOfDifferences}</span>
                    </div>

                    <div class="result-section">
                        <span class="data-label">Matching Parameter Range</span>
                        <span class="data-value">
                            <c:choose>
                                <c:when test="${not empty result.matchingParameter}">
                                    Logic: ${result.matchingParameter.operatorName} | Condition: ${result.matchingParameter.comparisonSymbol} ${result.matchingParameter.limitValue}
                                </c:when>
                                <c:otherwise>None (Default Applied)</c:otherwise>
                            </c:choose>
                        </span>

                        <span class="data-label">Operator Applied</span>
                        <span class="data-value">${result.operatorApplied}</span>

                        <div class="final-grade-box">
                            <span class="data-label">Calculated Final Grade</span>
                            <span style="font-size: 3.5rem; font-weight: 900; line-height: 1;">${result.finalGrade}</span>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
