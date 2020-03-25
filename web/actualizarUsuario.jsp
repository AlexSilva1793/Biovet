<%-- 
    Document   : actualizarUsuario
    Created on : 5/12/2019, 06:58:22 PM
    Author     : master
--%>

<%@page import="modeloDAO.GeneroDAO"%>
<%@page import="modeloVO.GeneroVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    GeneroVO generosVO = new GeneroVO();
    GeneroDAO generosDAO = new GeneroDAO();

    ArrayList<GeneroVO> arrayGeneros = generosDAO.consultarGeneral();

    String idGeneroUsu = "";
    String generoUsu = "";
    String nombreUsuario = "";

    ArrayList<UsuarioVO> usuarioVOSesion = (ArrayList<UsuarioVO>) session.getAttribute("usuariosArray");
    String redirectURL = "index.jsp";

    if (usuarioVOSesion != null) {
        nombreUsuario = usuarioVOSesion.get(0).getNombreUsuario();
        for (int i = 0; i < arrayGeneros.size(); i++) {

            if (usuarioVOSesion.get(0).getFkGenero() != null) {

                if (Integer.parseInt(arrayGeneros.get(i).getIdGenero()) == Integer.parseInt(usuarioVOSesion.get(0).getFkGenero())) {
                    idGeneroUsu = arrayGeneros.get(i).getIdGenero();
                    generoUsu = arrayGeneros.get(i).getTipoSexo();

                }
            } else {
                idGeneroUsu = "1";
                generoUsu = "Selecciona tu Genero";
            }
        }

    } else {
        response.sendRedirect(redirectURL);
    }
%>  

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <link rel="shortcut icon" type="image/x-icon" href="img/icono.png">
        <title>Biovet</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">   
    </head>
    <body>
        <!-- Inicio de Header -->            
        <div class="header">
            <div class="row">
                <div class="col-md-2">
                    <div class="header-left">
                        <a  href="index.jsp" class="logo">
                            <img src="img/logo.png">
                        </a>
                    </div>
                </div>
                <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
                <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
                <div class ="col-md-8 col-xl-9">
                    <ul class="nav user-menu float-right">
                        <li class="nav-item dropdown has-arrow">
                            <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                                <span class="user-img">
                                    <i class="fa fa-user-circle-o"></i>
                                </span>
                                <span><%=nombreUsuario%></span>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="Usuario?opcion=6">Cerrar Sesión</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="dropdown mobile-user-menu float-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="actualizarUsuario.jsp">Actualizar Datos</a>
                        <a class="dropdown-item" href="listaMascotas.jsp">Listado de Mascotas</a>               
                    </div>
                </div>
            </div>                        
        </div>
        <!--Fin Header-->
        <!--Inicio SideBar-->                                
        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title">Menú</li>
                        <li>
                            <a href="listaUsuarios.jsp"><i class="fa fa-user"></i> <span>Usuarios</span></a>
                        </li>
                        <li>
                            <a href="listaMascotas.jsp"><i class="fa fa-paw"></i> <span>Mascotas</span></a>
                        </li>
                        <li>
                            <a href="registrarAgenda.jsp"><i class="fa fa-calendar"></i> <span>Calendario</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fa fa-folder-open-o"></i> <span> Reportes </span> <span class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <a class="dropdown-item" href="Reportes?opcion=1">Reporte Cx</a><br>
                                <a class="dropdown-item" href="Reportes?opcion=2">Reporte Examenes</a><br>
                                <a class="dropdown-item" href="Reportes?opcion=3">Reporte Vacunas</a><br>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <!--Fin SideBar-->
        <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">Actualiza tus datos</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                            <form action="Usuario" method="get">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Contraseña</label>
                                            <input type="password" name="textContrasena" value="<%=usuarioVOSesion.get(0).getContraseñaUsuario()%>" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Dirección</label>
                                            <input type="text" name="textContrasena" value="<%=usuarioVOSesion.get(0).getDireccion()%>" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Celular</label>
                                            <input type="text" name="textContrasena" value="<%=usuarioVOSesion.get(0).getCelular()%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Telefono Fijo</label>
                                            <input type="text" name="textContrasena" value="<%=usuarioVOSesion.get(0).getTelefonoFijo()%>" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Correo Electrónico</label>
                                            <input type="text" name="textContrasena" value="<%=usuarioVOSesion.get(0).getCorreoUsuario()%>" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Genero</label>
                                            <select  class="form-control" id="genero" name="textFkGenero" required>
                                                <option value="<%=idGeneroUsu%>"> <%=generoUsu%></option>
                                                <%for (int i = 0; i < arrayGeneros.size(); i++) {
                                                        generosVO = arrayGeneros.get(i);%>
                                                <option value="<%=generosVO.getIdGenero()%>"> <%=generosVO.getTipoSexo()%></option>

                                                <%}%>        
                                            </select>
                                            <input type="hidden" name="textIdUsuario" value="<%=usuarioVOSesion.get(0).getIdUsuario()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <button type="submit" name="opcion" value="2" class="btn btn-primary">Enviar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>               
            </div>
        </div>
        <% if (request.getAttribute("mensajeError") != null) {  %> 
        ${mensajeError}
        <% }%>
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.slimscroll.js"></script>
        <script src="js/select2.min.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.bootstrap4.min.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>
