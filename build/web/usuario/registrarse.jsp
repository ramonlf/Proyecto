<%-- 
    Document   : registrarse
    Created on : 04-abr-2021, 10:57:39
    Author     : Ramon
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
    </head>
    <body>
        <h1>Registrarse</h1>
        <form action="RegistroUsuario" method="POST">
            
            <label for="dni">Dni: </label>
            <input type="text" name="dni" id="dni" pattern="[0-9]{8}[A-Za-z]{1}" required /> <br>
            <label>Nombre: </label>
            <input type="text" name="nombre" id="nombre" required /><br>
            <label>Apellido: </label>
            <input type="text" name="apellido" id="apellido" required /><br>
            <label>Nombre de Usuario: </label>
            <input type="text" name="login" id="login" required />
            <label>Contraseña: </label>
            <input type="password" name="password" id="password" required /><br>
            <label>Fecha Nacimiento: </label>
            <input type="text" name="fechaNacimiento" id="fechaNacimiento" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" required /><br>
            <input name="enviar" id="enviar" type="submit" />
            <input name="reset" id="reset" type="reset" />
        </form>
    </body>
</html>
