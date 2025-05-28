<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div style="margin-bottom: 20px; padding: 10px; background-color: #dff0d8; color: #3c763d; border-radius: 5px;">
        <%= message %>
    </div>
<%
        session.removeAttribute("message"); // Pour ne pas afficher plusieurs fois le même message
    }
%>