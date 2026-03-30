<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../layout/header.jsp" />

<div class="fade-in pt-4 d-flex justify-content-center">
    <div class="card card-custom border-0 shadow-sm col-md-6">
        <div class="card-body p-4 p-md-5">
            <h2 class="mb-1">${devis.id != null ? 'Modifier le Devis' : 'Nouveau Devis'}</h2>
            <p class="text-muted small mb-4">Veuillez remplir les informations ci-dessous.</p>

            <form:form action="${pageContext.request.contextPath}/devis/save" method="post" modelAttribute="devis">
                <form:hidden path="id" />

                <!-- Demande -->
                <div class="mb-3">
                    <label class="form-label small text-muted uppercase fw-bold">Demande / Client</label>
                    <form:select path="demande.id" class="form-select rounded-pill">
                        <form:options items="${demandeList}" itemValue="id" itemLabel="description" />
                    </form:select>
                </div>

                <!-- Type Devis -->
                <div class="mb-3">
                    <label class="form-label small text-muted uppercase fw-bold">Type de Devis</label>
                    <form:select path="typeDevis.id" class="form-select rounded-pill">
                        <form:options items="${typeDevisList}" itemValue="id" itemLabel="libelle" />
                    </form:select>
                </div>

                <!-- Statut -->
                <div class="mb-3">
                    <label class="form-label small text-muted uppercase fw-bold">Statut</label>
                    <form:select path="statut.id" class="form-select rounded-pill">
                        <form:options items="${statutList}" itemValue="id" itemLabel="libelle" />
                    </form:select>
                </div>

                <!-- Date -->
                <div class="mb-4">
                    <label class="form-label small text-muted uppercase fw-bold">Date du Devis</label>
                    <form:input path="dateDevis" type="datetime-local" class="form-control rounded-pill" required="required" />
                    <c:if test="${devis.dateDevis != null}">
                        <div class="form-text small">Date actuelle : <fmt:formatDate value="${devis.dateDevis}" pattern="dd/MM/yyyy HH:mm" /></div>
                    </c:if>
                </div>

                <div class="d-flex gap-2 pt-2">
                    <button type="submit" class="btn btn-primary px-4 rounded-pill flex-grow-1">
                        ${devis.id != null ? 'Enregistrer les modifications' : 'Créer le Devis'}
                    </button>
                    <a href="${pageContext.request.contextPath}/devis" class="btn btn-outline-secondary px-4 rounded-pill">
                        Annuler
                    </a>
                </div>
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
