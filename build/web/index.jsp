<%-- 
    Document   : index
    Created on : 19-nov-2019, 12:53:32
    Author     : master
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biovet</title>
    </head>
    <body>
        <a href="login.jsp">Ingresar </a><br>
        <h1>Registrar Usuario</h1>
        <form method="post" action="Usuario">

            <table border="2">

                <tr>
                    <th>
                        Cedula:<br>
                        <input type="text" name="textCedula"><br><br>
                        Nombre:<br>
                        <input type="text" name="textNombreUsuario"><br><br>
                        Apellido:<br>
                        <input type="text" name="textApellidoUsuario"><br><br>
                        Contraseña:<br>
                        <input type="password" name="pass"><br><br>
                        Correo:<br>
                        <input type="email" name="textCorreoUsuario"><br><br>
                        <select  id="tipoDocumento" name="textFkTipoDocu" required>
                            <option value="0"> Tipo de Documento </option>
                            <option value="1"> C.C</option>
                            <option value="2"> C.E</option>
                            <option value="3"> NIT</option>
                        </select>
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
