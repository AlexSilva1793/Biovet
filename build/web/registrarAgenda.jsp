<%-- 
    Document   : registrarAgenda
    Created on : 19/11/2019, 11:49:56 a. m.
    Author     : PC1
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
        <link rel="stylesheet" href="css/fullcalendar.min.css">
        <link rel="stylesheet" href="css/select2.min.css">
        <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <div class="main-wrapper account-wrapper">
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
            <!--Fin Header-->
            <!--Inicio SideBar-->                                
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
            <!--Fin SideBar-->                                
            <!--Inicio Calendario-->
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-8 col-4">
                            <h4 class="page-title">Calendario de Citas</h4>
                        </div>
                        <div class="col-sm-4 col-8 text-right m-b-30">
                            <a href="#" class="btn btn-primary btn-rounded" data-toggle="modal" data-target="#add_event"><i class="fa fa-plus"></i> Add Event</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card-box mb-0">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade none-border" id="event-modal">
                                <div class="modal-dialog">
                                    <div class="modal-content modal-md">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add Event</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body"></div>
                                        <div class="modal-footer text-center">
                                            <button type="button" class="btn btn-primary submit-btn save-event">Create event</button>
                                            <button type="button" class="btn btn-danger btn-lg delete-event" data-dismiss="modal">Delete</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="add_event" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content modal-md">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Event</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label>Event Name <span class="text-danger">*</span></label>
                                    <input class="form-control" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Event Date <span class="text-danger">*</span></label>
                                    <div class="cal-icon">
                                        <input class="form-control datetimepicker" type="text">
                                    </div>
                                </div>
                                <div class="m-t-20 text-center">
                                    <button class="btn btn-primary submit-btn">Create Event</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%         if (request.getAttribute("mensajeError") != null) {        %>
        ${mensajeError}
        <%            } else { %>
        ${mensajeExito}
        <% }%>
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.slimscroll.js"></script>
        <script src="js/select2.min.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/jquery-ui.min.html"></script>
        <script src="js/fullcalendar.min.js"></script>
        <script src="js/jquery.fullcalendar.js"></script>
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/app.js"></script>   
    </body>
</html>
