<%-- 
    Document   : editarConsola
    Created on : 14-may-2021, 17:49:58
    Author     : Ramon
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar consola</title>
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
                            <a class="dropdown-item text-light" href="../administrador/administracion.jsp"><i class="fa fa-user mr-1"></i>Administrar Sitio</a>
                            <a class="dropdown-item text-light" href="../usuario/verPedidos.jsp"><i class="fa fa-user mr-1"></i>Pedidos</a>
                            <a class="dropdown-item text-light" href="../CerrarSesion"><i class="fa fa-power-off mr-1"></i>Cerrar Sesion</a>
                        </div>
                    </div>
                </c:if>

            </div>
        </nav>
    </nav>

    <section class=" pb-5 mt-4" id="admin-course">
        <div class="container">
            <div class="col-sm-offset-2 col-sm-12 offset-xl-0 col-xl-12 offset-lg-0 col-lg-12">
                <div class="card card-default">
                    <div class="card-header">
                        <h1>Editar consola: ${nombre}</h1>
                    </div>
                    <div class="card-body">
                        <form action="EditarConsola" method="GET" >
                            <div class="form-group">
                                <input type="hidden" id="id" name="id" value="${id}" />
                                <label>Nombre: </label>
                                <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Introduce nombre de la consola" value="${nombre}" required />
                            </div>

                            <div class="form-group">
                                <label>Generacion: </label>
                                <input type="number" id="generacion" class="form-control" name="generacion" min="0" value="${generacion}" required />
                            </div>
                            <div class="form-group">
                                <label>Fecha de lanzamiento: </label>
                                <input type="text" name="fechaLanzamiento" class="form-control" id="fechaLanzamiento" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" placeholder="dd/mm/yyyy" value="${fechaLanzamiento}" required /><br>

                            </div>
                            <div class="form-group">
                                <label>URL de la imagen:</label>
                                <input type="text" id="url" name="url" class="form-control" accept="image/*" value="${url}" required />
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="submit" id="actualizar" class="btn form-control" name="actualizar" value="Editar consola" />
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="reset" id="limpiar" class="btn form-control" name="limpiar" value="Limpiar" />
                                </div>
                            </div>            
                        </form>
                    </div>
                    <a href="verConsola.jsp" class="btn btn-primary">Volver</a>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer " class=" pt-2 pb-1 fixed-bottom ">
        <div class="container-fluid mt-0 ">
            <p> &copy; 2021 PlayMon.com <span class="float-right"> <a href="../juego/directorioJuegos.jsp">Directorio</a></span> <span class="float-right mr-2"><a href="../home.jsp">Inicio</a></span> </p>

        </div>
    </footer>

</body>

</html>
