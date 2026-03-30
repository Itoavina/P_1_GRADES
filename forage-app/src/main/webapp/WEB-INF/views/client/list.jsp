<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="../layout/header.jsp" />

<div class="content-container fade-in">
    <div class="d-flex justify-content-between align-items-end mb-4 border-bottom pb-3" style="border-color: var(--border-color) !important;">
        <div>
            <h2 class="mb-1">RÉPERTOIRE CLIENTS</h2>
            <div style="color: var(--text-muted); font-size: 0.85rem; text-transform: uppercase;">
                Gestion du registre des clients
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/clients/create" class="btn btn-primary-custom px-4 py-2">
            AJOUTER CLIENT
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-custom table-borderless">
            <thead>
                <tr>
                    <th>IDENTIFIANT</th>
                    <th>ENTITÉ / NOM COMPLET</th>
                    <th>CONTACT</th>
                    <th class="text-end">ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="client" items="${clients}">
                    <tr>
                        <td style="color: var(--text-muted);">#${client.id}</td>
                        <td class="fw-medium">${client.nom}</td>
                        <td>${client.contact}</td>
                        <td class="text-end">
                            <a href="${pageContext.request.contextPath}/clients/edit/${client.id}" 
                               class="btn btn-sm btn-outline-custom px-3">ÉDITER</a>
                            <a href="${pageContext.request.contextPath}/clients/delete/${client.id}" 
                               class="btn btn-sm btn-outline-custom px-3 ms-2"
                               style="color: #ff6666; border-color: #552222;"
                               onclick="return confirm('Confirmer la suppression ?');">SUPPRIMER</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty clients}">
                    <tr>
                        <td colspan="4" class="text-center py-5 text-muted" style="text-transform: uppercase; letter-spacing: 1px;">
                            Le registre est actuellement vide
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
