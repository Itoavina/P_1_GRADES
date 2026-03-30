<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<jsp:include page="../layout/header.jsp" />

<div class="content-container animate-fade-in">
    <div class="d-flex justify-content-between align-items-end mb-5">
        <div>
            <h1 class="mb-1" style="font-size: 2.5rem; letter-spacing: -1px;">GESTION DES DEVIS</h1>
            <p class="text-muted mb-0 font-monospace small">Module de Tarification Corporate</p>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/devis/create" class="btn btn-primary-custom px-4 py-2">
                + NOUVEAU DEVIS
            </a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th style="width: 80px;">ID</th>
                    <th>Client & Demande</th>
                    <th>Type Devis</th>
                    <th>Date Émission</th>
                    <th>Statut</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="devis" items="${devisList}">
                    <tr>
                        <td class="font-monospace small text-muted">#${devis.id}</td>
                        <td>
                            <div class="fw-bold text-white">${devis.demande.client.nom}</div>
                            <div class="text-muted small text-truncate" style="max-width: 250px;">
                                ${devis.demande.description}
                            </div>
                        </td>
                        <td>
                            <span style="font-size:0.75rem; letter-spacing:0.5px; opacity:0.8;">
                                ${devis.typeDevis.libelle}
                            </span>
                        </td>
                        <td>
                            <fmt:formatDate value="${devis.dateDevis}" pattern="dd MMM yyyy" />
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${devis.statut.libelle == 'Approuvé'}">
                                    <span style="color: #4ade80; font-size: 0.75rem; border: 1px solid #4ade80; padding: 2px 8px; border-radius: 2px;">APPROUVÉ</span>
                                </c:when>
                                <c:when test="${devis.statut.libelle == 'En attente'}">
                                    <span style="color: #fbbf24; font-size: 0.75rem; border: 1px solid #fbbf24; padding: 2px 8px; border-radius: 2px;">EN ATTENTE</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: #f87171; font-size: 0.75rem; border: 1px solid #f87171; padding: 2px 8px; border-radius: 2px;">${devis.statut.libelle.toUpperCase()}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-end">
                            <a href="${pageContext.request.contextPath}/devis/edit/${devis.id}" 
                               class="btn btn-outline-custom btn-sm px-3 me-2" style="font-size: 0.7rem;">MODIFIER</a>
                            <a href="${pageContext.request.contextPath}/devis/delete/${devis.id}" 
                               class="btn btn-outline-custom btn-sm px-3" style="font-size: 0.7rem; border-color: rgba(248, 113, 113, 0.4); color: #f87171;"
                               onclick="return confirm('Supprimer définitivement ce devis ?')">EFFACER</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty devisList}">
                    <tr>
                        <td colspan="6" class="text-center py-5 text-muted font-monospace italic">
                            Aucune donnée de tarification disponible.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
