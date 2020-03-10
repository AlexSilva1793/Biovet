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
import modeloDAO.HistoriaClinicaDAO;
import modeloVO.HistoriaClinicaVO;

/**
 *
 * @author master
 */
@WebServlet(name = "historiaClinicaControlador", urlPatterns = {"/historiaClinica"})
public class historiaClinicaControlador extends HttpServlet {

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

        //Historia Clinica
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String idHistoriaClinica = request.getParameter("txtIdHistoriaClinica");
        String fechaApertura = request.getParameter("textFechaApertura");
        String fkMascota = request.getParameter("textFkMascota");

        HistoriaClinicaVO historiaClinicaVO = new HistoriaClinicaVO(idHistoriaClinica, fechaApertura, fkMascota);
        HistoriaClinicaDAO historiaClinicaDAO = new HistoriaClinicaDAO(historiaClinicaVO);
        ArrayList<HistoriaClinicaVO> arrayHistorias;
        //
        switch (opcion) {
            case 1://Validar si la historia clinica existe si no crearla
                //System.out.println("Entro Case 1 " + "Fk mascota es: " + fkMascota);
                arrayHistorias = historiaClinicaDAO.consultarRegistro();
                if (!arrayHistorias.isEmpty()) {
                    System.out.println("Si hay historial medico");
                } else {
                    System.out.println("No hay historial medico");
                }
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
