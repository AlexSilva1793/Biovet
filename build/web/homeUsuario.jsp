<%-- 
    Document   : homeUsuario
    Created on : 19-nov-2019, 13:16:44
    Author     : master
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Usuario</title>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            ArrayList<UsuarioVO> usuarioVOSesion = (ArrayList<UsuarioVO>) session.getAttribute("usuariosArray");
            String redirectURL = "index.jsp";
            String nombre = usuarioVOSesion.get(0).getNombreUsuario();
            if (usuarioVOSesion != null) {
                if (usuarioVOSesion.get(0).getFkRol() != "2") {
                    response.sendRedirect(redirectURL);
                }
            } else {
                response.sendRedirect(redirectURL);
            }
        %>
    </head>
    <body>
        <h1>Bienvenido Usuario!</h1>
        <h2 ><%=nombre%> ></h2>
        <a href="registrarMascota.jsp">Registrar Mascota</a><br>
        <a href="registrarAgenda.jsp">Agendar Servicio </a><br>
    </body>
</html>
