<%-- 
    Document   : verJuegos
    Created on : 16-may-2021, 13:08:30
    Author     : Ramon
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver juegos</title>
    </head>
    <body>
        <table id="tabla">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Consola</th>
                    <th>Genero</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Fecha Lanzamiento</th>
                    <th>URL</th>
                </tr>
                <tr>
                    <td colspan="7"><input type="text" id="buscar" placeholder="Introduce algo para filtrar..."/></td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="jue" items="${juegoBean.juegos}">
                    <tr>
                        <td>${jue.nombre}</td>
                        <td>${jue.consola.nombre}</td>
                        <td>${jue.genero}</td>
                        <td>${jue.cantidad}</td>
                        <td>${jue.precio}</td>
                        <td>${jue.fechaLanzamientoCorta}</td>
                        <td>${jue.url}</td>
                        <td>
                            <form action="EditarJuego">
                                <input type="hidden" name="id" value="${jue.id}" />
                                <input type="submit" value="Editar" />

                        </td>
                        <td>
                            <input type="submit" name="eliminar" id="eliminar" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="../administrador/administracion.jsp">Volver</a>
    </body>
    <script src="../js/filtro.js"></script>
</html>
