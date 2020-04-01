/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.AgendaDAO;
import modeloVO.AgendaVO;

/**
 *
 * @author PC1
 */
@WebServlet(name = "AgendaControlador", urlPatterns = {"/Agenda"})
public class AgendaControlador extends HttpServlet {

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

        int opcion = parseInt(request.getParameter("opcion"));
        String correoNotificacion = request.getParameter("correoNotificacion");
        String idAgenda = request.getParameter("txtIdAgenda");
        String fechaAgenda = request.getParameter("textFechaAgenda");
        String fkServicio = request.getParameter("txtFkServicio");
        String fkMascota = request.getParameter("textFkMascota");
        String fkEstadoAgenda = request.getParameter("txtFkEstadoAgenda");

        AgendaVO agendaVO = new AgendaVO(idAgenda, fechaAgenda, fkServicio, fkMascota, fkEstadoAgenda);
        AgendaDAO agendaDAO = new AgendaDAO(agendaVO);

        switch (opcion) {

            case 1: //agregar agenda
                System.out.println("fk SErvicio ---- " +fkServicio);
                System.out.println("fechaAgenda ---- " +fechaAgenda);
                System.out.println("fkMascota ---- " +fkMascota);
                System.out.println("correoNotificacion ---- " +correoNotificacion);
//                if ((agendaDAO.agregarRegistro())) {
//
//                    request.setAttribute("mensajeExito", "¡ La agenda se realizo exitosamente!");
//
//                } else {
//
//                    request.setAttribute("mensajeError", "¡ No se pudo realizar la agenda correctamente !");
//                    out.println(fechaAgenda);
//
//                }
//                request.getRequestDispatcher("registrarAgenda.jsp").forward(request, response);
                break;
            case 4: //Consulta agenda por mascota
                request.setAttribute("fkMascota", fkMascota);
                request.getRequestDispatcher("registrarAgenda.jsp").forward(request, response);
                break;

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
