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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios de Biovet</title>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

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
            UsuarioVO usuarioVO = new UsuarioVO();
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            ArrayList<UsuarioVO> usuariosArray = usuarioDAO.consultarGeneral();
            usuarioVO.getNombreUsuario();
                                
        %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/styledate.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1>Lista Usuarios Biovet</h1>
        <div class="row">
            <div class="container p-4">

            </div>
            <div class="container p-8">
                <table  class="table table-striped">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Direccion</th>
                            <th>Celular</th>
                            <th>Telefono Fijo</th>
                            <th>Correo</th>
                        </tr>
                    </thead>
                    <%
                        for (int i = 0; i < usuariosArray.size(); i++) {
                            usuarioVO = usuariosArray.get(i);
                    %>
                    <tbody>
                        <tr>
                            <td><%=usuarioVO.getNombreUsuario()%></td>
                            <td><%=usuarioVO.getApellidoUsuario()%></td>
                            <td><%=usuarioVO.getDireccion()%></td>
                            <td><%=usuarioVO.getCelular()%></td>
                            <td><%=usuarioVO.getTelefonoFijo()%></td>
                            <td><%=usuarioVO.getCorreoUsuario()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</html>
