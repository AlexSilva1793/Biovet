<%-- 
    Document   : registrarAgenda
    Created on : 19/11/2019, 11:49:56 a. m.
    Author     : PC1
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
    <body>
        <main>


            <form class="was-validated" method="post" action="Agenda" >
                <div class="row justify-content-md-center">
                    <div class="col-8 col-sm-6">
                        <h1>Registrar Agenda Servicio</h1><br>
                    </div>
                </div>
                <div class="container">
                    <div class="row row justify-content-md-center">
                        <div class="col-6 col-sm-3">
                            <h6><label>Fecha</label></h6>
                            <input class="form-control is-invalid" type="text" name="filter-date" id="filter-date" name ="txtFechaAgenda"/>
                        </div>
                        <div class="col-6 col-sm-3">
                            <h6><label>Servicio</label></h6>
                            <input type="text" class="form-control is-invalid" id="validationTextarea" required name ="txtFkServicio">
                        </div>
                    </div>
                </div>
                <div class="w-100"></div>
                <div class="container">
                    <div class="row row justify-content-md-center">
                        <div class="col-6 col-sm-3">
                            <h6><label>Mascota</label></h6>
                            <input class="form-control is-invalid" id="validationTextarea" required name ="txtFkMascota">
                        </div>
                    </div>
                </div>
                <br>
                <div class="row justify-content-md-center">
                    <button class="btn btn-primary">Registrar</button>
                    <input type="hidden" name="opcion" value="1">
                </div>
            </form>
        </div>
    </main>
    <footer>
        <div id="search">
            <form method="post" action="?">
                <div>
                    <label for="search-from-date">Fecha Inicio</label>
                    <input type="text" name="search-from-date" id="search-from-date"/>
                </div>

                <div>
                    <label for="search-to-date">Fecha Fin</label>
                    <input type="text" name="search-to-date" id="search-to-date"/>
                </div>

                <div>
                    <input type="submit" value="Buscar"/>
                </div>
            </form>
        </div>
    </footer>
    <script src="jquery/jquery.js" type="text/javascript"></script>
    <script src="jquery/jquery.datetimepicker.full.js" type="text/javascript"></script>
    <script>
        jQuery(document).ready(function () {
            'use strict';

            jQuery('#filter-date, #search-from-date, #search-to-date').datetimepicker();
        });
    </script>
    <%         if (request.getAttribute("mensajeError") != null) {        %>
    ${mensajeError}
    <%            } else { %>
    ${mensajeExito}
    <% }%>
</body>
</html>
