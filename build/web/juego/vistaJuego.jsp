<%-- 
    Document   : vistaJuego
    Created on : 30-may-2021, 11:34:45
    Author     : Ramon
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vista juego</title>
    </head>
    <body>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/vistaJuego.css">

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
                    <a class="btn btn-primary  my-sm-0" id="login" href="../usuario/login.jsp"><i class="fa fa-user mr-1"></i>Iniciar Sesi??n</a>
                    <a class="btn btn-primary  my-sm-0 ml-lg-2" id="sigUp" href="../usuario/registrarse.jsp"><i class="fas fa-sign-in-alt"></i>Registrarse</a>
                </c:if>
                <c:if test="${usuario != null}">  
                    <form action="../usuario/Carrito" method="POST">
                        <button type="submit" name="verCarrito"  class="btn" ><span class="rojo">${usuario.carrito.size()}</span><i class="fa fa-cart-arrow-down fa"></i></button>
                    </form>
                    <div class="dropdown ml-lg-2">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user mr-2"></i>${usuario.login}
                        </button>
                        <div class="dropdown-menu bg-dark" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item text-light" href="../usuario/EditarPerfil"><i class="fa fa-user mr-1"></i>Editar Perfil</a>
                            <c:if test="${usuario.administrador}">
                                <a class="dropdown-item text-light" href="../administrador/administracion.jsp"><i class="fa fa-user mr-1"></i>Administrar Sitio</a>
                            </c:if>
                            <a class="dropdown-item text-light" href="../usuario/verPedidos.jsp"><i class="fa fa-user mr-1"></i>Pedidos</a>
                            <a class="dropdown-item text-light" href="../CerrarSesion"><i class="fa fa-power-off mr-1"></i>Cerrar Sesion</a>
                        </div>
                    </div>
                </c:if>

            </div>
        </nav>
        <div class="offset-lg-2 card mt-4 mb-4">
            <div class="row mt-5">

                <!--Principio foto y botones-->
                <div class=" col-lg-4 offset-lg-1">

                    <div id="fotoAnime">
                        <div class="imagen">
                            <figure>
                                <img src="../fotos/juegos/${url}" class="mt-2 mb-2">
                            </figure>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-12">
                            <c:if test="${cantidad > 0}">
                                <button  class="btn-success form-control" > Disponible </button>
                            </c:if>
                            <c:if test="${cantidad < 1}">
                                <button  class="btn-danger form-control" > No disponible </button>
                            </c:if>
                        </div>



                        <c:if test="${usuario != null}">
                            <div class="col-sm-12">
                                <form action="../usuario/Carrito">

                                    <input type="hidden" name="id" value="${id}" />
                                    <button type="submit"  value="carrito" name="carrito" class="btn form-control" > <i class="fa fa-cart-plus"></i> </button>
                                </form>
                            </div>
                        </c:if>

                    </div>
                </div>

                <!--Fin Foto y botones-->
                <div class="col-lg-6 ">
                    <div class="container pl-lg-5 pt-2 pb-2 fondoBlanco rounded-right rounded-left">
                        <h4 class="font-weight-bold">${nombre} (${consola}) ${consola} clave GLOBAL</h4>
                        <div class="card-default text-dark bg-dark mb-3" style="max-width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title text-center font-weight-bold text-light">${precio}&#8364;</h5>                               
                            </div>
                        </div>
                        <!--<div class="votos mb-2">

                            <div class="contenedor">
                                <span id="nota">3.9</span>
                            </div>
                            <div class="contenedor">

                                <form class="d-inline">
                                    <span class="clasificacion">
                                        <input id="radio1" type="radio" name="estrellas" value="5">
                                        <label for="radio1">???</label>
                                        <input id="radio2" type="radio" name="estrellas" value="4">
                                        <label for="radio2">???</label>
                                        <input id="radio3" type="radio" name="estrellas" value="3">
                                        <label for="radio3">???</label>
                                        <input id="radio4" type="radio" name="estrellas" value="2">
                                        <label for="radio4">???</label>
                                        <input id="radio5" type="radio" name="estrellas" value="1">
                                        <label for="radio5">???</label>
                                    </span>
                                </form>
                            </div>
                        </div> -->
                        <div id="descripcion" class="container">
                            <h4>${nombre} (${consola})</h4>
                            <p>${descripcion}
                            </p>
                        </div>
                        <div class="container">
                            <h4>Genero: </h4>
                            <p>${genero}</p>
                        </div>
                        <div class="container">
                            <h4>Fecha de lanzamiento: </h4>
                            <p>${fechaLanzamiento}</p>
                        </div>
                        <c:if test="${usuario.administrador}" >
                            <div class="container">
                                <h4>Stock: </h4>
                                <c:if test="${cantidad > 0}">
                                    <p class="h3 ">${cantidad} <span class="text-success">disponibles</span></p>
                                </c:if>

                                <c:if test="${cantidad < 1}">
                                    <p class="h3 ">${cantidad} <span class="text-danger">disponibles</span></p>
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                </div>

            </div>
        </div>

        <footer id="footer " class=" pt-2 pb-1 fixed-bottom ">
            <div class="container-fluid mt-0 ">
                <p> &copy; 2021 PlayMon.com <span class="float-right"> <a href="../juego/directorioJuegos.jsp">Directorio</a></span> <span class="float-right mr-2"><a href="../home.jsp">Inicio</a></span> </p>

            </div>
        </footer>
    </body>
</html>
