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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/fondo.css">
    </head>
    <nav class="navbar navbar-expand-lg navbar-light text-light">
        <a class="navbar-brand ml-lg-5" href="../index.jsp"><img src="../fotos/logo/logo.png" width="80" alt="Logo"></a>
        <button class="navbar-toggler" id="botonHamburguesa" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="text-light"><i class="fa fa-bars fa-2x"></i></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto" id="menu">
                <li class="nav-item active">
                    <a class="nav-link text-light ml-lg-1" href="../index.jsp">Inicio <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link text-light" href="../juego/directorioJuegos.jsp">Juegos</a>
                </li>

            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 " type="submit" id="search"><i class="fa fa-search"></i></button>
            </form>
            <c:if test="${usuario == null}">
                <a class="btn btn-primary  my-sm-0" id="login" href="login.jsp"><i class="fa fa-user mr-1"></i>Iniciar Sesión</a>
                <a class="btn btn-primary  my-sm-0 ml-lg-2" id="sigUp" href="registrarse.jsp"><i class="fas fa-sign-in-alt"></i>Registrarse</a>
            </c:if>
            <c:if test="${usuario != null}">    
                <div class="dropdown ml-lg-2">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user mr-2"></i>${usuario.login}
                    </button>
                    <div class="dropdown-menu bg-dark" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item text-light" href="EditarPerfil"><i class="fa fa-user mr-1"></i>Editar Perfil</a>
                        <a class="dropdown-item text-light" href="../administrador/administracion.jsp"><i class="fa fa-user mr-1"></i>Administrar Sitio</a>
                        <a class="dropdown-item text-light" href="../CerrarSesion"><i class="fa fa-power-off mr-1"></i>Cerrar Sesion</a>
                    </div>
                </div>
            </c:if>

        </div>
    </nav>
    <body>
        <div class="offset-lg-2 col-lg-8">
            <div class="card mt-4">
                <div class="card-header">
                    <h1>Usuarios</h1>
                </div>
                <div class="card-body">
                    <table id="tabla" class="table table-striped">
                        <thead>
                            <tr>
                                <th>DNI</th>
                                <th>Login</th>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Contraseña</th>
                                <th>Fecha nacimiento</th>
                                <th>Email</th>
                                <th>Telefono</th>
                                <th>Administradorador<th>
                                <th></th>

                            </tr>
                            <tr>
                                <td colspan="11"><input type="text" id="buscar" class="form-control" placeholder="Introduce algo para filtrar..."/></td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="usu" items="${usuarioBean.usuarios}">
                                <tr>
                                    <td>${usu.dni}</td>
                                    <td>${usu.login}</td>
                                    <td>${usu.nombre}</td>
                                    <td>${usu.apellido}</td>
                                    <td>${usu.password}</td>
                                    <td>${usu.fechaNacimientoCorta}</td>
                                    <td>${usu.email}</td>
                                    <td>${usu.telefono}</td>
                                    <td><input type="checkbox" <c:if test="${usu.administrador}">checked="checked" </c:if> disabled/></td>
                                        <td>
                                            <form action="EditarUsuario" method="POST">
                                                <input type="hidden" name="id" value="${usu.id}"/>
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
                </div>

                <a href="../administrador/administracion.jsp" class="btn btn-primary">Volver</a>
            </div>
        </div>
    </body>
    <script src="../js/filtro.js"></script>
</html>
