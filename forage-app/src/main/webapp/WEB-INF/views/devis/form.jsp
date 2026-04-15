<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../layout/header.jsp" />

<div class="row">
    <!-- Form Side -->
    <div class="col-md-7 animate-fade-in">
        <div class="content-container shadow-lg pt-4 pb-5">
            <h2 class="mb-2" style="letter-spacing: -1px;">${devis.id != null ? 'MODIFIER LE DEVIS' : 'CRÉER UN DEVIS'}</h2>
            <p class="text-muted small mb-5 font-monospace">SOUMISSION DE TARIFICATION #CORP</p>

            <form:form action="${pageContext.request.contextPath}/devis/save" method="post" modelAttribute="devis" id="devisForm">
                <form:hidden path="id" />

                <!-- Selection Demande -->
                <div class="mb-4">
                    <label class="form-label">RÉFÉRENCE DEMANDE</label>
                    <form:select path="demande.id" class="form-select form-control-custom" id="demandeSelect" onchange="loadDemandeInfo(this.value)">
                        <option value="">-- Sélectionner une demande --</option>
                        <form:options items="${demandeList}" itemValue="id" itemLabel="description" />
                    </form:select>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <label class="form-label">TYPE DE DEVIS</label>
                        <form:select path="typeDevis.id" class="form-select form-control-custom" id="typeDevisSelect">
                            <form:options items="${typeDevisList}" itemValue="id" itemLabel="libelle" />
                        </form:select>
                    </div>
                    <div class="col-md-6 mb-4 d-flex align-items-end">
                        <div class="w-100 p-2 mb-1 border-bottom border-secondary text-muted small font-monospace">
                            STATUT AUTOMATIQUE BASÉ SUR LE TYPE
                        </div>
                    </div>
                </div>

                <div class="mb-5">
                    <label class="form-label">DATE DE VALIDATION</label>
                    <form:input path="dateDevis" type="datetime-local" class="form-control form-control-custom" required="required" />
                </div>

                <div class="mb-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0 font-monospace" style="letter-spacing: 1px;">LIGNES DE FACTURATION</h5>
                        <button type="button" class="btn btn-outline-custom btn-sm" onclick="addDetailRow()">+ AJOUTER LIGNE</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-custom border-bottom-0" id="detailsTable">
                            <thead class="small opacity-50">
                                <tr>
                                    <th>DESIGNATION</th>
                                    <th style="width: 100px;">QTÉ</th>
                                    <th style="width: 150px;">P.U (Ar)</th>
                                    <th style="width: 150px;">TOTAL (Ar)</th>
                                    <th style="width: 50px;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detail" items="${devis.detailDevisList}" varStatus="status">
                                    <tr class="detail-row">
                                        <td>
                                            <input name="detailDevisList[${status.index}].libelle" 
                                                   value="${detail.libelle}" 
                                                   class="form-control-custom bg-transparent border-0 w-100" 
                                                   placeholder="Désignation..." required />
                                        </td>
                                        <td>
                                            <input type="number" step="0.01" 
                                                   name="detailDevisList[${status.index}].quantite" 
                                                   value="${detail.quantite}" 
                                                   class="form-control-custom bg-transparent border-0 w-100 quantite-input text-center" 
                                                   oninput="calculateTotal()" required />
                                        </td>
                                        <td>
                                            <input type="number" step="0.01" 
                                                   name="detailDevisList[${status.index}].prixUnitaire" 
                                                   value="${detail.prixUnitaire}" 
                                                   class="form-control-custom bg-transparent border-0 w-100 pu-input text-end" 
                                                   oninput="calculateTotal()" required />
                                        </td>
                                        <td>
                                            <input type="number" step="0.01" 
                                                   name="detailDevisList[${status.index}].montant" 
                                                   value="${detail.montant}" 
                                                   class="form-control-custom bg-transparent border-0 w-100 montant-input text-end" 
                                                   readonly required />
                                        </td>
                                        <td class="text-end">
                                            <button type="button" class="btn btn-sm btn-link text-danger p-0" onclick="removeDetailRow(this)">×</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td class="text-end font-monospace small pt-4 text-muted">MONTANT TOTAL ESTIMÉ :</td>
                                    <td class="text-end font-monospace fw-bold pt-4" style="color: var(--accent); font-size: 1.2rem;">
                                        <span id="totalLabel">0.00</span> Ar
                                    </td>
                                    <td></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
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

    <div class="col-md-5">
        <div id="demandeInfoBox" class="content-container border-0 animate-fade-in" style="background-color: #111; display: none;">
            <h6 class="text-muted uppercase small mb-4 font-monospace">INFO SUR LA DEMANDE</h6>
            <div id="loadingInfo" class="text-center py-4 text-muted small" style="display: none;">Chargement...</div>
            <div id="infoContent">
                <div class="mb-4">
                    <label class="form-label d-block mb-1">CLIENT</label>
                    <div id="clientNom" class="fw-bold text-white fs-5">-</div>
                    <div id="clientContact" class="text-muted small">-</div>
                </div>
                <div class="mb-4">
                    <label class="form-label d-block mb-1">LOCALISATION DU FORAGE</label>
                    <div id="demandeLieu" class="text-white">-</div>
                </div>
                <div class="mb-4">
                    <label class="form-label d-block mb-1">CAHIER DES CHARGES / DESCRIPTION</label>
                    <div id="demandeDesc" class="text-muted small" style="line-height:1.4;">-</div>
                </div>
                <div class="mb-0">
                    <label class="form-label d-block mb-1">DATE DE LA DEMANDE</label>
                    <div id="demandeDate" class="font-monospace small">-</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function loadDemandeInfo(id) {
        const infoBox = document.getElementById('demandeInfoBox');
        if (!id || id === "") {
            console.log("No demande ID selected");
            infoBox.style.display = 'none';
            return;
        }

        console.log("Fetching demande info for ID:", id);
        infoBox.style.display = 'block';
        document.getElementById('loadingInfo').style.display = 'block';
        document.getElementById('infoContent').style.opacity = '0.3';

        fetch('${pageContext.request.contextPath}/devis/api/demande/' + id)
            .then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            })
            .then(data => {
                console.log("Data received:", data);
                document.getElementById('loadingInfo').style.display = 'none';
                document.getElementById('infoContent').style.opacity = '1';

                if (data) {
                    document.getElementById('clientNom').innerText = (data.client && data.client.nom) ? data.client.nom : '-';
                    document.getElementById('clientContact').innerText = (data.client && data.client.contact) ? data.client.contact : '-';
                    document.getElementById('demandeLieu').innerText = data.lieu || '-';
                    document.getElementById('demandeDesc').innerText = data.description || '-';
                    
                    if (data.dateDemande) {
                        try {
                            const date = new Date(data.dateDemande);
                            document.getElementById('demandeDate').innerText = date.toLocaleString('fr-FR');
                        } catch(e) {
                            document.getElementById('demandeDate').innerText = '-';
                        }
                    } else {
                        document.getElementById('demandeDate').innerText = '-';
                    }
                }
            })
            .catch(err => {
                console.error("Fetch Error:", err);
                document.getElementById('loadingInfo').style.display = 'none';
                document.getElementById('infoContent').innerText = "Erreur de chargement des données. Vérifiez l'ID de la demande.";
                document.getElementById('infoContent').style.opacity = '1';
            });
    }

    let detailCount = document.querySelectorAll('.detail-row').length;

    function addDetailRow() {
        const tbody = document.querySelector('#detailsTable tbody');
        const row = document.createElement('tr');
        row.className = 'detail-row';
        row.innerHTML = `
            <td>
                <input name="detailDevisList[` + detailCount + `].libelle" class="form-control-custom bg-transparent border-0 w-100" placeholder="Désignation..." required />
            </td>
            <td>
                <input type="number" step="0.01" value="1" name="detailDevisList[` + detailCount + `].quantite" class="form-control-custom bg-transparent border-0 w-100 quantite-input text-center" oninput="calculateTotal()" required />
            </td>
            <td>
                <input type="number" step="0.01" value="0" name="detailDevisList[` + detailCount + `].prixUnitaire" class="form-control-custom bg-transparent border-0 w-100 pu-input text-end" oninput="calculateTotal()" required />
            </td>
            <td>
                <input type="number" step="0.01" value="0" name="detailDevisList[` + detailCount + `].montant" class="form-control-custom bg-transparent border-0 w-100 montant-input text-end" readonly required />
            </td>
            <td class="text-end">
                <button type="button" class="btn btn-sm btn-link text-danger p-0" onclick="removeDetailRow(this)">×</button>
            </td>
        `;
        tbody.appendChild(row);
        detailCount++;
        calculateTotal();
    }

    function removeDetailRow(btn) {
        btn.closest('tr').remove();
        calculateTotal();
        reindexRows();
    }

    function reindexRows() {
        const rows = document.querySelectorAll('.detail-row');
        rows.forEach((row, index) => {
            row.querySelector('input[name*=".libelle"]').name = 'detailDevisList[' + index + '].libelle';
            row.querySelector('input[name*=".quantite"]').name = 'detailDevisList[' + index + '].quantite';
            row.querySelector('input[name*=".prixUnitaire"]').name = 'detailDevisList[' + index + '].prixUnitaire';
            row.querySelector('input[name*=".montant"]').name = 'detailDevisList[' + index + '].montant';
        });
        detailCount = rows.length;
    }

    function calculateTotal() {
        let grandTotal = 0;
        document.querySelectorAll('.detail-row').forEach(row => {
            const qty = parseFloat(row.querySelector('.quantite-input').value) || 0;
            const pu = parseFloat(row.querySelector('.pu-input').value) || 0;
            
            let rowTotal = qty * pu;
            if (pu >= 1000000) {
                rowTotal = rowTotal * 0.9;
            }
            
            row.querySelector('.montant-input').value = rowTotal.toFixed(2);
            grandTotal += rowTotal;
        });
        document.getElementById('totalLabel').innerText = grandTotal.toLocaleString('fr-FR', { minimumFractionDigits: 2 });
    }

    window.onload = function() {
        const demandeId = document.getElementById('demandeSelect').value;
        if (demandeId) loadDemandeInfo(demandeId);
        calculateTotal();
    };
</script>

<jsp:include page="../layout/footer.jsp" />
