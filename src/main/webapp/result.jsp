<%@page import="model.Trajet"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Résultats de recherche</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .header {
            background: #ffffff;
            padding: 20px 40px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 24px;
            color: #003B4E;
            font-weight: 700;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }
        h1 {
            color: #003B4E;
            margin-bottom: 30px;
        }
        .trajet-card {
            background-color: white;
            padding: 15px 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            transition: all 0.3s ease;
        }
        .trajet-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
        }
        .trajet-info {
            flex: 1;
        }
        .trajet-title {
            font-size: 18px;
            font-weight: 600;
            color: #003B4E;
        }
        .trajet-subtitle {
            font-size: 14px;
            color: #6c8a99;
        }
        .btn-reserve {
            background-color: #00b2ff;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        .btn-reserve:hover {
            background-color: #0099e6;
        }
        .no-result {
            text-align: center;
            color: #666;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<!-- HEADER -->
<div class="header">
    <div class="logo">Train Any Time</div>
    <a href="TrajetView.jsp" class="btn-reserve">Nouvelle recherche</a>
</div>

<!-- CONTAINER -->
<div class="container">
    <h1>Résultats de votre recherche</h1>

    <%
        List<Trajet> trajets = (List<Trajet>) request.getAttribute("resultats");

        if (trajets == null || trajets.isEmpty()) {
    %>
        <div class="no-result">Aucun trajet trouvé correspondant à vos critères.</div>
    <%
        } else {
            for (Trajet t : trajets) {
    %>
        <div class="trajet-card">
            <div class="trajet-info">
                <div class="trajet-title"><%= t.getVille_Depart() %> → <%= t.getDestination() %></div>
                <div class="trajet-subtitle">Date : <%= t.getDate() %></div>
            </div>
            <a href="reserver_trajet.jsp?id=<%= t.getID() %>" class="btn-reserve">Réserver</a>
        </div>
    <%
            }
        }
    %>
</div>

</body>
</html>
