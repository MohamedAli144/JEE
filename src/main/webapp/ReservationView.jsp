<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Voyage, dao.VoyageDAO" %>
    <%@ include file="Navbar_user.jsp" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Réservation de trajet</title>
    <style>
        :root {
            --primary-color: #007bff;
            --accent-color: #f8f9fa;
            --bg-card: #ffffff;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --radius: 12px;
            --font-main: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            font-family: var(--font-main);
            background-color: #f1f3f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .card { 
            background-color: var(--bg-card); 
            border-radius: var(--radius); 
            box-shadow: var(--shadow); 
            padding: 25px; 
            max-width: 500px; 
            margin: auto; 
        }
        .card:hover { transform: translateY(-5px); }
        h3 { margin-top: 0; font-size: 1.5em; color: #222; }
        .date-time, .class-selector { 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            padding: 10px 0; 
            border-bottom: 1px solid #eee; 
        }
        .location p { margin: 0; font-weight: 500; }
        .time { font-size: 1.1em; font-weight: bold; }
        .duration { font-size: 0.85em; color: #888; }
        hr { margin: 20px 0; border: none; border-top: 1px solid #e0e0e0; }
        .class-name { font-weight: 600; font-size: 1em; }
        .price-tag { color: #28a745; font-weight: bold; }
        input[type="number"] { 
            width: 60px; 
            text-align: center; 
            padding: 5px; 
            border-radius: 6px; 
            border: 1px solid #ccc; 
            font-size: 1em; 
        }
        .total-section { 
            margin-top: 20px; 
            text-align: right; 
            font-size: 1.2em; 
            font-weight: bold; 
            color: #333; 
        }
        .reservation-button { 
            margin-top: 25px; 
            background-color: var(--primary-color); 
            color: white; 
            border: none; 
            padding: 14px 20px; 
            border-radius: var(--radius); 
            width: 100%; 
            font-size: 1.1em; 
            font-weight: bold; 
            cursor: pointer; 
        }
        .reservation-button:hover { background-color: #0056b3; }
        .reservation-button i { margin-right: 8px; }
    </style>
</head>
<body>

<div class="card">
<%
    String idParam = request.getParameter("id");
    long id = -1;
    if (idParam != null) {
        try {
            id = Long.parseLong(idParam);

            VoyageDAO voyageDAO = new VoyageDAO();
            Voyage voyage = voyageDAO.findByTrajetId(id);

            if (voyage != null) {
%>
    <h3><%= voyage.getTrajet().getDate() %></h3>

    <div class="date-time">
        <div class="location">
            <p><%= voyage.getTrajet().getVille_Depart() %></p>
        </div>
    </div>

    <div class="date-time">
        <div class="location">
            <p><%= voyage.getTrajet().getDestination() %></p>
        </div>
    </div>

    <hr>

    <h4 style="margin-bottom: 15px;">Classe et passagers</h4>

    <div class="class-selector">
        <span class="class-name">1ère classe</span>
        <span class="price-tag" id="price1"><%= voyage.getPrix_class1() %> €</span>
        <input type="number" id="firstClass" value="0" min="0" onchange="updateTotal()">
    </div>

    <div class="class-selector">
        <span class="class-name">2nde classe</span>
        <span class="price-tag" id="price2"><%= voyage.getPrix_class2() %> €</span>
        <input type="number" id="secondClass" value="0" min="0" onchange="updateTotal()">
    </div>

    <div class="class-selector">
        <span class="class-name">Économique</span>
        <span class="price-tag" id="price3"><%= voyage.getPrix_class3() %> €</span>
        <input type="number" id="economyClass" value="0" min="0" onchange="updateTotal()">
    </div>

    <div class="total-section">
        Total : <span id="totalPrice">0 €</span>
    </div>

    <!-- Formulaire de réservation caché -->
    <form id="reservationForm" action="ReservationController" method="post">
        <input type="hidden" name="idVoyage" value="<%= voyage.getId() %>">
        <input type="hidden" name="nb_class1" id="nb_class1">
        <input type="hidden" name="nb_class2" id="nb_class2">
        <input type="hidden" name="nb_class3" id="nb_class3">
        <input type="hidden" name="total" id="total">
    </form>

    <button class="reservation-button" onclick="submitReservation()">
        <i class="fas fa-calendar-check"></i> Demande de réservation
    </button>
<%
            } else {
                out.println("<p style='color:red;'>Aucun voyage trouvé pour ce trajet.</p>");
            }
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>ID invalide</p>");
        }
    } else {
        out.println("<p style='color:red;'>ID manquant</p>");
    }
%>
</div>

<script>
    function extractPrice(id) {
        const element = document.getElementById(id);
        if (!element) return 0;
        const text = element.innerText;
        return parseFloat(text.replace(/[^\d.]/g, '')) || 0;
    }

    function updateTotal() {
        const priceFirst = extractPrice("price1");
        const priceSecond = extractPrice("price2");
        const priceEco = extractPrice("price3");

        const firstCount = Math.max(0, parseInt(document.getElementById("firstClass").value) || 0);
        const secondCount = Math.max(0, parseInt(document.getElementById("secondClass").value) || 0);
        const ecoCount = Math.max(0, parseInt(document.getElementById("economyClass").value) || 0);

        const total = firstCount * priceFirst + secondCount * priceSecond + ecoCount * priceEco;
        document.getElementById("totalPrice").innerText = total.toFixed(2) + " €";
    }

    function submitReservation() {
        const firstCount = parseInt(document.getElementById("firstClass").value) || 0;
        const secondCount = parseInt(document.getElementById("secondClass").value) || 0;
        const ecoCount = parseInt(document.getElementById("economyClass").value) || 0;

        const priceFirst = extractPrice("price1");
        const priceSecond = extractPrice("price2");
        const priceEco = extractPrice("price3");

        const total = firstCount * priceFirst + secondCount * priceSecond + ecoCount * priceEco;

        document.getElementById("nb_class1").value = firstCount;
        document.getElementById("nb_class2").value = secondCount;
        document.getElementById("nb_class3").value = ecoCount;
        document.getElementById("total").value = Math.round(total);


        document.getElementById("reservationForm").submit();
    }

    window.onload = updateTotal;
</script>

</body>
</html>
