<%-- 
    Document   : carrito
    Created on : 07-jun-2021, 19:36:48
    Author     : Ramon
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="usu" items="${usuario.carrito}">
            <form action="Carrito" method="post">
                <p>${usu.juego.nombre} ${usu.cantidad} <input type="submit" value=" - " name="menos"/> <input type="submit" value=" + " name="mas" /></p>
                <input type="hidden" value="${usu.juego.id}" name="id">
                
            </form>
        </c:forEach>
            <p>total: ${param.total}</p>
            <a href="../home.jsp">Volver</a>
            
    </body>
</html>
