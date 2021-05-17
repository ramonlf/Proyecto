<%-- 
    Document   : editarJuego
    Created on : 17-may-2021, 20:10:49
    Author     : Ramon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="EditarJuego" method="POST">
            <label>Nombre: </label>
            <input type="hidden" name="id" id="id" value="${id}" />
            <input type="text" name="nombre" id="nombre" value="${nombre}" required />
            <label>Genero:</label>
            <input type="text" name="genero" id="genero" pattern="[A-Z]{1}[a-z]*" value="${genero}" required />
            <label>Precio: </label>
            <input type="number" step="0.01" min="0" id="precio" name="precio" value="${precio}" required />
            <label>Consola:</label>
            <select name="consola" id="consola" name="consola" >
                <c:forEach var="con" items="${consolaBean.consolas}" >
                    <option value="${con.nombre}">${con.nombre}</option>
                </c:forEach>
            </select>
            <label>Url de la imagen</label>
            <input type="text"  name="url" id="url" value="${url}" required />
            <label>Cantidad:</label>
            <input type="number" id="cantidad" name="cantidad" value="${cantidad}" required />
            <label>Fecha de Lanzamiento</label>
            <input type="date" id="fechaLanzamiento" name="fechaLanzamiento" required />
            <input type="submit" id="actualizar" name="actualizar" value="Editar" />
            <input type="reset" id="limpiar" name="limpiar" value="Limpiar" />
        </form>
    </body>
</html>
