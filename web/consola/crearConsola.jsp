<%-- 
    Document   : crearConsola
    Created on : 24-abr-2021, 11:00:28
    Author     : Ramon
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Consola</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/fondo.css">
    </head>
    <body>
        <h1>Añadir una consola</h1>
        <form action="CrearConsola" method="POST" >
            <label>Nombre: </label>
            <input type="text" id="nombre" name="nombre" placeholder="Introduce nombre de la consola" value="${nombre}" required />
            <label>Generacion: </label>
            <input type="number" id="generacion" name="generacion" min="0" value="${generacion}" required />
            <label>Fecha de lanzamiento: </label>
            <input type="text" name="fechaLanzamiento" id="fechaLanzamiento" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" placeholder="dd/mm/yyyy" value="${fechaLanzamiento}" required /><br>
            <label>URL de la imagen:</label>
            <input type="file" id="url" name="url" accept="image/*" value="${url}" required />
            <input type="submit" name="enviar" value="Enviar" id="enviar" />
            <input type="reset" name="reset" value="Limpiar" id="reset" />
        </form>
    </body>
</html>
