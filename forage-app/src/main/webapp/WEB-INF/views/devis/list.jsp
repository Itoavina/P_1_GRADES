<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<jsp:include page="../layout/header.jsp" />

<div class="content-container fade-in">
    <div class="page-header">
        <div class="page-header-info">
            <h2>GESTION DES DEVIS</h2>
            <div class="page-subtitle">Module de Tarification Corporate</div>
        </div>
        <a href="${pageContext.request.contextPath}/devis/create" class="btn btn-primary-custom">
            + NOUVEAU DEVIS
        </a>
    </div>

    <div class="mb-4 font-mono" style="font-size: 0.9rem; color: var(--text-secondary);">
        Chiffre d'affaire : <strong><fmt:formatNumber value="${totalChiffreAffaire}" type="number" minFractionDigits="2" maxFractionDigits="2" /></strong> Ar
    </div>

    <div class="table-responsive">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th style="width: 70px;">ID</th>
                    <th>Client & Demande</th>
                    <th>Type Devis</th>
                    <th>Date Émission</th>
                    <th>Montant Total</th>
                    <th>Statut</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="devis" items="${devisList}">
                    <tr>
                        <td class="font-mono" style="color: var(--text-muted);">#${devis.id}</td>
                        <td>
                            <div class="fw-bold">${devis.demande.client.nom}</div>
                            <div style="color: var(--text-muted); font-size: 0.8rem;" class="text-truncate" 
                                 title="${devis.demande.description}">
                                ${devis.demande.description}
                            </div>
                        </td>
                        <td>
                            <span style="font-size:0.78rem; letter-spacing:0.3px; color: var(--text-secondary);">
                                ${devis.typeDevis.libelle}
                            </span>
                        </td>
                        <td>
                            <fmt:formatDate value="${devis.dateDevis}" pattern="dd MMM yyyy" />
                        </td>
                        <td class="font-mono fw-bold">
                            <fmt:formatNumber value="${devis.total}" type="number" minFractionDigits="2" maxFractionDigits="2" /> Ar
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${devis.statut.libelle == 'Approuvé'}">
                                    <span class="status-pill" style="color: #66bb6a; border: 1px solid rgba(102,187,106,0.4);">APPROUVÉ</span>
                                </c:when>
                                <c:when test="${devis.statut.libelle == 'En attente' || devis.statut.libelle == 'en attente'}">
                                    <span class="status-pill status-pill--default">EN ATTENTE</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-pill status-pill--active">${devis.statut.libelle}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-end" style="white-space: nowrap;">
                            <a href="${pageContext.request.contextPath}/devis/edit/${devis.id}" 
                               class="btn btn-outline-custom btn-sm">MODIFIER</a>
                            <a href="${pageContext.request.contextPath}/devis/delete/${devis.id}" 
                               class="btn btn-danger-custom btn-sm ms-2"
                               onclick="return confirm('Supprimer définitivement ce devis ?')">EFFACER</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty devisList}">
                    <tr>
                        <td colspan="7" class="empty-state">
                            Aucune donnée de tarification disponible.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
