<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../layout/header.jsp" />

<div class="row justify-content-center fade-in">
    <div class="col-md-8">
        <div class="content-container mt-4">
            <h3 class="mb-4 text-center text-uppercase" style="letter-spacing: 1px;">
                ${demande.id == null ? 'SOUMISSION DE DEMANDE' : 'MODIFICATION DE DEMANDE'}
            </h3>
            
            <form:form action="${pageContext.request.contextPath}/demandes/${demande.id == null ? 'create' : 'update/' += demande.id}" 
                       modelAttribute="demande" method="post">
                
                <div class="mb-4">
                    <label for="client" class="form-label">Client Associé</label>
                    <form:select path="client.id" class="form-control form-control-custom" id="client">
                        <form:option value="" label="-- Sélectionner le client --" />
                        <form:options items="${clients}" itemValue="id" itemLabel="nom" />
                    </form:select>
                    <form:errors path="client" cssClass="form-error" />
                </div>

                <div class="mb-4">
                    <label for="lieu" class="form-label">Lieu d'Intervention</label>
                    <form:input path="lieu" class="form-control form-control-custom" id="lieu" placeholder="Adresse du site" />
                    <form:errors path="lieu" cssClass="form-error" />
                </div>
                
                <div class="mb-5">
                    <label for="description" class="form-label">Description du Projet</label>
                    <form:textarea path="description" class="form-control form-control-custom" id="description" rows="4" placeholder="Détails du forage..." />
                    <form:errors path="description" cssClass="form-error" />
                </div>

                <c:if test="${not empty demande.id}">
                    <div class="section-divider mb-4">
                        <div class="section-title">Changement de Statut (optionnel)</div>
                        <div class="row g-3">
                            <div class="col-md-5">
                                <label for="newStatutId" class="form-label">Nouveau Statut</label>
                                <select name="newStatutId" id="newStatutId" class="form-control form-control-custom">
                                    <option value="">-- Pas de changement --</option>
                                    <c:forEach var="s" items="${statuts}">
                                        <option value="${s.id}">${s.libelle}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-7">
                                <label for="statutDescription" class="form-label">Description du changement</label>
                                <input type="text" name="statutDescription" id="statutDescription" 
                                       class="form-control form-control-custom" 
                                       placeholder="Ex: Devis validé par le client..." />
                            </div>
                        </div>
                    </div>
                </c:if>

                <div class="d-flex gap-3">
                    <button type="submit" class="btn btn-primary-custom py-2 flex-grow-1">
                        ${demande.id == null ? 'ENREGISTRER LA DEMANDE' : 'SAUVEGARDER'}
                    </button>
                    <a href="${pageContext.request.contextPath}/demandes" class="btn btn-outline-custom py-2 px-4">ANNULER</a>
                </div>
                
            </form:form>

            <c:if test="${not empty demande.id}">
                <div class="section-divider">
                    <div class="section-title">Historique des Statuts</div>
                    <div class="timeline">
                        <c:forEach var="h" items="${demande.statutHistoriqueList}">
                            <div class="timeline-item">
                                <div class="timeline-label">${h.statut.libelle}</div>
                                <div class="timeline-date">${h.dateChangement}</div>
                                <c:if test="${not empty h.description}">
                                    <div class="timeline-desc">${h.description}</div>
                                </c:if>
                            </div>
                        </c:forEach>
                        <c:if test="${empty demande.statutHistoriqueList}">
                            <div style="color: var(--text-muted); font-size: 0.82rem;">Aucun historique.</div>
                        </c:if>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
