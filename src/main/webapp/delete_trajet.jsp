<%@ page import="model.Trajet, dao.TrajetDAO" %>
<%
    String idStr = request.getParameter("id");
    long id = Long.parseLong(idStr);
    TrajetDAO dao = new TrajetDAO();
    Trajet trajet = dao.findById(id);

    if (trajet == null) {
        response.sendRedirect("admin_trajets.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Supprimer un Trajet</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --danger-color: #e74c3c;
            --bg-color: #f4f6f8;
            --card-bg: #ffffff;
            --text-color: #333;
            --border-radius: 10px;
            --transition: all 0.3s ease;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            padding: 20px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background-color: var(--card-bg);
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        h3 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 25px;
        }

        .confirmation-text {
            font-size: 1.1rem;
            margin-bottom: 30px;
            line-height: 1.6;
            text-align: center;
        }

        .btn-delete {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: var(--danger-color);
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
            margin-bottom: 15px;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .btn-cancel {
            display: block;
            text-align: center;
            color: var(--primary-color);
            text-decoration: underline;
            font-size: 0.95rem;
        }

        .btn-cancel:hover {
            color: #1a252f;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h3>Supprimer le trajet</h3>
    <p class="confirmation-text">
        Êtes-vous sûr de vouloir supprimer ce trajet ?<br>
        <strong>ID :</strong> <%= trajet.getID() %><br>
        <strong>Date :</strong> <%= trajet.getDate() %><br>
        <strong>Ville de départ :</strong> <%= trajet.getVille_Depart() %><br>
        <strong>Destination :</strong> <%= trajet.getDestination() %>
    </p>

    <a href="confirm_delete.jsp?id=<%= trajet.getID() %>" class="btn-delete">Oui, supprimer</a>
    <a href="admin_trajets.jsp" class="btn-cancel">Annuler</a>
</div>

</body>
</html>