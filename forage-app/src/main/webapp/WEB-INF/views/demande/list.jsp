<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="../layout/header.jsp" />

<div class="content-container fade-in">
    <div class="d-flex justify-content-between align-items-end mb-4 border-bottom pb-3" style="border-color: var(--border-color) !important;">
        <div>
            <h2 class="mb-1">REGISTRE DES DEMANDES</h2>
            <div style="color: var(--text-muted); font-size: 0.85rem; text-transform: uppercase;">
                Suivi des demandes d'intervention
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/demandes/create" class="btn btn-primary-custom px-4 py-2">
            NOUVELLE DEMANDE
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-custom table-borderless">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>CLIENT</th>
                    <th>DATE</th>
                    <th>LIEU</th>
                    <th>DESCRIPTION</th>
                    <th class="text-end">ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="demande" items="${demandes}">
                    <tr>
                        <td style="color: var(--text-muted);">#${demande.id}</td>
                        <td class="fw-bold">${demande.client.nom}</td>
                        <td>${demande.dateDemande}</td>
                        <td>${demande.lieu}</td>
                        <td>${demande.description}</td>
                        <td class="text-end">
                            <a href="${pageContext.request.contextPath}/demandes/edit/${demande.id}" 
                               class="btn btn-sm btn-outline-custom">ÉDITER</a>
                            <a href="${pageContext.request.contextPath}/demandes/delete/${demande.id}" 
                               class="btn btn-sm btn-outline-custom text-danger border-danger ms-2"
                               onclick="return confirm('Confirmer la suppression de la demande ?');">SUPPRIMER</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty demandes}">
                    <tr>
                        <td colspan="6" class="text-center py-5 text-muted text-uppercase">
                            Aucune demande enregistrée
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
