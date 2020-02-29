<%-- 
    Document   : listaMascotas
    Created on : 29/02/2020, 12:58:37 PM
    Author     : master
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de las mascotas</title>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

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
            
            
                                
        %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/styledate.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1>Hola <%=nombreUsuario%></h1>
    </body>
</html>
