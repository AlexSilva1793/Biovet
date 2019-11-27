/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.UsuarioDAO;
import modeloVO.UsuarioVO;

/**
 *
 * @author master
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String idUsuario = request.getParameter("textIdUsuario");
        String cedula = request.getParameter("textCedula");
        String nombreUsuario = request.getParameter("textNombreUsuario");
        String apellidoUsuario = request.getParameter("textApellidoUsuario");
        String contraseñaUsuario = request.getParameter("textContrasena");
        String direccion = request.getParameter("textDireccion");
        String celular = request.getParameter("textCelular");
        String telefonoFijo = request.getParameter("textTelefonoFijo");
        String correoUsuario = request.getParameter("textCorreoUsuario");
        String estadoUsuario = request.getParameter("textEstadoUsuario");
        String fkTipoDocu = request.getParameter("textFkTipoDocu");
        String fkRol = request.getParameter("textFkRol");
        String fkGenero = request.getParameter("textFkGenero");

        ArrayList<UsuarioVO> usuariosArray = new ArrayList<>();

        UsuarioVO usuarioVO = new UsuarioVO(idUsuario, cedula, nombreUsuario, apellidoUsuario, contraseñaUsuario, direccion, celular, telefonoFijo, correoUsuario, estadoUsuario, fkTipoDocu, fkRol, fkGenero);
        UsuarioDAO usuarioDAO = new UsuarioDAO(usuarioVO);

        switch (opcion) {
            case 1: //Registrar Usuario
                if (usuarioDAO.agregarRegistro()) {

                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El usuario no pudo ser registrado");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case 3://Iniciar sesión
                HttpSession session = request.getSession();
                if (usuarioDAO.iniciarSesion()) {
                    usuariosArray = usuarioDAO.consultarRegistro();

                    if (Integer.parseInt(usuariosArray.get(0).getFkRol()) == 1) {
                        session.setAttribute("usuariosArray", usuariosArray);
                        request.getRequestDispatcher("homeAdministrador.jsp").forward(request, response);
                    } else if (Integer.parseInt(usuariosArray.get(0).getFkRol()) == 2) {
                        session.setAttribute("usuariosArray", usuariosArray);
                        request.getRequestDispatcher("homeUsuario.jsp").forward(request, response);
                    }

                } else {
                    request.setAttribute("mensajeError", "¡El usuario y/o la contraseña son incorrectos!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
