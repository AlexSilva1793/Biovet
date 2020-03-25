<%-- 
    Document   : homeUsuario
    Created on : 19-nov-2019, 13:16:44
    Author     : master
--%>

<%@page import="modeloDAO.EspecieDAO"%>
<%@page import="modeloVO.EspecieVO"%>
<%@page import="modeloDAO.MascotaDAO"%>
<%@page import="modeloVO.MascotaVO"%>
<%@page import="modeloDAO.RazaDAO"%>
<%@page import="modeloVO.RazaVO"%>
<%@page import="modeloDAO.GeneroDAO"%>
<%@page import="modeloVO.GeneroVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    //response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "0");

    String nombreUsuario = "";
    String fkUsuario = "";
    ArrayList<UsuarioVO> usuarioVOSesion = (ArrayList<UsuarioVO>) session.getAttribute("usuariosArray");
    String redirectURL = "index.jsp";

    if (usuarioVOSesion != null) {
        nombreUsuario = usuarioVOSesion.get(0).getNombreUsuario();
        fkUsuario = usuarioVOSesion.get(0).getIdUsuario();
        if (Integer.parseInt(usuarioVOSesion.get(0).getFkRol()) != 2) {

            response.sendRedirect(redirectURL);
        }
    } else {
        response.sendRedirect(redirectURL);
    }
    GeneroVO generosVO = new GeneroVO();
    GeneroDAO generosDAO = new GeneroDAO();
    RazaVO razaVO = new RazaVO();
    RazaDAO razaDAO = new RazaDAO();
    EspecieVO especieVO = new EspecieVO();
    EspecieDAO especieDAO = new EspecieDAO();

    MascotaVO mascotaVO = new MascotaVO();
    mascotaVO.setFkUsuario(fkUsuario);
    MascotaDAO mascotaDAO = new MascotaDAO(mascotaVO);

    ArrayList<GeneroVO> arrayGeneros = generosDAO.consultarGeneral();
    ArrayList<EspecieVO> arrayEspecie = especieDAO.consultarGeneral();
    ArrayList<RazaVO> arrayRazas = razaDAO.consultarGeneral();
    ArrayList<MascotaVO> arrayMascotas = mascotaDAO.consultarRegistro();
    
%>
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
    </head>
    <body>
        <h1>Bienvenido Usuario!</h1>
        <h2 ><%=nombreUsuario%> ></h2>
        <h2>Tu codigo es : <%=fkUsuario%></h2>
        <a href="actualizarUsuario.jsp">Actualizar Datos</a><br>
        <!-- El formulario para agregar mascota y las mascotas se van a mostrar aca en el home del usuario-->
        <a href="registrarAgenda.jsp">Agendar Servicio </a><br>

        <form action="Mascota" method="POST" class="form-signin"> 

            <div>
                <label>Nombre Mascota</label>
                <input type="text" name="textNombreMascota" class="form-control">
            </div>

            <div>
                <label>Fecha de Nacimiento</label>
                <input type="date" name="textFechaNacimiento" class="form-control">
            </div>

            <div>
                <label>Color Mascota</label>
                <input type="text" name="textcolorMascota" class="form-control">
            </div>
            <div>
                <label>Especie</label>
                <select  id="especie" name="textFkRaza">

                    <%for (int i = 0; i <= arrayEspecie.size() - 1; i++) {
                            especieVO = arrayEspecie.get(i);%>
                    <option value="<%=especieVO.getIdEspecie()%>"> <%=especieVO.getTipoEspecie()%></option>

                    <%}%>        
                </select>
            </div>
            <div>
                <label>Raza</label>
                <select  id="raza" name="textFkRaza">

                    <%for (int i = 0; i <= arrayRazas.size() - 1; i++) {
                            razaVO = arrayRazas.get(i);%>
                    <option value="<%=razaVO.getIdRaza()%>"> <%=razaVO.getTipoRaza()%></option>

                    <%}%>        
                </select>
            </div>
            <div>
                <label>Genero</label>
                <select  id="genero" name="textFkGenero">

                    <%for (int i = 0; i < arrayGeneros.size() - 1; i++) {
                            generosVO = arrayGeneros.get(i);%>
                    <option value="<%=generosVO.getIdGenero()%>"> <%=generosVO.getTipoSexo()%></option>

                    <%}%>        
                </select>
            </div>

            <input type="hidden" name="textFkUsuario" value="<%=fkUsuario%>">

            <button name="opcion" value="1" type="submit">Registrar Mascota</button>

        </form>
        <% if (request.getAttribute("mensajeError") != null) {  %> 
        ${mensajeError}
        <% } else { %>
        ${mensajeExito}
        <% }%>

        <!--Listado Mascotas Usuario-->
        <div class="row">
            <div class="container">
                <table  class="table table-striped">
                    <thead>
                        <tr>
                            <th>Mascota</th>
                            <th>Nombre</th>
                            <th>Fecha de Nacimiento</th>
                            
                            <th>Raza</th>
                            <th>Genero</th>
                            <th>Color</th>
                        </tr>
                    </thead>
                    <%
                        for (int i = 0; i < arrayMascotas.size(); i++) {
                            if (Integer.parseInt(arrayMascotas.get(i).getEstadoMascota()) == 1) {
                                mascotaVO = arrayMascotas.get(i);
                    %>
                    <tbody>
                        <tr>
                            <td><%=i+1%></td>
                            <td><%=mascotaVO.getNombreMascota()%></td>
                            <td><%=mascotaVO.getFechaNacimiento()%></td>
                            
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
        <!--Fin listado Mascotas Usuario-->

        <form action="Usuario" method="post">

            <button  name="cerrarSesion" >Cerrar Sesion</button>
            <input type="hidden" name="opcion" value="6">

        </form>
    </body>
</html>
