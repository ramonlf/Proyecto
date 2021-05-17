<%-- 
    Document   : editarConsola
    Created on : 14-may-2021, 17:49:58
    Author     : Ramon
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar consola</title>
    </head>
    <body>
        <h1>Editar ${nombre}</h1>
        <form action="EditarConsola" method="POST">
            <label>Nombre:</label>
            <input type="hidden" id="id" name="id" value="${id}" />
            <input type="text" id="nombre" name="nombre" value="${nombre}" />
            <label>Generacion:</label>
            <input type="number" id="generacion" name="generacion" value="${generacion}" required />
            <label>Fecha Lanzamiento:</label>
            <input type="date" id="fechaLanzamiento" name="fechaLanzamiento" value="${fechaLanzamiento}" required />
            <label>Nombre:</label>
            <input type="text" id="url" name="url" value="${url}" required />
            <input type="submit" name="actualizar" id="actualizar" value="Actualizar" />
            <input type="submit" name="eliminar" id="eliminar" value="Eliminar" />
        </form>
            <a href="verConsola.jsp">Volver</a>
    </body>
</html>
