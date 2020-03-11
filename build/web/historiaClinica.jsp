<%-- 
    Document   : historiaClinica
    Created on : 9/03/2020, 08:56:35 PM
    Author     : master
--%>

<%@page import="modeloVO.HistoriaClinicaVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historia Clinica</title>
        <%
            //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            //response.setHeader("Pragma", "no-cache");
            //response.setHeader("Expires", "0");

            String nombreUsuario = "";
            ArrayList<UsuarioVO> usuarioVOSesion = (ArrayList<UsuarioVO>) session.getAttribute("usuariosArray");
            ArrayList<HistoriaClinicaVO> arrayHistoriaClinica = (ArrayList<HistoriaClinicaVO>) request.getAttribute("historialMedico");

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
        <h1>Hello World!</h1>
        <% if (arrayHistoriaClinica.isEmpty()) {  %> 
        <h2>Esta mascota no tiene apertura del historial medico.</h2>
        <a href="historiaClinica?opcion=2&textFkMascota=<%=request.getAttribute("fkMascota")%>">Abrir historial Medico</a>
        <% } else {%><!--TODO CODIGO PARA REGISTRAR CONSULTAS DEBE IR DENTRO DE ESTE ELSE-->
        <h2>Fecha y hora de apertura <%=arrayHistoriaClinica.get(0).getFechaApertura()%></h2>
        <a href="historiaClinica?opcion=3&textFkMascota=<%=request.getAttribute("fkMascota")%>">Agregar Consulta Medica</a>
        <%}%><!--FIN DEL ELSE-->
    </body>
</html>
