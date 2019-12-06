<%-- 
    Document   : actualizarUsuario
    Created on : 5/12/2019, 06:58:22 PM
    Author     : master
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    String nombreUsuario = "";
    ArrayList<UsuarioVO> usuarioVOSesion = (ArrayList<UsuarioVO>) session.getAttribute("usuariosArray");
    String redirectURL = "index.jsp";

    if (usuarioVOSesion != null) {
        nombreUsuario = usuarioVOSesion.get(0).getNombreUsuario();
        if (Integer.parseInt(usuarioVOSesion.get(0).getFkRol()) != 2) {
            response.sendRedirect(redirectURL);
        }
    } else {
        response.sendRedirect(redirectURL);
    }
%>
</head>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Usuario</title>
    </head>
    <body>
        <h1>Actualiza tus datos</h1><br><br><br>
        <form action="Usuario" method="post">
            <table border="1">
                <tr>
                    <th>
                        Contraseña<br>
                        <input type="text" name="textContrasena" value="<%=usuarioVOSesion.get(0).getContraseñaUsuario()%>"><br><br>
                        Direccion<br>
                        <input type="text" name="textDireccion" value="<%=usuarioVOSesion.get(0).getDireccion()%>"><br><br>
                        Celular<br>
                        <input type="text" name="textCelular" value="<%=usuarioVOSesion.get(0).getCelular()%>"><br><br>
                        Telefono Fijo<br>
                        <input type="text" name="textCorreoUsuario" value="<%=usuarioVOSesion.get(0).getTelefonoFijo()%>"><br><br>
                        Correo Electronico<br>
                        <input type="text" name="textContrasena" value="<%=usuarioVOSesion.get(0).getCorreoUsuario()%>"><br><br>

                    </th>
                </tr>
            </table>

        </form>
    </body>
</html>
