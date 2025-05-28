<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ReservationDAO" %>
<%@ page import="model.Reservation" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Annulation de Réservation</title>
    <meta http-equiv="refresh" content="2;URL=TrajetView.jsp">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .message {
            background-color: #fff;
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            text-align: center;
        }

        .success {
            color: #27ae60;
        }

        .error {
            color: #e74c3c;
        }
    </style>
</head>
<body>

<div class="message">
    <%
        try {
            String idParam = request.getParameter("reservationId");

            if (idParam != null && !idParam.isEmpty()) {
                long reservationId = Long.parseLong(idParam);
                ReservationDAO reservationDAO = new ReservationDAO();
                boolean deleted = reservationDAO.delete(reservationId);

                if (deleted) {
    %>
                    <h2 class="success">Réservation annulée avec succès.</h2>
    <%
                } else {
    %>
                    <h2 class="error">Échec de l'annulation de la réservation.</h2>
    <%
                }
            } else {
    %>
                <h2 class="error">ID de réservation manquant.</h2>
    <%
            }
        } catch (Exception e) {
    %>
            <h2 class="error">Erreur lors de l'annulation de la réservation.</h2>
    <%
            e.printStackTrace();
        }
    %>
    <p>Redirection vers vos réservations...</p>
</div>

</body>
</html>
