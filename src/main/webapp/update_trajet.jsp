<%@ page import="dao.TrajetDAO" %>
<%
    long id = Long.parseLong(request.getParameter("id"));
    String dateStr = request.getParameter("date");
    String villeDepart = request.getParameter("ville_depart");
    String destination = request.getParameter("destination");

    java.sql.Date date = java.sql.Date.valueOf(dateStr);

    TrajetDAO dao = new TrajetDAO();
    boolean success = dao.update(id, date, villeDepart, destination);

    if (success) {
        response.sendRedirect("admin_trajets.jsp");
    } else {
        out.println("<p>Erreur lors de la mise à jour.</p>");
    }
%>