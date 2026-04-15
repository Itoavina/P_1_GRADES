<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../layout/header.jsp" />

<div class="row justify-content-center fade-in">
    <div class="col-md-6">
        <div class="content-container mt-4">
            <h3 class="mb-4 text-center text-uppercase" style="letter-spacing: 1px;">
                ${client.id == null ? 'ENREGISTREMENT CLIENT' : 'MODIFICATION CLIENT'}
            </h3>
            
            <form:form action="${pageContext.request.contextPath}/clients/${client.id == null ? 'create' : 'update/' += client.id}" 
                       modelAttribute="client" method="post">
                       
                <div class="mb-4">
                    <label for="nom" class="form-label">Entité / Nom Complet</label>
                    <form:input path="nom" class="form-control form-control-custom" id="nom" placeholder="Saisir la raison sociale ou le nom" />
                    <form:errors path="nom" cssClass="form-error" />
                </div>

                <div class="mb-5">
                    <label for="contact" class="form-label">Coordonnées (Contact)</label>
                    <form:input path="contact" class="form-control form-control-custom" id="contact" placeholder="Email ou Téléphone" />
                    <form:errors path="contact" cssClass="form-error" />
                </div>

                <div class="d-flex gap-3">
                    <button type="submit" class="btn btn-primary-custom py-2 flex-grow-1">
                        ${client.id == null ? 'CONFIRMER' : 'METTRE À JOUR'}
                    </button>
                    <a href="${pageContext.request.contextPath}/clients" class="btn btn-outline-custom py-2 px-4">ANNULER</a>
                </div>
                
            </form:form>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
