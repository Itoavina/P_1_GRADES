<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<jsp:include page="../layout/header.jsp" />

<div class="fade-in pt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="mb-0">Gestion des Devis</h2>
            <p class="text-muted small mb-0">Liste de tous les devis enregistrés</p>
        </div>
        <a href="${pageContext.request.contextPath}/devis/create" class="btn btn-primary px-4 rounded-pill">
            + Nouveau Devis
        </a>
    </div>

    <div class="card card-custom border-0 shadow-sm overflow-hidden">
        <div class="table-responsive">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-light text-muted uppercase small">
                    <tr>
                        <th class="ps-4">ID</th>
                        <th>Client / Demande</th>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Statut</th>
                        <th class="text-end pe-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="devis" items="${devisList}">
                        <tr>
                            <td class="ps-4 font-monospace small">#${devis.id}</td>
                            <td>
                                <div>${devis.demande.client.nom}</div>
                                <div class="text-muted small text-truncate" style="max-width: 200px;">
                                    ${devis.demande.description}
                                </div>
                            </td>
                            <td>
                                <span class="badge bg-secondary-subtle text-secondary small rounded-pill">
                                    ${devis.typeDevis.libelle}
                                </span>
                            </td>
                            <td>
                                <fmt:formatDate value="${devis.dateDevis}" pattern="dd/MM/yyyy HH:mm" />
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${devis.statut.libelle == 'Approuvé'}">
                                        <span class="badge bg-success-subtle text-success small rounded-pill">Approuvé</span>
                                    </c:when>
                                    <c:when test="${devis.statut.libelle == 'En attente'}">
                                        <span class="badge bg-warning-subtle text-warning small rounded-pill">En attente</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger-subtle text-danger small rounded-pill">${devis.statut.libelle}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-end pe-4">
                                <a href="${pageContext.request.contextPath}/devis/edit/${devis.id}" 
                                   class="btn btn-sm btn-outline-secondary rounded-pill px-3 me-2">Modifier</a>
                                <a href="${pageContext.request.contextPath}/devis/delete/${devis.id}" 
                                   class="btn btn-sm btn-outline-danger rounded-pill px-3"
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce devis ?')">Supprimer</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty devisList}">
                        <tr>
                            <td colspan="6" class="text-center py-5 text-muted">
                                Aucun devis trouvé.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
