<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Voyage, model.Trajet, dao.VoyageDAO, dao.TrajetDAO, java.util.List" %>
<%
    // Récupérer l'id depuis l'URL
    String idStr = request.getParameter("id");
    int id = 0;
    Voyage voyage = null;

    if (idStr != null && !idStr.isEmpty()) {
        try {
            id = Integer.parseInt(idStr);
            VoyageDAO voyageDAO = new VoyageDAO();
            voyage = voyageDAO.findById(id);
        } catch (NumberFormatException e) {
            response.sendRedirect("voyages.jsp"); // Redirection si ID invalide
            return;
        }
    }

    if (voyage == null) {
%>
    <jsp:forward page="voyages.jsp" />
<%
        return;
    }

    TrajetDAO trajetDAO = new TrajetDAO();
    List<Trajet> trajets = trajetDAO.findAll();
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Voyage</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            padding: 20px;
        }

        .container {
            max-width: 700px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="number"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
        }

        .submit-row {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            color: white;
            text-align: center;
        }

        .btn-save {
            background-color: #27ae60;
        }

        .btn-cancel {
            background-color: #95a5a6;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Modifier le Voyage</h2>
    <form action="editVoyageController" method="post">
        <input type="hidden" name="id" value="<%= voyage.getId() %>">

        <label for="trajet_id">Trajet Associé :</label>
        <select name="trajet_id" id="trajet_id" required>
            <%
                for (Trajet t : trajets) {
                    boolean selected = t.getID() == voyage.getTrajet().getID();
            %>
                <option value="<%= t.getID() %>" <%= selected ? "selected" : "" %>>
                    <%= t.getVille_Depart() %> → <%= t.getDestination() %> (le <%= t.getDate() %>)
                </option>
            <%
                }
            %>
        </select>

        <label for="nbp_class1">Places Classe 1 :</label>
        <input type="number" id="nbp_class1" name="nbp_class1" min="0"
               value="<%= voyage.getNbp_class1() %>" required>

        <label for="prix_class1">Prix Classe 1 (€) :</label>
        <input type="number" id="prix_class1" name="prix_class1" min="0"
               step="0.01" value="<%= voyage.getPrix_class1() %>" required>

        <label for="nbp_class2">Places Classe 2 :</label>
        <input type="number" id="nbp_class2" name="nbp_class2" min="0"
               value="<%= voyage.getNbp_class2() %>" required>

        <label for="prix_class2">Prix Classe 2 (€) :</label>
        <input type="number" id="prix_class2" name="prix_class2" min="0"
               step="0.01" value="<%= voyage.getPrix_class2() %>" required>

        <label for="nbp_class3">Places Classe 3 :</label>
        <input type="number" id="nbp_class3" name="nbp_class3" min="0"
               value="<%= voyage.getNbp_class3() %>" required>

        <label for="prix_class3">Prix Classe 3 (€) :</label>
        <input type="number" id="prix_class3" name="prix_class3" min="0"
               step="0.01" value="<%= voyage.getPrix_class3() %>" required>

        <div class="submit-row">
            <a href="voyages.jsp" class="btn btn-cancel">Annuler</a>
            <button type="submit" class="btn btn-save">Enregistrer</button>
        </div>
    </form>
</div>
</body>
</html>