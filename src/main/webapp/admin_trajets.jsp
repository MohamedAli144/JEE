<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.TrajetDAO, model.Trajet, java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Trajets - Admin</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --accent-color: #3498db;
            --success-color: #27ae60;
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

        h2 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 30px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }

        .actions-bar {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .btn-create {
            display: inline-block;
            padding: 10px 20px;
            background-color: var(--accent-color);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 1rem;
            transition: var(--transition);
        }

        .btn-create:hover {
            background-color: #2980b9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        thead {
            background-color: var(--primary-color);
            color: white;
        }

        th, td {
            padding: 16px 20px;
            text-align: left;
        }

        tr:hover {
            background-color: #ecf0f1;
        }

        tbody tr:nth-child(even) {
            background-color: #fbfbfb;
        }

        .actions a {
            display: inline-block;
            padding: 6px 12px;
            margin-right: 8px;
            text-decoration: none;
            color: white;
            border-radius: 6px;
            font-size: 0.9rem;
            transition: var(--transition);
        }

        .btn-edit {
            background-color: var(--success-color);
        }

        .btn-delete {
            background-color: var(--danger-color);
        }

        .actions a:hover {
            opacity: 0.9;
        }

        .empty-message {
            text-align: center;
            padding: 40px;
            font-size: 1.2rem;
            color: #777;
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead {
                display: none;
            }

            tr {
                margin-bottom: 20px;
                background-color: var(--card-bg);
                border-radius: var(--border-radius);
                padding: 15px;
            }

            td {
                display: flex;
                justify-content: space-between;
                padding: 8px 10px;
                font-size: 0.95rem;
            }

            td::before {
                content: attr(data-label);
                font-weight: bold;
                color: var(--primary-color);
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="actions-bar">
        <a href="TrajetFormView.jsp" class="btn-create">+ Nouveau Trajet</a>
    </div>

    <h2>Liste des Trajets</h2>

    <%
        TrajetDAO trajetDAO = new TrajetDAO();
        List<Trajet> trajets = trajetDAO.findAll();

        if (trajets == null || trajets.isEmpty()) {
    %>
        <div class="empty-message">
            Aucun trajet trouvé dans la base de données.
        </div>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Ville de départ</th>
                    <th>Destination</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Trajet t : trajets) {
                %>
                    <tr>
                        <td data-label="ID"><%= t.getID() %></td>
                        <td data-label="Date"><%= t.getDate() %></td>
                        <td data-label="Ville de départ"><%= t.getVille_Depart() %></td>
                        <td data-label="Destination"><%= t.getDestination() %></td>
                        <td class="actions">
                            <a href="edit_trajet.jsp?id=<%= t.getID() %>" class="btn-edit">Modifier</a>
                            <a href="delete_trajet.jsp?id=<%= t.getID() %>" class="btn-delete"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce trajet ?');">
                                Supprimer
                            </a>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        }
    %>
</div>

</body>
</html>