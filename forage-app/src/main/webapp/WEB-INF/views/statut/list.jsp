<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="../layout/header.jsp" />

<div class="content-container fade-in">
    <div class="page-header">
        <div class="page-header-info">
            <h2>RÉFÉRENTIEL DES STATUTS</h2>
            <div class="page-subtitle">Gestion des états du cycle de vie</div>
        </div>
        <a href="${pageContext.request.contextPath}/statuts/create" class="btn btn-primary-custom">
            NOUVEAU STATUT
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-custom table-borderless">
            <thead>
                <tr>
                    <th style="width: 80px;">ID</th>
                    <th>LIBELLÉ</th>
                    <th class="text-end">ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="statut" items="${statuts}">
                    <tr>
                        <td class="font-mono" style="color: var(--text-muted);">#${statut.id}</td>
                        <td class="fw-medium">${statut.libelle}</td>
                        <td class="text-end">
                            <a href="${pageContext.request.contextPath}/statuts/edit/${statut.id}" 
                               class="btn btn-sm btn-outline-custom">ÉDITER</a>
                            <a href="${pageContext.request.contextPath}/statuts/delete/${statut.id}" 
                               class="btn btn-sm btn-danger-custom ms-2"
                               onclick="return confirm('Confirmer la suppression du statut ?');">SUPPRIMER</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty statuts}">
                    <tr>
                        <td colspan="3" class="empty-state">
                            Aucun statut enregistré
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
