/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Juego;
import modelo.modelo.JuegoBean;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "VistaJuego", urlPatterns = {"/juego/VistaJuego"})
public class VistaJuego extends HttpServlet {

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
        long id = Long.parseLong(request.getParameter("id"));
        JuegoBean juego = (JuegoBean) request.getSession().getAttribute("juegoBean");
        Juego nuevo = juego.buscarJuego(id);

        
            request.setAttribute("id", nuevo.getId());
            request.setAttribute("nombre", nuevo.getNombre());
            request.setAttribute("fechaLanzamiento", nuevo.getFechaLanzamientoCorta());
            request.setAttribute("precio", nuevo.getPrecio());
            request.setAttribute("cantidad", nuevo.getCantidad());
            request.setAttribute("genero", nuevo.getGenero());
            request.setAttribute("url", nuevo.getUrl());
            request.setAttribute("consola", nuevo.getConsola().getNombre());
            request.setAttribute("descripcion", nuevo.getDescripcion());
            getServletContext().getRequestDispatcher("/juego/vistaJuego.jsp").forward(request, response);
        

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
