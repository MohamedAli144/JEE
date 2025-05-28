<%@ page import="model.Voyage, dao.VoyageDAO" %>
<%
    String idStr = request.getParameter("id");
    if (idStr == null || !idStr.matches("\\d+")) {
        response.sendRedirect("gestion_voyages.jsp");
        return;
    }

    int id = Integer.parseInt(idStr);
    VoyageDAO dao = new VoyageDAO();
    Voyage voyage = dao.findById(id);

    if (voyage == null) {
        response.sendRedirect("gestion_voyages.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Supprimer un Voyage</title>
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
    <h3>Supprimer le Voyage</h3>
    <p class="confirmation-text">
        Êtes-vous sûr de vouloir supprimer ce voyage ?<br>
        <strong>ID :</strong> <%= voyage.getId() %><br>
        <strong>Places Classe 1 :</strong> <%= voyage.getNbp_class1() %><br>
        <strong>Prix Classe 1 :</strong> <%= voyage.getPrix_class1() %> DT<br>
        <strong>Places Classe 2 :</strong> <%= voyage.getNbp_class2() %><br>
        <strong>Prix Classe 2 :</strong> <%= voyage.getPrix_class2() %> DT<br>
        <strong>Places Classe 3 :</strong> <%= voyage.getNbp_class3() %><br>
        <strong>Prix Classe 3 :</strong> <%= voyage.getPrix_class3() %> DT
    </p>

    <a href="confirm_delete_voyage.jsp?id=<%= voyage.getId() %>" class="btn-delete">Oui, supprimer</a>
    <a href="admin_Voyages.jsp" class="btn-cancel">Annuler</a>
</div>

</body>
</html>