<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:include page="layout/header.jsp" />

<div class="content-container text-center py-5">
    <h1 class="display-5 fw-bold mb-4" style="letter-spacing: -1px;">GESTION CENTRALE DES FORAGES</h1>
    <p class="lead mb-5" style="color: var(--text-muted); max-width: 700px; margin: 0 auto;">
        Interface d'administration corporate pour la supervision des clients, des demandes, de la tarification et de l'exécution des travaux de forage.
    </p>

    <div class="row g-4 mt-2 justify-content-center">
        <!-- Client Card -->
        <div class="col-md-3">
            <div class="p-4" style="background-color: var(--bg-color); border: 1px solid var(--border-color); border-radius: 4px;">
                <h4 class="mb-3">Base Clients</h4>
                <a href="${pageContext.request.contextPath}/clients" class="btn btn-primary-custom w-100 py-2">Ouvrir</a>
            </div>
        </div>
        <!-- Demandes Card -->
        <div class="col-md-3">
            <div class="p-4" style="background-color: var(--bg-color); border: 1px solid var(--border-color); border-radius: 4px;">
                <h4 class="mb-3">Demandes</h4>
                <a href="${pageContext.request.contextPath}/demandes" class="btn btn-outline-custom w-100 py-2">Consulter</a>
            </div>
        </div>
        <!-- Devis Card -->
        <div class="col-md-3">
            <div class="p-4" style="background-color: var(--bg-color); border: 1px solid var(--border-color); border-radius: 4px;">
                <h4 class="mb-3">Financier (Devis)</h4>
                <a href="${pageContext.request.contextPath}/devis" class="btn btn-outline-custom w-100 py-2">Tarification</a>
            </div>
        </div>
        <!-- Travaux Card -->
        <div class="col-md-3">
            <div class="p-4" style="background-color: var(--bg-color); border: 1px solid var(--border-color); border-radius: 4px;">
                <h4 class="mb-3">Opérations</h4>
                <a href="${pageContext.request.contextPath}/travaux" class="btn btn-outline-custom w-100 py-2">Superviser</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="layout/footer.jsp" />
