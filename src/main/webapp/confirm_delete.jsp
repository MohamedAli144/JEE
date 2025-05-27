<%@ page import="dao.TrajetDAO" %>
<%
    String idStr = request.getParameter("id");
    long id = Long.parseLong(idStr);

    TrajetDAO dao = new TrajetDAO();
    boolean success = dao.delete(id);

    if (success) {
        response.sendRedirect("admin_trajets.jsp");
    } else {
        out.println("<p>Erreur lors de la suppression.</p>");
    }
%>