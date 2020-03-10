<%-- 
    Document   : listaMascotas
    Created on : 29/02/2020, 12:58:37 PM
    Author     : master
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modeloDAO.MascotaDAO"%>
<%@page import="modeloVO.MascotaVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de las mascotas</title>
        <%
            //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            //response.setHeader("Pragma", "no-cache");
            //response.setHeader("Expires", "0");

            String nombreUsuario = "";
            ArrayList<UsuarioVO> usuarioVOSesion = (ArrayList<UsuarioVO>) session.getAttribute("usuariosArray");

            String redirectURL = "index.jsp";

            if (usuarioVOSesion != null) {
                nombreUsuario = usuarioVOSesion.get(0).getNombreUsuario();
                if (Integer.parseInt(usuarioVOSesion.get(0).getFkRol()) != 1) {
                    response.sendRedirect(redirectURL);
                }
            } else {

                response.sendRedirect(redirectURL);
            }
            MascotaVO mascotaVO = new MascotaVO();
            MascotaDAO mascotaDAO = new MascotaDAO(mascotaVO);
            ArrayList<MascotaVO> mascotasArray = mascotaDAO.consultarGeneral();

        %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/styledate.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1>Hola Administrador <%=nombreUsuario%></h1>
        <!--Inicio barra de busqueda usuario-->
        <div>
            <h2>Buscar Mascota</h2>
            <form action="Mascota" method="POST">
                Escribe codigo de Usuario: <input type="search" name="textFkUsuario">
                <div class="form-group text-center">
                    <button class="btn btn-primary account-btn" name="opcion" value="3" type="submit">Buscar</button>
                </div>
            </form>
        </div>
        <!--Fin barra de busqueda usuario-->
        <!-- Inicio Resultados de la busqueda-->
        <div class="row">
            <div class="container">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Id Mascota</th>
                            <th>Nombre</th>
                            <th>Fecha de Nacimiento</th>
                            <th>Color</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="mascota" items="${mascotas}">
                            <tr> 
                                <td><c:out value="${mascota.getIdMascota()}"/></td>
                                <td><c:out value="${mascota.getNombreMascota()}"/></td>
                                <td><c:out value="${mascota.getFechaNacimiento()}"/></td>
                                <td><c:out value="${mascota.getColorMascota()}"/></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <% if (request.getAttribute("MascotasError") != null) {  %> 
        ${MascotasError}
        <% }%>
        <!-- Fin Resultados de la busqueda-->
        <!--Inicio listado de todas las mascotas-->
        <div class="row">
            <div class="container">
                <table  class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Fecha de Nacimiento</th>
                            <th>Dueño</th>
                            <th>Raza</th>
                            <th>Genero</th>
                            <th>Color</th>
                        </tr>
                    </thead>
                    <%
                        for (int i = 0; i < mascotasArray.size(); i++) {
                            if (Integer.parseInt(mascotasArray.get(i).getEstadoMascota()) == 1) {
                                mascotaVO = mascotasArray.get(i);
                    %>
                    <tbody>
                        <tr>
                            <td><%=mascotaVO.getIdMascota()%></td>
                            <td><%=mascotaVO.getNombreMascota()%></td>
                            <td><%=mascotaVO.getFechaNacimiento()%></td>
                            <td><%=mascotaVO.getFkUsuario()%></td>
                            <td><%=mascotaVO.getFkRaza()%></td>
                            <td><%=mascotaVO.getFkGenero()%></td>
                            <td><%=mascotaVO.getColorMascota()%></td>                            
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
            </div>
        </div>
        <!--Fin listado de todas las mascotas-->
    </body>
</html>
