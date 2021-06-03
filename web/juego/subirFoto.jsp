<%-- 
    Document   : subirFoto
    Created on : 03-jun-2021, 16:49:31
    Author     : Ramon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>${error}</p>
        <form action="../SubirFichero" method="post" enctype="multipart/form-data">
            <label>Subir Fichero</label>
            <input type="file" name="fichero">
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
