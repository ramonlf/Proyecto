<%-- 
    Document   : verConsola
    Created on : 02-may-2021, 11:50:30
    Author     : Ramon
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Consolas</title>
    </head>
    <body>
        <h1>Consolas actuales</h1>
        <a href="crearConsola.jsp">Añadir consola</a>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Generacion</th>
                <th>Fecha de Lanzamiento</th>
                <th>URL</th>
            </tr>

            <c:forEach var="con" items="${consolaBean.consolas}">
                <tr>
                    <td>"${con.nombre}"</td>
                    <td>"${con.generacion}"</td>
                    <td>"${con.fechaLanzamientoCorta}"</td>
                    <td>"${con.url}"</td>
                    <td>
                        <form action="EditarConsola" method="POST">
                            <input type="hidden" name="id" value="${con.id}">
                            <input type="submit" value="Editar">
                           
                    </td>
                    <td>
                        <input type="submit" id="eliminar" name="eliminar" value="Eliminar" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="../administrador/administracion.jsp">Volver</a>
    </body>
</html>
