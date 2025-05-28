<%@page import="dao.UserDAO"%>
<%@page import="dao.VoyageDAO"%>
<%@page import="model.User"%>
<%@page import="model.Voyage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
<%@ page import="dao.ReservationDAO" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Réservations</title>
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

        * { box-sizing: border-box; }

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

        .empty-message {
            text-align: center;
            padding: 40px;
            font-size: 1.2rem;
            color: #777;
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Liste des Réservations</h2>

    <%
        ReservationDAO reservationDAO = new ReservationDAO();
        UserDAO userDAO = new UserDAO();
        VoyageDAO voyageDAO = new VoyageDAO();

        List<Reservation> reservations = reservationDAO.findAll();

        if (reservations == null || reservations.isEmpty()) {
    %>
        <div class="empty-message">Aucune réservation trouvée dans la base de données.</div>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Utilisateur</th>
                    <th>Date de Réservation</th>
                    <th>Classe 1</th>
                    <th>Classe 2</th>
                    <th>Classe 3</th>
                    <th>Somme</th>
                    <th>Ville Départ</th>
                    <th>Destination</th>
                    <th>Date Voyage</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Reservation r : reservations) {
                        User user = userDAO.findById(r.getUserId());
                        String fullName = (user != null) ? user.getPrenom() + " " + user.getNom() : "Utilisateur inconnu";

                        Voyage voyage = voyageDAO.findById(r.getVoyageId());
                        String villeDepart = (voyage != null) ? voyage.getTrajet().getVille_Depart() : "N/A";
                        String destination = (voyage != null) ? voyage.getTrajet().getDestination() : "N/A";
                        String dateVoyage = (voyage != null && voyage.getTrajet().getDate() != null) ? voyage.getTrajet().getDate().toString() : "N/A";
                %>
                <tr>
                    <td><%= r.getId() %></td>
                    <td><%= fullName %></td>
                    <td><%= r.getDateRes() %></td>
                    <td><%= r.getNbp_resv_c1() %></td>
                    <td><%= r.getNbp_resv_c2() %></td>
                    <td><%= r.getNbp_resv_c3() %></td>
                    <td><%= r.getSomme() %> DT</td>
                    <td><%= villeDepart %></td>
                    <td><%= destination %></td>
                    <td><%= dateVoyage %></td>
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
