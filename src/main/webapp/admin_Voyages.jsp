<%@page import="model.Trajet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.VoyageDAO, model.Voyage, java.util.List" %>
<!DOCTYPE html>
<%@ include file="navbar.jsp" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Voyages - Admin</title>
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

        .places-cell {
            display: flex;
            flex-direction: column;
            gap: 4px;
            font-size: 0.95em;
        }

        .places-cell span {
            padding-left: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    

    <h2>Liste des Voyages</h2>

    <%
        VoyageDAO voyageDAO = new VoyageDAO();
        List<Voyage> voyages = voyageDAO.findAll();

        if (voyages == null || voyages.isEmpty()) {
    %>
        <div class="empty-message">
            Aucun voyage trouvé dans la base de données.
        </div>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date du Trajet</th>
                    <th>Places Disponibles</th>
                    <th>Trajet Associé</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Voyage v : voyages) {
                        Trajet trajet = v.getTrajet();
                        String nomTrajet = trajet != null ? trajet.getVille_Depart() + " → " + trajet.getDestination() : "Aucun";
                        String dateTrajet = trajet != null ? trajet.getDate().toString() : "N/A";
                %>
                    <tr>
                        <td data-label="ID"><%= v.getId() %></td>
                        <td data-label="Date du Trajet"><%= dateTrajet %></td>
                        <td data-label="Places Disponibles" class="places-cell">
                            <span>Classe 1 : <%= v.getNbp_class1() %> places à <%= v.getPrix_class1() %> DT</span>
                            <span>Classe 2 : <%= v.getNbp_class2() %> places à <%= v.getPrix_class2() %> DT</span>
                            <span>Classe 3 : <%= v.getNbp_class3() %> places à <%= v.getPrix_class3() %> DT</span>
                        </td>
                        <td data-label="Trajet Associé"><%= nomTrajet %></td>
                        <td class="actions">
                            <a href="edit_voyage.jsp?id=<%= v.getId() %>" class="btn-edit">Modifier</a>
                            <a href="delete_voyage.jsp?id=<%= v.getId() %>" class="btn-delete"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce voyage ?');">
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