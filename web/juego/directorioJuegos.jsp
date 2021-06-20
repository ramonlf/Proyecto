<%-- 
    Document   : directorio
    Created on : 19-jun-2021, 11:44:40
    Author     : Ramon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/fondo.css">
    </head>
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
                <a class="btn btn-primary  my-sm-0" id="login" href="../usuario/login.jsp"><i class="fa fa-user mr-1"></i>Iniciar Sesi�n</a>
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
    <div class="row offset-lg-1 col-lg-11">

        <form action="Directorio" method="GET">
            <div class="dropdown mt-2 ml-4">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Consolas
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <button class="dropdown-item" type="submit" name="todos">Todos</button>
                    <c:forEach var="jue" items="${consolaBean.consolas}">
                        <button class="dropdown-item" type="submit" name="${jue.nombre}">${jue.nombre}</button>
                    </c:forEach>

                </div>
            </div>
        </form>
    </div>
    <div class="row offset-lg-1 col-lg-11">
        <c:forEach var="jue" items="${juegoBean.juegos}">
            <c:choose>
                <c:when test="${param.consola != null}">
                    <c:if test="${jue.consola.nombre.equals(param.consola)}">
                        <div class="col-lg-2 ml-2">
                            <div class="card border mt-3 mb-1">
                                <form action="VistaJuego" method="POST" >
                                    <button type="submit" ><img class="card-img-top" src="../fotos/juegos/${jue.url}" alt="Imagen ${jue.nombre}  ${jue.consola.nombre}"></button>
                                    <div class="card-body">
                                        <h5 class="card-title">${jue.nombre}</h5>
                                        <p>${jue.consola.nombre}</p>
                                        <input type="hidden" name="id" value="${jue.id}" />
                                        <p class="card-text">Precio: ${jue.precio} &#8364;</p>
                                    </div>
                                </form>

                                <div class="form-row">
                                    <c:if test="${usuario != null}">
                                        <div class="col-sm-6">
                                        </c:if>
                                        <c:if test="${usuario == null}">
                                            <div class="col-sm-12">
                                            </c:if>
                                            <form action="VistaJuego" method="POST">
                                                <input type="hidden" name="id" value="${jue.id}" />
                                                <input type="submit"  value="Ver" name="vistaJuego" class="btn form-control" />
                                            </form>
                                        </div>

                                        <c:if test="${usuario != null}">
                                            <div class="col-sm-6">
                                                <form action="../usuario/Carrito">

                                                    <input type="hidden" name="id" value="${jue.id}" />
                                                    <button type="submit" value="carrito" name="carrito" class="btn form-control" > <i class="fa fa-cart-plus"></i> </button>
                                                </form>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:when>

                    <c:otherwise>

                        <div class="col-lg-2 ml-2">
                            <div class="card border mt-3 mb-1">
                                <form action="VistaJuego" method="POST" >
                                    <button type="submit" ><img class="card-img-top" src="../fotos/juegos/${jue.url}" alt="Imagen ${jue.nombre}  ${jue.consola.nombre}"></button>
                                    <div class="card-body">
                                        <h5 class="card-title">${jue.nombre}</h5>
                                        <p>${jue.consola.nombre}</p>
                                        <input type="hidden" name="id" value="${jue.id}" />
                                        <p class="card-text">Precio: ${jue.precio} &#8364;</p>
                                    </div>
                                </form>

                                <div class="form-row">
                                    <c:if test="${usuario != null}">
                                        <div class="col-sm-6">
                                        </c:if>
                                        <c:if test="${usuario == null}">
                                            <div class="col-sm-12">
                                            </c:if>
                                            <form action="VistaJuego" method="POST">
                                                <input type="hidden" name="id" value="${jue.id}" />
                                                <input type="submit"  value="Ver" name="vistaJuego" class="btn form-control" />
                                            </form>
                                        </div>

                                        <c:if test="${usuario != null}">
                                            <div class="col-sm-6">
                                                <form action="../usuario/Carrito">

                                                    <input type="hidden" name="id" value="${jue.id}" />
                                                    <button type="submit" value="carrito" name="carrito" class="btn form-control" > <i class="fa fa-cart-plus"></i> </button>
                                                </form>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </div>

    <footer id="footer " class=" pt-2 pb-1 fixed-bottom ">
        <div class="container-fluid mt-0 ">
            <p> &copy; 2021 PlayMon.com <span class="float-right"> <a href="../juego/directorioJuegos.jsp">Directorio</a></span> <span class="float-right mr-2"><a href="../home.jsp">Inicio</a></span> </p>

        </div>
    </footer>


</div>
</body>
</html>
