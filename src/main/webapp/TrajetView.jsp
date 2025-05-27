<%@page import="model.Trajet"%>
<%@page import="java.util.List"%>
<%@page import="dao.TrajetDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recherche de voyage</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        :root {
            --primary-color: #003B4E;
            --accent-color: #00b2ff;
            --bg-light: #f5f5f5;
            --white: #ffffff;
            --text-dark: #333;
            --border-radius: 10px;
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg-light);
            margin: 0;
            padding: 0;
        }

        /* Header */
        .header {
            background: var(--white);
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .logo {
            font-size: 24px;
            color: var(--primary-color);
            font-weight: 700;
        }

        .add-trajet-btn {
            background-color: var(--accent-color);
            color: white;
            padding: 10px 20px;
            border-radius: 999px;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: var(--transition);
        }

        .add-trajet-btn:hover {
            background-color: #0099e6;
        }

        /* Container principal */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 20px;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            color: var(--primary-color);
            margin-bottom: 30px;
        }

        form {
            display: inline-block;
        }

        .search-bar {
            display: flex;
            align-items: center;
            background: white;
            padding: 15px 10px;
            border-radius: 999px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            gap: 10px;
            margin-bottom: 40px;
        }

        .section {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0 15px;
        }

        .section label {
            font-size: 14px;
            color: #6c8a99;
            font-weight: 600;
            margin-bottom: 4px;
            display: flex;
            align-items: center;
        }

        .section label i {
            margin-right: 6px;
        }

        .section input,
        .section select {
            border: none;
            outline: none;
            font-size: 16px;
            width: 150px;
            background: transparent;
        }

        .divider {
            width: 1px;
            height: 40px;
            background: #ddd;
        }

        .search-button {
            background: var(--accent-color);
            color: white;
            border: none;
            padding: 14px 28px;
            border-radius: 999px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: var(--transition);
        }

        .search-button:hover {
            background: #0099e6;
        }

        /* Liste des trajets - Nouveau style */
        .trajets-container {
            max-width: 800px;
            width: 100%;
            margin-top: 20px;
        }

        .trajet-card {
            background-color: var(--white);
            padding: 15px 20px;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            transition: var(--transition);
        }

        .trajet-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
        }

        .trajet-info {
            flex: 1;
            text-align: left;
        }

        .trajet-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 5px;
        }

        .trajet-subtitle {
            font-size: 14px;
            color: #6c8a99;
        }

        .btn-reserve {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            font-size: 14px;
        }

        .btn-reserve:hover {
            background-color: #0099e6;
        }

        @media (max-width: 768px) {
            .search-bar {
                flex-direction: column;
                align-items: stretch;
                border-radius: var(--border-radius);
                padding: 20px;
            }

            .divider {
                width: 100%;
                height: 1px;
                margin: 10px 0;
            }

            .section {
                width: 100%;
                padding: 10px 0;
            }

            .section input,
            .section select {
                width: 100%;
            }

            .trajet-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .btn-reserve {
                margin-top: 10px;
                align-self: flex-end;
            }
        }
    </style>
</head>
<body>

<!-- HEADER -->
<div class="header">
    <div class="logo">Train Any Time</div>
    
</div>

<!-- MAIN CONTENT -->
<div class="container">
    <h1>Où voulez-vous aller ?</h1>
    <form method="post" action="TrajetUserController">

        <div class="search-bar">

            <!-- Départ -->
            <div class="section">
                <label for="depart"><i class="fas fa-circle"></i> Départ</label>
                <input type="text" id="depart" name="depart" placeholder="Ville de départ" required>
            </div>

            <div class="divider"></div>

            <!-- Destination -->
            <div class="section">
                <label for="destination"><i class="fas fa-map-marker-alt"></i> Destination</label>
                <input type="text" id="destination" name="destination" placeholder="Ville de destination" required>
            </div>

            <div class="divider"></div>

            <!-- Date -->
            <div class="section">
                <label for="date"><i class="fas fa-calendar-alt"></i> Date</label>
                <input type="date" id="date" name="date" required>
            </div>

            <div class="divider"></div>

            <!-- Passagers -->
            <div class="section">
                <label for="passagers"><i class="fas fa-user"></i> Passagers</label>
                <select id="passagers" name="nb_passagers">
                    <option value="1">1 passager</option>
                    <option value="2">2 passagers</option>
                    <option value="3">3 passagers</option>
                    <option value="4">4 passagers</option>
                    <option value="5">5 passagers</option>
                </select>
            </div>

            <!-- Bouton Rechercher -->
            <button type="submit" class="search-button">Rechercher</button>

        </div> <!-- end search-bar -->

    </form>

    <!-- LISTE DES TRAJETS - Nouveau style -->
    <div class="trajets-container">
        <%
            TrajetDAO trajetDAO = new TrajetDAO();
            List<Trajet> trajets = trajetDAO.findAll();

            if (trajets == null || trajets.isEmpty()) {
        %>
            <p style="text-align:center;">Aucun trajet trouvé.</p>
        <%
            } else {
                for (Trajet t : trajets) {
        %>
                    <div class="trajet-card">
                        <div class="trajet-info">
                            <div class="trajet-title"><%= t.getVille_Depart() %> → <%= t.getDestination() %></div>
                            <div class="trajet-subtitle">
                                Date : <%= t.getDate() %> | 
 
                            </div>
                        </div>
                        <a href="reserver_trajet.jsp?id=<%= t.getID() %>" class="btn-reserve">Réserver</a>
                    </div>
        <%
                }
            }
        %>
    </div>
</div> <!-- end container -->

<script>
    // Mettre la date actuelle par défaut
    document.getElementById('date').valueAsDate = new Date();
</script>

</body>
</html>