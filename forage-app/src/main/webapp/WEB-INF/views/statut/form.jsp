<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../layout/header.jsp" />

<div class="row justify-content-center fade-in">
    <div class="col-md-6">
        <div class="content-container mt-4">
            <h3 class="mb-4 text-center text-uppercase" style="letter-spacing: 1px;">
                ${statut.id == null ? 'NOUVEAU STATUT' : 'MODIFIER LE STATUT'}
            </h3>
            
            <form:form action="${pageContext.request.contextPath}/statuts/${statut.id == null ? 'create' : 'update/' += statut.id}" 
                       modelAttribute="statut" method="post">
                
                <div class="mb-5">
                    <label for="libelle" class="form-label">Libellé du Statut</label>
                    <form:input path="libelle" class="form-control form-control-custom" id="libelle" 
                                placeholder="Ex: en attente, approuvé, terminé..." />
                    <form:errors path="libelle" cssClass="form-error" />
                </div>

                <div class="d-flex gap-3">
                    <button type="submit" class="btn btn-primary-custom py-2 flex-grow-1">
                        ${statut.id == null ? 'ENREGISTRER' : 'METTRE À JOUR'}
                    </button>
                    <a href="${pageContext.request.contextPath}/statuts" class="btn btn-outline-custom py-2 px-4">ANNULER</a>
                </div>
                
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
