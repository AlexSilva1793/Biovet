<%-- 
    Document   : historiaClinica
    Created on : 9/03/2020, 08:56:35 PM
    Author     : master
--%>

<%@page import="modeloVO.MascotaVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            String nombreMascota = "";
            String fechaNacimiento = "";
            String colorMascota = "";
            String razaMascota = "";
            ArrayList<UsuarioVO> usuarioVOSesion = (ArrayList<UsuarioVO>) session.getAttribute("usuariosArray");
            ArrayList<HistoriaClinicaVO> arrayHistoriaClinica = (ArrayList<HistoriaClinicaVO>) request.getAttribute("historialMedico");
            ArrayList<MascotaVO> arrayMascota = (ArrayList<MascotaVO>) request.getAttribute("mascota");

            String redirectURL = "index.jsp";

            if (usuarioVOSesion != null) {
                nombreUsuario = usuarioVOSesion.get(0).getNombreUsuario();
                if (Integer.parseInt(usuarioVOSesion.get(0).getFkRol()) != 1) {
                    response.sendRedirect(redirectURL);
                }
            } else {

                response.sendRedirect(redirectURL);
            }
            if (!arrayMascota.isEmpty()) {
                nombreMascota = arrayMascota.get(0).getNombreMascota();
                fechaNacimiento = arrayMascota.get(0).getFechaNacimiento();
                colorMascota = arrayMascota.get(0).getColorMascota();
                razaMascota = arrayMascota.get(0).getFkRaza();
            }
        %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/styledate.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <% if (arrayHistoriaClinica.isEmpty()) {%> 
        <h2>Esta mascota no tiene apertura del historial medico.</h2>
        <a href="historiaClinica?opcion=2&textFkMascota=<%=request.getAttribute("fkMascota")%>">Abrir historial Medico</a>
        <% } else {%><!--TODO CODIGO PARA REGISTRAR CONSULTAS DEBE IR DENTRO DE ESTE ELSE-->
        <h2>Fecha y hora de apertura <%=arrayHistoriaClinica.get(0).getFechaApertura()%></h2>

        <h3><%=nombreMascota%></h3>
        <h3><%=fechaNacimiento%></h3>
        <h3><%=colorMascota%></h3>
        <h3><%=razaMascota%></h3>


        <div class="container">
            <form action="historiaClinica" method="POST" class="form-signin">
                <div>
                    <label>Motivo Consulta</label>
                    <input type="text" name="txtMotivoConsulta" class="form-control">
                </div>

                <div>
                    <label>Peso</label>
                    <input type="text" name="txtPeso" class="form-control">
                </div>

                <div>
                    <label>Descripcion consulta</label>
                    <input type="textarea" name="txtDescripcionConsulta" class="form-control">
                </div>
                <!--ACA VA EL INPUT PARA SUBIR LOS ARCHIVOS-->
                <input type="hidden" name="txtFkHistoriaClinica" value="<%=arrayHistoriaClinica.get(0).getIdHistoriaClinica()%>">
                <input type="hidden" name="textFkMascota" value="<%=request.getAttribute("fkMascota")%>">
                <button name="opcion" value="3" type="submit">Nueva Consulta Medica</button>
            </form>
        </div>
        <div class="row">
            <div class="container">
                <table>
                    <thead>
                        <tr>
                            <th>Motivo Consulta</th>
                            <th>Fecha Consulta</th>
                            <th>Peso</th>
                            <th>Descripcion de la Consulta</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="consultaMedica" items="${arrayConsultasMedicas}" >
                            <tr>
                                <td><c:out value="${consultaMedica.getMotivoConsulta()}"/></td>
                                <td><c:out value="${consultaMedica.getFechaConsulta()}"/></td>
                                <td><c:out value="${consultaMedica.getPeso()}"/></td>
                                <td><c:out value="${consultaMedica.getDescripcionConsulta()}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
        <%}%><!--FIN DEL ELSE-->
    </body>
</html>
