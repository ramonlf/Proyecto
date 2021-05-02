<%-- 
    Document   : index
    Created on : 16-abr-2021, 12:09:43
    Author     : usuario
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>Esta es la pagina principal</div>
        <div>
            <c:if test="${usuario == null}">
                <a href="usuario/login.jsp">Iniciar Sesión</a>
                <a href="usuario/registrarse.jsp">Registrarse</a>
            </c:if>
            <c:if test="${usuario != null}">
                <p>${usuario.login}</p>
                <c:if test="${usuario.administrador}">
                    <a href="administrador/administracion.jsp">Administración</a>
                </c:if>
                <a href="CerrarSesion">Cerrar Sesion</a>
            </c:if>

        </div>
    </body>
</html>
