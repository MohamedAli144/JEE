<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO, model.User, java.util.List" %>
<!DOCTYPE html>
<%@ include file="navbar.jsp" %>

<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Utilisateurs - Admin</title>
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
    

    <h2>Liste des Utilisateurs</h2>

    <%
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.findAll();

        if (users == null || users.isEmpty()) {
    %>
        <div class="empty-message">
            Aucun utilisateur trouvé dans la base de données.
        </div>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (User u : users) {
                %>
                    <tr>
                        <td data-label="ID"><%= u.getId() %></td>
                        <td data-label="Nom"><%= u.getNom() %></td>
                        <td data-label="Prénom"><%= u.getPrenom() %></td>
                        <td data-label="Email"><%= u.getEmail() %></td>
                        
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