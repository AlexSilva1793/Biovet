<%-- 
    Document   : actualizarUsuario
    Created on : 5/12/2019, 06:58:22 PM
    Author     : master
--%>

<%@page import="modeloDAO.GeneroDAO"%>
<%@page import="modeloVO.GeneroVO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    //response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "0");

    GeneroVO generosVO = new GeneroVO();
    GeneroDAO generosDAO = new GeneroDAO();

    ArrayList<GeneroVO> arrayGeneros = generosDAO.consultarGeneral();

    String idGeneroUsu = "";
    String generoUsu = "";

    ArrayList<UsuarioVO> usuarioVOSesion = (ArrayList<UsuarioVO>) session.getAttribute("usuariosArray");
    String redirectURL = "index.jsp";

    if (usuarioVOSesion != null) {

        for (int i = 0; i < arrayGeneros.size(); i++) {

            if (usuarioVOSesion.get(0).getFkGenero() != null) {

                if (Integer.parseInt(arrayGeneros.get(i).getIdGenero()) == Integer.parseInt(usuarioVOSesion.get(0).getFkGenero())) {
                    idGeneroUsu = arrayGeneros.get(i).getIdGenero();
                    generoUsu = arrayGeneros.get(i).getTipoSexo();

                }
            } else {
                idGeneroUsu = "1";
                generoUsu = "Selecciona tu Genero";
            }
        }

    } else {
        response.sendRedirect(redirectURL);
    }
%>
</head>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Usuario</title>
    </head>
    <body>
        <h1>Actualiza tus datos</h1><br><br><br>
        <form action="Usuario" method="get">
            <table border="1">
                <tr>
                    <th>
                        Contraseña<br>
                        <input type="text" name="textContrasena" value="<%=usuarioVOSesion.get(0).getContraseñaUsuario()%>"><br><br>
                        Direccion<br>
                        <input type="text" name="textDireccion" value="<%=usuarioVOSesion.get(0).getDireccion()%>"><br><br>
                        Celular<br>
                        <input type="text" name="textCelular" value="<%=usuarioVOSesion.get(0).getCelular()%>"><br><br>
                        Telefono Fijo<br>
                        <input type="text" name="textTelefonoFijo" value="<%=usuarioVOSesion.get(0).getTelefonoFijo()%>"><br><br>
                        Correo Electronico<br>
                        <input type="text" name="textCorreoUsuario" value="<%=usuarioVOSesion.get(0).getCorreoUsuario()%>"><br><br>
                        Genero<br>
                        <select  id="genero" name="textFkGenero" required>
                            <option value="<%=idGeneroUsu%>"> <%=generoUsu%></option>
                            <%for (int i = 0; i < arrayGeneros.size(); i++) {
                                    generosVO = arrayGeneros.get(i);%>
                            <option value="<%=generosVO.getIdGenero()%>"> <%=generosVO.getTipoSexo()%></option>

                            <%}%>        
                        </select><br><br>

                        <input type="hidden" name="textIdUsuario" value="<%=usuarioVOSesion.get(0).getIdUsuario()%>">
                    </th>
                </tr>
            </table>
            <button>
                ACTUALIZAR
            </button><br><br>

            <input type="hidden" name="opcion" value="2">
        </form>
        <% if (request.getAttribute("mensajeError") != null) {  %> 
        ${mensajeError}
        <% }%>
    </body>
</html>
