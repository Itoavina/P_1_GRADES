<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="../layout/header.jsp" />

<div class="content-container fade-in">
    <div class="page-header">
        <div class="page-header-info">
            <h2>RÉPERTOIRE CLIENTS</h2>
            <div class="page-subtitle">Gestion du registre des clients</div>
        </div>
        <a href="${pageContext.request.contextPath}/clients/create" class="btn btn-primary-custom">
            AJOUTER CLIENT
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-custom table-borderless">
            <thead>
                <tr>
                    <th style="width: 80px;">ID</th>
                    <th>ENTITÉ / NOM COMPLET</th>
                    <th>CONTACT</th>
                    <th class="text-end">ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="client" items="${clients}">
                    <tr>
                        <td class="font-mono" style="color: var(--text-muted);">#${client.id}</td>
                        <td class="fw-medium">${client.nom}</td>
                        <td>${client.contact}</td>
                        <td class="text-end" style="white-space: nowrap;">
                            <a href="${pageContext.request.contextPath}/clients/edit/${client.id}" 
                               class="btn btn-sm btn-outline-custom">ÉDITER</a>
                            <a href="${pageContext.request.contextPath}/clients/delete/${client.id}" 
                               class="btn btn-sm btn-danger-custom ms-2"
                               onclick="return confirm('Confirmer la suppression ?');">SUPPRIMER</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty clients}">
                    <tr>
                        <td colspan="4" class="empty-state">
                            Le registre est actuellement vide
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
