<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../layout/header.jsp" />

<div class="row justify-content-center">
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
                    <form:errors path="client" cssStyle="color: #ff6666; font-size: 0.8rem; margin-top: 5px; display: block;" />
                </div>

                <div class="mb-4">
                    <label for="lieu" class="form-label">Lieu d'Intervention</label>
                    <form:input path="lieu" class="form-control form-control-custom" id="lieu" placeholder="Adresse du site" />
                    <form:errors path="lieu" cssStyle="color: #ff6666; font-size: 0.8rem; margin-top: 5px; display: block;" />
                </div>
                
                <div class="mb-5">
                    <label for="description" class="form-label">Description du Projet</label>
                    <form:textarea path="description" class="form-control form-control-custom" id="description" rows="4" placeholder="Détails du forage..." />
                    <form:errors path="description" cssStyle="color: #ff6666; font-size: 0.8rem; margin-top: 5px; display: block;" />
                </div>

                <div class="d-flex gap-3">
                    <button type="submit" class="btn btn-primary-custom py-2 flex-grow-1">
                        ${demande.id == null ? 'ENREGISTRER LA DEMANDE' : 'SAUVEGARDER'}
                    </button>
                    <a href="${pageContext.request.contextPath}/demandes" class="btn btn-outline-custom py-2 px-4">ANNULER</a>
                </div>
                
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
