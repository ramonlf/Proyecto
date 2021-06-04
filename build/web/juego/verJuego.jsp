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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/administracion.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light text-light">
            <a class="navbar-brand ml-lg-5" href="../home.jsp"><img src="../fotos/logo/logo.png" width="80" alt="Logo"></a>
            <button class="navbar-toggler" id="botonHamburguesa" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="text-light"><i class="fa fa-bars fa-2x"></i></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto" id="menu">
                    <li class="nav-item active">
                        <a class="nav-link text-light ml-lg-1" href="../home.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link text-light" href="directorioJuegos.jsp">Juegos</a>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-primary my-2 " type="submit" id="search"><i class="fa fa-search"></i></button>
                </form>
                <c:if test="${usuario == null}">
                    <a class="btn btn-primary  my-sm-0" id="login" href="../usuario/login.jsp"><i class="fa fa-user mr-1"></i>Iniciar Sesión</a>
                    <a class="btn btn-primary  my-sm-0 ml-lg-2" id="sigUp" href="../usuario/registrarse.jsp"><i class="fas fa-sign-in-alt"></i>Registrarse</a>
                </c:if>
                <c:if test="${usuario != null}">    
                    <div class="dropdown ml-lg-2">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user mr-2"></i>${usuario.login}
                        </button>
                        <div class="dropdown-menu bg-dark" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item text-light" href="../usuario/EditarPerfil"><i class="fa fa-user mr-1"></i>Editar Perfil</a>
                            <c:if test="${usuario.administrador}">
                                <a class="dropdown-item text-light" href="../administrador/administracion.jsp"><i class="fa fa-user mr-1"></i>Administrar Sitio</a>
                            </c:if>
                            <a class="dropdown-item text-light" href="../CerrarSesion"><i class="fa fa-power-off mr-1"></i>Cerrar Sesion</a>
                        </div>
                    </div>
                </c:if>

            </div>
        </nav>
        <div class="offset-lg-2 col-lg-8">
            <div class="card mt-4">
                <c:if test="${!empty param.error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>${param.error}</strong> 
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>
                <c:if test="${!empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>${error}</strong> 
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>
                <div class="card-body">
                    <table id="tabla" class="table table-striped">
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
                                <td colspan="9"><input type="text" id="buscar" placeholder="Introduce algo para filtrar..." class="form-control"/></td>
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
                </div>
                <a href="../administrador/administracion.jsp" class="btn btn-primary">Volver</a>
            </div>
        </div>

        <footer id="footer " class=" pt-2 pb-1 mt-4 ">
            <div class="container-fluid mt-0 ">
                <p> &copy; 2021 PlayMon.com <span class="float-right"> <a href="../juego/directorio.jsp">Directorio</a></span> <span class="float-right mr-2"><a href="../home.jsp">Inicio</a></span> </p>

            </div>
        </footer>
    </body>
    <script src="../js/filtro.js"></script>
</html>
