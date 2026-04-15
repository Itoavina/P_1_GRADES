<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FORAGE ENTERPRISE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            ETU <span style="font-weight:300; color:var(--text-muted);">3597</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCore">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCore">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.endsWith('/index.jsp') || pageContext.request.servletPath == '/' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('client') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/clients">Clients</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('demande') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/demandes">Demandes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('devis') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/devis">Devis</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('travaux') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/travaux">Travaux</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('statut') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/statuts">Statuts</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Start Main Container -->
<div class="container pb-5">
