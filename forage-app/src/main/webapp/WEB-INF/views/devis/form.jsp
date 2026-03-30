<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../layout/header.jsp" />

<div class="d-flex justify-content-center">
    <div class="content-container col-md-6 animate-fade-in shadow-lg">
        <h2 class="mb-2" style="letter-spacing: -1px;">${devis.id != null ? 'MODIFIER LE DEVIS' : 'CRÉER UN DEVIS'}</h2>
        <p class="text-muted small mb-5 font-monospace">SOUMISSION DE TARIFICATION #CORP</p>

        <form:form action="${pageContext.request.contextPath}/devis/save" method="post" modelAttribute="devis">
            <form:hidden path="id" />

            <!-- Demande -->
            <div class="mb-4">
                <label class="form-label">Référence Demande</label>
                <form:select path="demande.id" class="form-select form-control-custom">
                    <form:options items="${demandeList}" itemValue="id" itemLabel="description" />
                </form:select>
            </div>

            <div class="row">
                <!-- Type Devis -->
                <div class="col-md-6 mb-4">
                    <label class="form-label">Type de Devis</label>
                    <form:select path="typeDevis.id" class="form-select form-control-custom">
                        <form:options items="${typeDevisList}" itemValue="id" itemLabel="libelle" />
                    </form:select>
                </div>

                <!-- Statut -->
                <div class="col-md-6 mb-4">
                    <label class="form-label">Statut Actuel</label>
                    <form:select path="statut.id" class="form-select form-control-custom">
                        <form:options items="${statutList}" itemValue="id" itemLabel="libelle" />
                    </form:select>
                </div>
            </div>

            <!-- Date -->
            <div class="mb-5">
                <label class="form-label">Date de Validation</label>
                <form:input path="dateDevis" type="datetime-local" class="form-control form-control-custom" required="required" />
            </div>

            <div class="d-flex gap-3">
                <button type="submit" class="btn btn-primary-custom flex-grow-1 py-3">
                    ${devis.id != null ? 'VALIDER LES MODIFICATIONS' : 'ENREGISTRER LE DEVIS'}
                </button>
                <a href="${pageContext.request.contextPath}/devis" class="btn btn-outline-custom px-4 py-3">
                    ANNULER
                </a>
            </div>
        </form:form>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
