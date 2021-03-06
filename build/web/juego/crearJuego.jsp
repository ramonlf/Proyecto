<%-- 
    Document   : a?adirJuego
    Created on : 18-abr-2021, 11:18:06
    Author     : Ramon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <c:if test="${usuario.administrador}">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Crear juego</title>
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
                            <a class="nav-link text-light" href="directorioJuegos.jsp">Juegos</a>
                        </li>

                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn my-2 " type="submit" id="search"><i class="fa fa-search"></i></button>
                    </form>
                    <c:if test="${usuario == null}">
                        <a class="btn my-sm-0" id="login" href="../usuario/login.jsp"><i class="fa fa-user mr-1"></i>Iniciar Sesi?n</a>
                        <a class="btn my-sm-0 ml-lg-2" id="sigUp" href="../usuario/registrarse.jsp"><i class="fas fa-sign-in-alt"></i>Registrarse</a>
                    </c:if>
                    <c:if test="${usuario != null}"> 
                        <form action="../usuario/Carrito" method="POST">
                            <button type="submit" name="verCarrito"  class="btn" ><span class="rojo">${usuario.carrito.size()}</span><i class="fa fa-cart-arrow-down fa"></i></button>
                        </form>
                        <div class="dropdown ml-lg-2">
                            <button class="btn dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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

            <section class=" pb-5 mt-4" id="admin-course">
                <div class="container">
                    <div class="col-sm-offset-2 col-sm-12 offset-xl-0 col-xl-12 offset-lg-0 col-lg-12">
                        <div class="card card-default">
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
                            <div class="card-header">
                                <h1>A?adir juego</h1>
                            </div>
                            <div class="card-body">
                                <form action="CrearJuego" method="POST" enctype="multipart/form-data" >
                                    <div class="form-group">
                                        <label>Nombre: </label>
                                        <input type="hidden" name="id" id="id" value="${id}" />
                                        <input type="text" name="nombre" id="nombre" class="form-control" value="${nombre}" required />
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Genero:</label>
                                            <input type="text" name="genero" class="form-control" id="genero" pattern="[A-Z]{1}[a-z]*" value="${genero}" required />
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Precio: </label>
                                            <input type="number" step="0.01" min="0" class="form-control" id="precio" name="precio" value="${precio}" required />
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label>Consola:</label>                       
                                            <select name="consola" id="consola" class="form-control" name="consola" >
                                                <c:forEach var="con" items="${consolaBean.consolas}" >
                                                    <option value="${con.nombre}">${con.nombre}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Descripcion:</label>
                                        <textarea class="form-control" name="descripcion" id="descripcion" required>${descripcion}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Url de la imagen</label>
                                        <input type="file"  accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" name="url" id="url" class="form-control" value="${url}"  required />
                                    </div>
                                    <div class="form-group">
                                        <label>Cantidad:</label>
                                        <input type="number" id="cantidad" class="form-control" name="cantidad" value="${cantidad}" required />
                                    </div>
                                    <div class="form-group">
                                        <label>Fecha de Lanzamiento</label>
                                        <input type="text" name="fechaLanzamiento" id="fechaLanzamiento" class="form-control" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" placeholder="dd/mm/yyyy" value="${fechaLanzamiento}" required /><br>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <input type="submit" id="crear" name="crear" class="form-control btn" value="A?adir juego" />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <input type="reset" id="limpiar" name="limpiar" class="form-control btn" value="Limpiar" />
                                        </div>
                                    </div>




                                </form>
                            </div>
                            <a href="../administrador/administracion.jsp" class="btn btn-primary">Volver</a>
                        </div>
                    </div>
                </div>
            </section>



            <footer id="footer " class=" pt-2 pb-1 fixed-bottom ">
                <div class="container-fluid mt-0 ">
                    <p> &copy; 2021 PlayMon.com <span class="float-right"> <a href="../juego/directorioJuegos.jsp">Directorio</a></span> <span class="float-right mr-2"><a href="../home.jsp">Inicio</a></span> </p>

                </div>
            </footer>
        </c:if>
</html>
