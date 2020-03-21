<%-- 
    Document   : listaUsuarios
    Created on : 22/12/2019, 04:27:41 PM
    Author     : Admin
--%>

<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="shortcut icon" type="image/x-icon" href="img/icono.png">
        <title>Biovet</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/gijgo.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            UsuarioVO usuarioVO = new UsuarioVO();
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            ArrayList<UsuarioVO> usuariosArray = usuarioDAO.consultarGeneral();


        %>
    </head>
    <body>
        <h1>Lista Usuarios Biovet</h1>
        <div class="row">
            <div class="container p-4">
                <!--Busqueda de usuarios por cedula-->
            </div>
            <div class="container p-8">
                <table  class="table table-striped">
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Direccion</th>
                            <th>Celular</th>
                            <th>Telefono Fijo</th>
                            <th>Correo</th>
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <%                        for (int i = 0; i < usuariosArray.size(); i++) {
                            if (Integer.parseInt(usuariosArray.get(i).getEstadoUsuario()) == 1) {
                                usuarioVO = usuariosArray.get(i);
                    %>
                    <tbody>
                        <tr>
                            <td><%=usuarioVO.getIdUsuario()%></td>
                            <td><%=usuarioVO.getNombreUsuario()%></td>
                            <td><%=usuarioVO.getApellidoUsuario()%></td>
                            <td><%=usuarioVO.getDireccion()%></td>
                            <td><%=usuarioVO.getCelular()%></td>
                            <td><%=usuarioVO.getTelefonoFijo()%></td>
                            <td><%=usuarioVO.getCorreoUsuario()%></td>
                            <td><a href="Usuario?opcion=7&textIdUsuario=<%=usuarioVO.getIdUsuario()%>" class="btn btn-danger">Borrar</a></td>
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</html>
