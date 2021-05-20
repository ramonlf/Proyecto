<%-- 
    Document   : verUsuario
    Created on : 19-may-2021, 17:35:31
    Author     : Ramon
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver usuario activos</title>
    </head>
    <body>
        <h1>Usuarios</h1>
        <table>
            <tr>
                <th>DNI</th>
                <th>Login</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Contraseña</th>
                <th>Fecha nacimiento</th>
                <th>Administradorador<th>
            </tr>
            <c:forEach var="usu" items="${usuarioBean.usuarios}">
                <tr>
                    <td>${usu.dni}</td>
                    <td>${usu.login}</td>
                    <td>${usu.nombre}</td>
                    <td>${usu.apellido}</td>
                    <td>${usu.password}</td>
                    <td>${usu.fechaNacimientoCorta}</td>
                    <td><input type="checkbox" checked<c:if test="${usu.administrador}">="checked" </c:if> disabled/></td>
                    <td>
                        <form action="EditarUsuarioAdmin" method="POST">
                            <input type="hidden" name="id" value="${jue.id}"/>
                            <input type="submit" value="Editar" />
                    </td>
                    <td>
                        <input type="submit" name="eliminar" id="eliminar" value="Eliminar" />
                        </form>
                    </td>


                </tr>
            </c:forEach>
        </table>
    </body>
</html>
