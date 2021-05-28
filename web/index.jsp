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
    </head>
</head>
<body>
    <div>Esta es la pagina principal</div>
    <div>
        <c:if test="${usuario == null}">
            <a href="usuario/login.jsp">Iniciar Sesión</a>
            <a href="usuario/registrarse.jsp">Registrarse</a>
        </c:if>
        <c:if test="${usuario != null}">
            <p>${usuario.login}</p>
            <c:if test="${usuario.administrador}">
                <a href="administrador/administracion.jsp">Administración</a>
            </c:if>
            <a href="CerrarSesion">Cerrar Sesion</a>
        </c:if>


        <c:forEach var="jue" items="${juegoBean.juegos}">
            <div>
                <div class="card m-2" style="width: 18rem;">
                    <img class="card-img-top" src="juego/${jue.url}" alt="Imagen ${jue.nombre}  ${jue.consola.nombre}">
                    <div class="card-body">
                        <h5 class="card-title">${jue.nombre}</h5>
                        <p class="card-text">Precio: ${jue.precio} &#8364;</p>
                        <a href="#" class="btn btn-primary">Añadir</a>
                    </div>
                </div>
            </div>
        </c:forEach>


    </div>
</body>
</html>
