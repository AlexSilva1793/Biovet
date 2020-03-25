<%-- 
    Document   : Login
    Created on : 19-nov-2019, 14:31:16
    Author     : master
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</head>
<body>
    <!-- Inicio Area Formulario-->
    <div class="main-wrapper account-wrapper">
        <div class="account-page">
            <div class="account-center">
                <div class="account-box">
                    <form action="Usuario" method="post" class="form-signin">
                        <div class="account-logo">
                            <a href="index.jsp"><img src="img/logo.png" alt=""></a>
                        </div>                        
                        <div class="form-group">
                            <label>Número de Documento</label>
                            <input type="text" name="textCedula" autofocus="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" name="textContrasena" class="form-control">
                        </div>
                        <div class="form-group text-right">
                            <a href="forgot-password.html">Olvido su contraseña?</a>
                        </div>
                        <div class="form-group text-center">
                            <button name="opcion" type="hidden" value="5" class="btn btn-primary account-btn">Ingresar</button>
                        </div>
                        <div class="text-center register-link">
                            No tienes una cuenta? <a href="registrarUsuario.jsp">Registrate ahora</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Fin Area Formulario-->
    <!-- Inicio Area Footer  -->
        <footer class="footer">
            <div class="footer_top">
                <div class="container">
                    <div class="bordered_1px"></div>
                    <div class="row">
                        <div class="col-md-3 col-lg-9">
                            <p class="copy_right text-center">
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            </p>
                        </div>
                        <div class="col-md-9 col-lg-3">
                            <div class="footer_logo">
                                <a href="index.jsp">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Fin Area Footer  -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/app.js"></script>

    <% if (request.getAttribute("mensajeError") != null) {  %> 
    ${mensajeError}
    <% }%>
</body>
</html>
