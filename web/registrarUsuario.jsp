<%-- 
    Document   : registrarUsuario
    Created on : 6/03/2020, 07:11:11 PM
    Author     : Dave
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.TipoDocumentoDAO"%>
<%@page import="modeloVO.TipoDocumentoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
        <%
            TipoDocumentoVO documentoVO = new TipoDocumentoVO();
            TipoDocumentoDAO documentoDAO = new TipoDocumentoDAO();

            ArrayList<TipoDocumentoVO> arrayTipoDoc = documentoDAO.consultarGeneral();

        %>
    </head>

    <body>
        <!-- Inicio Area Cabecera -->    
        <header>
            <div class="header-area">
                <div id="sticky-header" class="main-header-area">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-3">
                                <div class="logo">
                                    <a href="index.jsp">
                                        <img src="img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-9 col-lg-9">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a  href="index.jsp">Inicio</a></li>
                                            <li><a href="index.jsp#nosotros">Nosotros</a></li>
                                            <li><a href="service.html">Servicios</a></li>
                                            <li><a href="contact.html">Contáctenos</a></li>
                                            <li><a href="login.jsp">Ingresar</a></li>
                                        </ul>
                                    </nav>
                                </div>  
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Fin Area Cabecera -->        
        <div class="main-wrapper  account-wrapper">
            <div class="account-page">
                <div class="account-center">
                    <div class="account-box">
                        <form  method="post" action="Usuario" class="form-signin">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label>Tipo de Documento</label>
                                    <select  id="tipoDocumento" name="textFkTipoDocu" class="form-control" required>
                                        <%for (int i = 0; i < arrayTipoDoc.size(); i++) {
                                                documentoVO = arrayTipoDoc.get(i);%>
                                        <option value="<%=documentoVO.getIdTipoDocu()%>"> <%=documentoVO.getTipoDocu()%></option>

                                        <%}%>        
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label>Número de Documento</label>
                                    <input type="text" name="textCedula" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    <label>Nombres Completos</label>
                                    <input type="text" name="textNombreUsuario" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    <label>Apellidos Completos</label>
                                    <input type="text" name="textApellidoUsuario" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label>Contraseña</label>
                                    <input type="password" name="textContrasena" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label>Confirme su Contraseña</label>
                                    <input type="password" name="textContrasena" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    <label>Correo</label>
                                    <input type="email" name="textCorreoUsuario" class="form-control">
                                </div>
                                <div class="form-group text-center">
                                    <button class="btn btn-primary account-btn" name="opcion" value="1" type="submit">Registrarse</button>
                                </div>
                                <div class="text-center login-link">
                                    Ya tienes una cuenta? <a href="login.jsp">Ingresar</a>
                                </div>
                            </div>
                        </form>
                        <% if (request.getAttribute(
                                    "mensajeError") != null) {  %> 
                        ${mensajeError}
                        <% } else { %>
                        ${mensajeExito}
                        <% }%>

                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/app.js"></script>
    </body>

</html>
