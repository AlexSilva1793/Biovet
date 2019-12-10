<%-- 
    Document   : homeUsuario
    Created on : 19-nov-2019, 13:16:44
    Author     : master
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.UsuarioVO"%>
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
        <title>Home Usuario</title>

    <body>
        <h1>Bienvenido Usuario!</h1>
        <h2 ><%=nombreUsuario%> ></h2>
        <a href="actualizarUsuario.jsp">Actualizar Datos</a><br>
        <a href="registrarMascota.jsp">Registrar Mascota</a><br>
        <a href="registrarAgenda.jsp">Agendar Servicio </a><br>

        <form action="Usuario" method="post">

            <button  name="cerrarSesion" >Cerrar Sesion</button>
            <input type="hidden" name="opcion" value="6">

        </form>
    </body>
</html>
