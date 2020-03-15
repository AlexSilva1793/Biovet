<%-- 
    Document   : registrarMascota
    Created on : 19-nov-2019, 18:18:20
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
    <body>
        <h1>Registrar Mascota</h1>
        <form method="post" action="Mascota">

            <table border="2">

                <tr>
                    <th>
                        
                        Nombre:<br>
                        <input type="text" name="textNombreMascota"><br><br>
                        Fecha Nacimiento:<br>
                        <input type="text" name="textFechaNacimiento"><br><br>
                        Usuario:<br>
                        <input type="text" name="textFkUsuario"><br><br>
                        Raza:<br>
                        <input type="text" name="textFkRaza"><br><br>
                        Genero:<br>
                        <input type="text" name="textFkGenero"><br><br>
                        Color: <br>
                        <input type="text" name="textcolorMascota"><br><br>
                        
                        
                        <br><br>

                    </th>

                </tr>

            </table><br>

            <button>Registrarse</button>
            <input type="hidden" name="opcion" value="1">

        </form>

        <% if (request.getAttribute("mensajeError") != null) {  %> 
        ${mensajeError}
        <% } else { %>
        ${mensajeExito}
        <% }%>
        <br><br>
    </body>
</html>
