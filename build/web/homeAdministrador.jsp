<%-- 
    Document   : homeAdministrador
    Created on : 26-nov-2019, 19:08:56
    Author     : master
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
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
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="shortcut icon" type="image/x-icon" href="img/icono.png">
        <title>Biovet</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/select2.min.css">
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
    </head>
    <body>
        <div class="main-wrapper account-wrapper">
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
                                        <img class="rounded-circle" src="assets/img/user.jpg" width="24" alt="<%=nombreUsuario%>">
                                    </span>
                                    <span><%=nombreUsuario%></span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="actualizarUsuario.jsp">Actualizar Datos</a>
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
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">Menú</li>
                            <li>
                                <a href="listaUsuarios.jsp"><i class="fa fa-user-md"></i> <span>Usuarios</span></a>
                            </li>
                            <li>
                                <a href="listaMascotas.jsp"><i class="fa fa-wheelchair"></i> <span>Mascotas</span></a>
                            </li>
                            <li>
                                <a href="registrarAgenda.jsp"><i class="fa fa-calendar"></i> <span>Calendario</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fa fa-flag-o"></i> <span> Reportes </span> <span class="menu-arrow"></span></a>
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
        </div>
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.slimscroll.js"></script>
        <script src="js/Chart.bundle.js"></script>
        <script src="js/chart.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>
