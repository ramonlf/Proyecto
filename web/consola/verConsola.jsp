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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <h1>Consolas actuales</h1>
        <a href="crearConsola.jsp" class="btn btn-primary m-2">Añadir consola</a>
        <table id="tabla" class="table table-striped">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Generacion</th>
                    <th>Fecha de Lanzamiento</th>
                    <th>URL</th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <td colspan="6"><input type="text" id="buscar" class="form-control" placeholder="Introduce algo para filtrar..."/></td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="con" items="${consolaBean.consolas}">
                    <tr>
                        <td>${con.nombre}</td>
                        <td>${con.generacion}</td>
                        <td>${con.fechaLanzamientoCorta}</td>
                        <td>${con.url}</td>
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
            </tbody>
        </table>
        <a href="../administrador/administracion.jsp">Volver</a>
    </body>
    <script src="../js/filtro.js"></script>
</html>
