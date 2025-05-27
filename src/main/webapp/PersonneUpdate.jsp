<%@page import="model.Personne"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="personne" class="model.Personne" scope="request"/>
<% Personne P = (Personne)request.getAttribute("personne"); %>
<form action="PersonneController" method=post>
ID : <input type=text name=id value='<jsp:getProperty name="personne" property="id"/>'><br>
CIN : <input type=text name=cin value='<jsp:getProperty name="personne" property="cin"/>'><br>
Nom : <input type=text name=nom value='<jsp:getProperty name="personne" property="nom"/>'><br>
Prenom : <input type=text name=prenom value='<jsp:getProperty name="personne" property="prenom"/>'><br>
<input type=submit name=update value='submit' ><br>
</form>

</body>
</html>