<%-- 
    Document   : index
    Created on : 16-abr-2021, 12:09:43
    Author     : usuario
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id="juegoBean" class="modelo.modelo.JuegoBean"/>

    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/fondo.css">
    </head>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light text-light">
        <a class="navbar-brand ml-lg-5" href="#"><img src="fotos/logo/logo.png" width="80" alt="Logo"></a>
        <button class="navbar-toggler" id="botonHamburguesa" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="text-light"><i class="fa fa-bars fa-2x"></i></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto" id="menu">
                <li class="nav-item active">
                    <a class="nav-link text-light ml-lg-1" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link text-light" href="juego/directorioJuegos.jsp">Juegos</a>
                </li>

            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 " type="submit" id="search"><i class="fa fa-search"></i></button>
            </form>
            <c:if test="${usuario == null}">
                <a class="btn btn-primary  my-sm-0" id="login" href="usuario/login.jsp"><i class="fa fa-user mr-1"></i>Iniciar Sesi�n</a>
                <a class="btn btn-primary  my-sm-0 ml-lg-2" id="sigUp" href="usuario/registrarse.jsp"><i class="fas fa-sign-in-alt"></i>Registrarse</a>
            </c:if>
            <c:if test="${usuario != null}">    
                <div class="dropdown ml-lg-2">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user mr-2"></i>${usuario.login}
                    </button>
                    <div class="dropdown-menu bg-dark" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item text-light" href="usuario/editarPerfil"><i class="fa fa-user mr-1"></i>Editar Perfil</a>
                        <c:if test="${usuario.administrador}">
                            <a class="dropdown-item text-light" href="administrador/administracion.jsp"><i class="fa fa-user mr-1"></i>Administrar Sitio</a>
                        </c:if>
                        <a class="dropdown-item text-light" href="CerrarSesion"><i class="fa fa-power-off mr-1"></i>Cerrar Sesion</a>
                    </div>
                </div>
            </c:if>

        </div>
    </nav>
    <div>

        <div class="row offset-lg-1 col-lg-10">
            <c:forEach var="jue" items="${juegoBean.juegos}">
                <div class="col-lg-2 ml-2">
                    <div class="card border mt-3">
                        <img class="card-img-top" src="fotos/juegos/${jue.url}" alt="Imagen ${jue.nombre}  ${jue.consola.nombre}">
                        <div class="card-body">
                            <h5 class="card-title">${jue.nombre}</h5>
                            <p class="card-text">Precio: ${jue.precio} &#8364;</p>
                            <form action="MostrarJuego" method="POST">
                                <input type="hidden" value="id" name="id" id="id" />
                                <button type="submit" class="btn btn-primary">A�adir</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>



    </div>


</div>
</body>
</html>
