<%@ page import="dao.VoyageDAO" %>
<%
    String idStr = request.getParameter("id");
    long id = Long.parseLong(idStr);

    VoyageDAO dao = new VoyageDAO();
    boolean success = dao.delete(id);

    if (success) {
        response.sendRedirect("admin_Voyages.jsp");
    } else {
        out.println("<p>Erreur lors de la suppression.</p>");
    }
%>