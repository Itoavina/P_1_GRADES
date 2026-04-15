<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:include page="layout/header.jsp" />

<div class="content-container text-center py-5 fade-in">
    <h1 class="display-5 mb-3" style="font-weight: 700; letter-spacing: -1px;">GESTION CENTRALE DES FORAGES</h1>
    <p class="page-subtitle mb-5" style="max-width: 600px; margin: 0 auto; font-size: 0.85rem; letter-spacing: 1.5px;">
        Supervision des clients, demandes, tarification et exécution des travaux
    </p>

    <div class="row g-4 mt-3 justify-content-center">
        <div class="col-md-3 col-sm-6">
            <div class="dash-card">
                <h4>Base Clients</h4>
                <p class="dash-desc">Gestion du répertoire des clients et contacts</p>
                <a href="${pageContext.request.contextPath}/clients" class="btn btn-primary-custom w-100">Ouvrir</a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="dash-card">
                <h4>Demandes</h4>
                <p class="dash-desc">Suivi des demandes d'intervention forage</p>
                <a href="${pageContext.request.contextPath}/demandes" class="btn btn-outline-custom w-100">Consulter</a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="dash-card">
                <h4>Devis</h4>
                <p class="dash-desc">Module de tarification et détails financiers</p>
                <a href="${pageContext.request.contextPath}/devis" class="btn btn-outline-custom w-100">Tarification</a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="dash-card">
                <h4>Travaux</h4>
                <p class="dash-desc">Opérations et exécution des interventions</p>
                <a href="${pageContext.request.contextPath}/travaux" class="btn btn-outline-custom w-100">Superviser</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="layout/footer.jsp" />
