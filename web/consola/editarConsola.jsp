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
    </head>
    <body>
        <h1>Editar ${nombre}</h1>
        <section class=" pb-5 mt-4" id="admin-course">
            <div class="container">
                <div class="col-sm-offset-2 col-sm-12 offset-xl-0 col-xl-12 offset-lg-0 col-lg-12">
                    <form action="EditarConsola" method="POST">
                        <label>Nombre:</label>
                        <input type="hidden" id="id" name="id" value="${id}" />
                        <input type="text" id="nombre" name="nombre" value="${nombre}" />
                        <label>Generacion:</label>
                        <input type="number" id="generacion" name="generacion" value="${generacion}" required />
                        <label>Fecha Lanzamiento:</label>
                        <input type="text" name="fechaLanzamiento" id="fechaLanzamiento" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" placeholder="dd/mm/yyyy" value="${fechaLanzamiento}" required /><br>
                        <label>Nombre:</label>
                        <input type="text" id="url" name="url" value="${url}" required />
                        <input type="submit" name="actualizar" id="actualizar" value="Actualizar" />
                        <input type="submit" name="eliminar" id="eliminar" value="Eliminar" />
                    </form>
                    <a href="verConsola.jsp">Volver</a>
                </div>
            </div>
        </section>
    </body>

</html>
