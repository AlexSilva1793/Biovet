<%-- 
    Document   : listaMascotas
    Created on : 29/02/2020, 12:58:37 PM
    Author     : master
--%>

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

            String nombreUsuario = "";//Verificar si se usa esta variable.
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
        <div>
            <h2>Buscar Mascota</h2>
            <form action="Mascota" method="POST">
                Escribe codigo de Usuario: <input type="search" name="textFkUsuario">
                <div class="form-group text-center">
                    <button class="btn btn-primary account-btn" name="opcion" value="3" type="submit">Buscar</button>
                </div>
            </form>
        </div>
        <div class="row">
            <div class="container">
                <table  class="table table-striped">
                    <thead>
                        <tr>
                            <th>Id Mascota</th>
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
    </body>
</html>
