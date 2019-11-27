<%-- 
    Document   : Login
    Created on : 19-nov-2019, 14:31:16
    Author     : master
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar</title>
    </head>
    <body>
       <h1>Inicio de Sesión</h1>
        <form method="post" action="Usuario">

            <table border="2">

                <tr>
                    <th>
                        Numero de Documento:<br>
                        <input type="text" name="textCedula"><br><br>
                        Contraseña:<br>
                        <input type="password" name="textContrasena"><br><br>

                    </th>

                </tr>

            </table><br>

            <button>Ingresar</button>
            <input type="hidden" name="opcion" value="5">

        </form>

        <% if (request.getAttribute("mensajeError") != null) {  %> 
        ${mensajeError}
        <% }%>
    </body>
</html>
