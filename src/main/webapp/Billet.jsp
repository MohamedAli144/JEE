<%@page import="dao.UserDAO"%>
<%@page import="dao.VoyageDAO"%>
<%@page import="model.User"%>
<%@page import="model.Voyage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
<%@ page import="dao.ReservationDAO" %>
<%@ page import="java.time.LocalDate" %>
<%@ include file="Navbar_user.jsp" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Réservations Futures</title>
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

        .btn-annuler {
            background-color: var(--danger-color);
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: var(--transition);
        }

        .btn-annuler:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Mes Réservations à Venir</h2>

    <%
        User utilisateur = (User) session.getAttribute("user");
        if (utilisateur == null) {
    %>
        <div class="empty-message">Vous devez être connecté pour voir vos réservations.</div>
    <%
        } else {
            ReservationDAO reservationDAO = new ReservationDAO();
            VoyageDAO voyageDAO = new VoyageDAO();
            List<Reservation> reservations = reservationDAO.findByUserId((long)utilisateur.getId());
            boolean aDesResultats = false;

            if (reservations == null || reservations.isEmpty()) {
    %>
        <div class="empty-message">Aucune réservation trouvée pour votre compte.</div>
    <%
            } else {
                LocalDate aujourdHui = LocalDate.now();
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date de Réservation</th>
                    <th>Classe 1</th>
                    <th>Classe 2</th>
                    <th>Classe 3</th>
                    <th>Somme</th>
                    <th>Ville Départ</th>
                    <th>Destination</th>
                    <th>Date Voyage</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Reservation r : reservations) {
                        Voyage voyage = voyageDAO.findById(r.getVoyageId());
                        if (voyage != null && voyage.getTrajet() != null && voyage.getTrajet().getDate() != null) {
                            java.sql.Date dateVoyageSql = voyage.getTrajet().getDate();
                            java.time.LocalDate dateVoyage = dateVoyageSql.toLocalDate();

                            if (dateVoyage.isAfter(aujourdHui)) { // date du voyage > aujourd'hui
                                aDesResultats = true;
                                String villeDepart = voyage.getTrajet().getVille_Depart();
                                String destination = voyage.getTrajet().getDestination();
                %>
                <tr>
                    <td><%= r.getId() %></td>
                    <td><%= r.getDateRes() %></td>
                    <td><%= r.getNbp_resv_c1() %></td>
                    <td><%= r.getNbp_resv_c2() %></td>
                    <td><%= r.getNbp_resv_c3() %></td>
                    <td><%= r.getSomme() %> DT</td>
                    <td><%= villeDepart %></td>
                    <td><%= destination %></td>
                    <td><%= dateVoyage %></td>
                    <td>
                        <form method="post" action="AnnulerReservation.jsp" onsubmit="return confirm('Confirmer l\'annulation de cette réservation ?');">
                            <input type="hidden" name="reservationId" value="<%= r.getId() %>">
                            <button type="submit" class="btn-annuler">Annuler</button>
                        </form>
                    </td>
                </tr>
                <%
                            }
                        }
                    }
                %>
            </tbody>
        </table>
        <%
            if (!aDesResultats) {
        %>
            <div class="empty-message">Aucune réservation future trouvée.</div>
        <%
            }
        }
    }
    %>
</div>
</body>
</html>
