<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionHttpSession = request.getSession(false);
    if (session != null) {
        session.invalidate(); // Invalider la session
    }

    // Rediriger avec un param�tre de confirmation
    response.sendRedirect("connexion.jsp?logout=success");
%>
