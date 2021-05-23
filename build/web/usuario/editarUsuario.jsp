<%-- 
    Document   : editarUsuario
    Created on : 23-may-2021, 12:24:52
    Author     : Ramon
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar usuario</title>
    </head>
    <body>
        <h1>Editar usuario</h1>
        <form action="EditarUsuario" method="POST">
            <input type="hidden" id="id" name="id" value="${id}" />
            <label for="dni">Dni: </label>
            <input type="text" name="dni" id="dni" pattern="[0-9]{8}[A-Za-z]{1}" value="${dni}" required /> <br>
            <label>Nombre: </label>
            <input type="text" name="nombre" id="nombre" value="${nombre}" required /><br>
            <label>Apellido: </label>
            <input type="text" name="apellido" id="apellido" value="${apellido}" required /><br>
            <label>Nombre de Usuario: </label>
            <input type="text" name="login" id="login" value="${login}" required />
            <label>Contraseña: </label>
            <input type="password" name="password" id="password" required value="${password}" /><br>
            <label>Email:</label>
            <input type="email" name="email" id="email" placeholder="example@email.com..." value="${email}" required="" />
            <input type="tel" name="telefono" id="telefono" placeholder="123456789" value="${telefono}" required />
            <label>Fecha Nacimiento: </label>
            <input type="text" name="fechaNacimiento" id="fechaNacimiento" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" placeholder="dd/mm/yyyy" value="${fechaNacimiento}" required /><br>
            <label>Administrador</label>
            <input type="checkbox" id="administrador" name="administrador" ${checked} />
            <input name="actualizar" id=actualizar type="submit" value="Editar" />
            <input name="reset" id="reset" type="reset" value="Limpiar"/>
        </form>
    </body>
</html>
