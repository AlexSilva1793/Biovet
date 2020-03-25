<%-- 
    Document   : listaUsuarios
    Created on : 22/12/2019, 04:27:41 PM
    Author     : Admin
--%>

<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    //response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "0");

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
    UsuarioVO usuarioVO = new UsuarioVO();
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    ArrayList<UsuarioVO> usuariosArray = usuarioDAO.consultarGeneral();


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
                    <div class="col-sm-4 col-3">
                        <h4 class="page-title">Clientes Registrados</h4>
                    </div>
                </div>
                <!-- Inicio Tabla -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-border table-striped custom-table datatable mb-0">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Dirección</th>
                                        <th>Celular</th>
                                        <th>Telefono Fijo</th>
                                        <th>Correo</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <%                        for (int i = 0; i < usuariosArray.size(); i++) {
                                        if (Integer.parseInt(usuariosArray.get(i).getEstadoUsuario()) == 1) {
                                            usuarioVO = usuariosArray.get(i);
                                %>
                                <tbody>
                                    <tr>
                                        <td><%=usuarioVO.getNombreUsuario()%></td>
                                        <td><%=usuarioVO.getApellidoUsuario()%></td>
                                        <td><%=usuarioVO.getDireccion()%></td>
                                        <td><%=usuarioVO.getCelular()%></td>
                                        <td><%=usuarioVO.getTelefonoFijo()%></td>
                                        <td><%=usuarioVO.getCorreoUsuario()%></td>
                                        <td><a href="Usuario?opcion=7&textIdUsuario=<%=usuarioVO.getIdUsuario()%>" class="btn btn-danger">Borrar</a></td>
                                        <!--                                    <td class="text-right">
                                                                                <div class="dropdown dropdown-action">
                                                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i class="fa fa-trash-o m-r-5"></i>Borrar</a>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                    <div id="delete_patient" class="modal fade delete-modal" role="dialog">
                                                                        <div class="modal-dialog modal-dialog-centered">
                                                                            <div class="modal-content">
                                                                                <div class="modal-body text-center">
                                                                                    <img src="img/sent.png" alt="" width="30" height="26">
                                                                                    <h3>Esta seguro que desea eliminar este cliente?</h3>
                                                                                    <div class="m-t-20"> <a href="Usuario?opcion=7&textIdUsuario=<--%=usuarioVO.getIdUsuario()%>" class="btn btn-danger">Borrar</a>
                                                                                        <a href="#" class="btn btn-white" data-dismiss="modal">Cerrar</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>-->
                                    </tr>
                                    <%}
                                        }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Fin Tabla -->
            </div>
        </div>

    </div>
</div>
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
