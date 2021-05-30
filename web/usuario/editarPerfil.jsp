<%-- 
    Document   : editarPerfil
    Created on : 30-may-2021, 10:29:28
    Author     : Ramon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar perfil: ${nombre}</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/fondo.css">
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

        <section class=" pb-5 mt-4" id="admin-course">
            <div class="container">
                <div class="col-sm-offset-2 col-sm-12 offset-xl-0 col-xl-12 offset-lg-0 col-lg-12">
                    <div class="card card-default">
                        <div class="card-header">
                            <h1>Editar Perfil: ${login}</h1>
                        </div>
                        <div class="card-body">

                            <form action="EditarPerfil" method="POST">
                                <div class="form-group">
                                    <input type="hidden" id="id" name="id" value="${id}" />
                                    <label for="dni">Dni: </label>
                                    <input type="text" name="dni" id="dni" class="form-control" pattern="[0-9]{8}[A-Za-z]{1}" value="${dni}" required /> 
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Nombre: </label>
                                        <input type="text" name="nombre" id="nombre" class="form-control" value="${nombre}" required />
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Apellido: </label>
                                        <input type="text" name="apellido" id="apellido" class="form-control" value="${apellido}" required />
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label>Nombre de Usuario: </label>
                                        <input type="text" name="login" id="login" class="form-control" value="${login}" required />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Contraseña: </label>
                                    <input type="password" name="password" class="form-control" id="password" required value="${password}" />
                                </div>
                                <div class="form-group">
                                    <label>Email:</label>
                                    <input type="email" name="email" id="email" class="form-control" placeholder="example@email.com..." value="${email}" required="" />
                                </div>
                                <div class="form-group">
                                    <label>Telefono:</label>
                                    <input type="tel" name="telefono" id="telefono" class="form-control" placeholder="123456789" value="${telefono}" required />
                                </div>



                                <div class="form-group">
                                    <label>Fecha Nacimiento: </label>
                                    <input type="text" name="fechaNacimiento" class="form-control" id="fechaNacimiento" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" placeholder="dd/mm/yyyy" value="${fechaNacimiento}" required />                               
                                </div>


                                <input type="submit" id="actualizar" name="actualizar" value="Editar" />
                                <input type="reset" id="limpiar" name="limpiar" value="Limpiar" />
                                <input type="submit" id="eliminar" name="eliminar" value="eliminar" />
                            </form>
                        </div>
                        <a href="../index.jsp" class="btn btn-primary">Volver</a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
