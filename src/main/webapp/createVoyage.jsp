<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Trajet" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Créer un Voyage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Reset partiel & variables */
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --danger-color: #ef4444;
            --bg-light: #f9fafb;
            --white: #ffffff;
            --gray: #6b7280;
            --radius: 12px;
            --transition: all 0.3s ease-in-out;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg-light);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 60px 20px 40px;
        }

        h1 {
            color: var(--primary-color);
            font-size: 2rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 40px;
        }

        form {
            background: var(--white);
            padding: 32px;
            border-radius: var(--radius);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 700px;
            animation: fadeInUp 0.5s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 24px;
        }

        .form-group {
            flex: 1 1 calc(50% - 10px);
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 0.875rem;
            font-weight: 600;
            color: #111827;
            margin-bottom: 6px;
        }

        input[type="number"] {
            padding: 12px 16px;
            border: 1px solid #d1d5db;
            border-radius: var(--radius);
            font-size: 1rem;
            transition: var(--transition);
        }

        input[type="number"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.2);
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 16px;
            margin-top: 32px;
        }

        button,
        input[type="reset"] {
            padding: 12px 24px;
            font-size: 1rem;
            font-weight: 600;
            border: none;
            border-radius: var(--radius);
            cursor: pointer;
            transition: var(--transition);
        }

        button[type="submit"] {
            background-color: var(--primary-color);
            color: var(--white);
        }

        button[type="submit"]:hover {
            background-color: var(--primary-hover);
        }

        input[type="reset"] {
            background-color: var(--danger-color);
            color: var(--white);
        }

        input[type="reset"]:hover {
            background-color: #dc2626;
        }

        @media (max-width: 600px) {
            .form-row {
                flex-direction: column;
            }

            .form-group {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>



<h1>Créer un nouveau voyage</h1>

<form action="VoyageController" method="post">
<%
    // Récupération de l'objet Trajet envoyé par le servlet (si existant)
    Trajet trajet = (Trajet) request.getAttribute("trajet");
%>

<% if (trajet != null) { %>
    <div style="margin-bottom: 30px; background-color: #ebf5ff; padding: 15px; border-radius: 10px; text-align: center;">
        <h3>Trajet sélectionné</h3>
        <p><strong>Départ :</strong> <%= trajet.getVille_Depart() %></p>
        <p><strong>Destination :</strong> <%= trajet.getDestination() %></p>
        <p><strong>Date :</strong> <%= trajet.getDate() %></p>

        <!-- Champ caché pour transmettre l'ID du trajet au servlet VoyageController -->
        <input type="hidden" name="trajet_id" value="<%= trajet.getID() %>">
    </div>
<% } else { %>
    <h3>Aucun trajet sélectionné.</h3>
<% } %>

    <!-- Classe 1 -->
    <div class="form-row">
        <div class="form-group">
            <label for="nbp_class1">Nombre de places classe 1</label>
            <input type="number" id="nbp_class1" name="nbp_class1" required min="0">
        </div>
        <div class="form-group">
            <label for="prix_class1">Prix classe 1</label>
            <input type="number" id="prix_class1" name="prix_class1" required min="0">
        </div>
    </div>

    <!-- Classe 2 -->
    <div class="form-row">
        <div class="form-group">
            <label for="nbp_class2">Nombre de places classe 2</label>
            <input type="number" id="nbp_class2" name="nbp_class2" required min="0">
        </div>
        <div class="form-group">
            <label for="prix_class2">Prix classe 2</label>
            <input type="number" id="prix_class2" name="prix_class2" required min="0">
        </div>
    </div>

    <!-- Classe 3 -->
    <div class="form-row">
        <div class="form-group">
            <label for="nbp_class3">Nombre de places classe 3</label>
            <input type="number" id="nbp_class3" name="nbp_class3" required min="0">
        </div>
        <div class="form-group">
            <label for="prix_class3">Prix classe 3</label>
            <input type="number" id="prix_class3" name="prix_class3" required min="0">
        </div>
    </div>

    <!-- Boutons -->
    <div class="btn-container">
        <button type="submit">Enregistrer</button>
        <input type="reset" value="Réinitialiser">
    </div>

</form>

</body>
</html>