<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="../layout/header.jsp" />

<div class="content-container fade-in">
    <div class="page-header">
        <div class="page-header-info">
            <h2>REGISTRE DES DEMANDES</h2>
            <div class="page-subtitle">Suivi des demandes d'intervention</div>
        </div>
        <a href="${pageContext.request.contextPath}/demandes/create" class="btn btn-primary-custom">
            NOUVELLE DEMANDE
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-custom table-borderless">
            <thead>
                <tr>
                    <th style="width: 70px;">ID</th>
                    <th>CLIENT</th>
                    <th>DATE</th>
                    <th>STATUT</th>
                    <th>LIEU</th>
                    <th>DESCRIPTION</th>
                    <th class="text-end">ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="demande" items="${demandes}">
                    <tr>
                        <td class="font-mono" style="color: var(--text-muted);">#${demande.id}</td>
                        <td class="fw-bold">${demande.client.nom}</td>
                        <td>${demande.dateDemande}</td>
                        <td>
                            <c:set var="status" value="${demande.currentStatut}" />
                            <span class="status-pill ${status == 'EN ATTENTE' || status == 'en attente' ? 'status-pill--default' : 'status-pill--active'}">
                                <c:out value="${status != null ? status : 'EN ATTENTE'}" />
                            </span>
                        </td>
                        <td>${demande.lieu}</td>
                        <td style="max-width: 220px;" class="text-truncate">${demande.description}</td>
                        <td class="text-end" style="white-space: nowrap;">
                            <a href="${pageContext.request.contextPath}/demandes/edit/${demande.id}" 
                               class="btn btn-sm btn-outline-custom">ÉDITER</a>
                            <a href="${pageContext.request.contextPath}/demandes/delete/${demande.id}" 
                               class="btn btn-sm btn-danger-custom ms-2"
                               onclick="return confirm('Confirmer la suppression de la demande ?');">SUPPRIMER</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty demandes}">
                    <tr>
                        <td colspan="7" class="empty-state">
                            Aucune demande enregistrée
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
