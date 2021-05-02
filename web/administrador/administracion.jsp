<%-- 
    Document   : administrador
    Created on : 18-abr-2021, 10:58:01
    Author     : Ramon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <c:if test="${usuario.administrador}">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Añadir juego</title>
        </head>
        <body>
            <h1>Zona de administración</h1>
            <div>
                <div>
                    <h2>Administración de Juego</h2>
                    <a href="../juego/crearJuego.jsp">Añadir nuevo Juego</a>
                </div>
                <div>
                    <h2>Administración de consolas</h2>
                    <a href="../consola/crearConsola.jsp">Añadir nueva consola</a>
                </div>
            </div>
        </body>
    </c:if>
</html>
