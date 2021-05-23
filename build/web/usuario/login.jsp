<%-- 
    Document   : login
    Created on : 16-abr-2021, 10:49:47
    Author     : usuario
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
        <form action="Login" method="POST">
            <label>Usuario: </label>
            <input type="text" id="login" name="login" placeholder="ej: ejemplo" required />
            <label>Contrase�a: </label>
            <input type="password" id="password" name="password" placeholder="introduce tu contrase�a" required />
            <input type="submit" name="enviar" id="enviar" value="Iniciar sesion" />
            <input type="reset" name="reset" id="reset" value="Limpiar campos" />
        </form>
    </body>
</html>
