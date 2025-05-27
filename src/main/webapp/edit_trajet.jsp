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
    <title>Modifier un Trajet</title>
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

        .container {
            max-width: 600px;
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

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            font-size: 0.95rem;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            margin-top: 5px;
            transition: border-color 0.3s ease;
        }

        input:focus {
            border-color: var(--accent-color);
            outline: none;
        }

        .btn-submit {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
        }

        .btn-submit:hover {
            background-color: #2980b9;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: var(--accent-color);
            text-decoration: underline;
            font-size: 0.95rem;
        }

        .back-link:hover {
            color: #2980b9;
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
    <h3>Modifier le trajet</h3>
    <form action="update_trajet.jsp" method="post">
        <input type="hidden" name="id" value="<%= trajet.getID() %>">

        <label for="date">Date</label>
        <input type="date" name="date" id="date" value="<%= trajet.getDate() %>" required>

        <label for="ville_depart">Ville de départ</label>
        <input type="text" name="ville_depart" id="ville_depart" value="<%= trajet.getVille_Depart() %>" required>

        <label for="destination">Destination</label>
        <input type="text" name="destination" id="destination" value="<%= trajet.getDestination() %>" required>

        <button type="submit" class="btn-submit">Mettre à jour</button>
    </form>
    <a href="admin_trajets.jsp" class="back-link">Retour à la liste</a>
</div>

</body>
</html>