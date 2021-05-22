<%-- 
    Document   : añadirJuego
    Created on : 18-abr-2021, 11:18:06
    Author     : Ramon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:if test="${usuario.administrador}">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body>
            
            <h1>Añadir un juego</h1>
            
            <form action="CrearJuego" method="POST">
                <label>Nombre: </label>
                <input type="text" name="nombre" id="nombre" required />
                <label>Genero:</label>
                <input type="text" name="genero" id="genero" pattern="[A-Z]{1}[a-z]*" required />
                <label>Precio: </label>
                <input type="number" step="0.01" min="0" id="precio" name="precio" required />
                <label>Consola:</label>
                <select name="consola" id="consola" name="consola">
                <c:forEach var="con" items="${consolaBean.consolas}">
                    <option value="${con.nombre}">${con.nombre}</option>
                </c:forEach>
                </select>
                <label>Url de la imagen</label>
                <input type="file" accept="image/*" name="url" id="url" required />
                <label>Cantidad:</label>
                <input type="number" id="cantidad" name="cantidad" required />
                <label>Fecha de Lanzamiento</label>
                <input type="text" name="fechaLanzamiento" id="fechaLanzamiento" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" placeholder="dd/mm/yyyy" value="${fechaLanzamiento}" required /><br>
                <input type="submit" id="enviar" name="enviar" value="Añadir juego" />
                <input type="reset" id="limpiar" name="limpiar" value="Limpiar Campos" />
            </form>
        </body>
    </c:if>
</html>
