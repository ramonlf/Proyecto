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
            <title>A�adir juego</title>
        </head>
        <body>
            <h1>Zona de administraci�n</h1>
            <div>
                <div>
                    <h2>Administraci�n de Juego</h2>
                    <a href="../juego/crearJuego.jsp">A�adir nuevo Juego</a>
                </div>
                <div>
                    <h2>Administraci�n de consolas</h2>
                    <a href="../consola/crearConsola.jsp">A�adir nueva consola</a>
                </div>
            </div>
        </body>
    </c:if>
</html>
