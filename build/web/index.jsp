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
                        Tipo de Documento<br><br>
                        <select  id="tipoDocumento" name="textFkTipoDocu" required>
                            <option value="1"> Cedula de Ciudadania</option>
                            <option value="2"> Cedula de Extranjeria</option>
                            <option value="3"> NIT</option>
                        </select><br><br>
                        Numero<br>
                        <input type="text" name="textCedula"><br><br>
                        Nombre:<br>
                        <input type="text" name="textNombreUsuario"><br><br>
                        Apellido:<br>
                        <input type="text" name="textApellidoUsuario"><br><br>
                        Contraseña:<br>
                        <input type="password" name="textContrasena"><br><br>
                        Confirme su Contraseña:<br>
                        <input type="password" name="textContrasena"><br><br>
                        Correo:<br>
                        <input type="email" name="textCorreoUsuario"><br><br>

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
