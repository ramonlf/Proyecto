/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Consola;
import modelo.modelo.ConsolaBean;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "EditarConsola", urlPatterns = {"/consola/EditarConsola"})
public class EditarConsola extends HttpServlet {

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
        String error = null;
        String idNombre = request.getParameter("nombre");
        ConsolaBean consola = (ConsolaBean) request.getSession().getAttribute("consolaBean");
        Consola nuevo = consola.buscarConsola(idNombre);

        if (request.getParameter("actualizar") != null) {
            nuevo.setNombre(nuevo.getNombre());
            nuevo.setFechaLanzamiento(parseFecha(request.getParameter("fechaLanzamiento")));
            nuevo.setGeneracion(Integer.parseInt(request.getParameter("generacion")));
            nuevo.setUrl(request.getParameter("url"));
            try {
                consola.actualizarConsola(nuevo);
            } catch (Exception e) {
                error = "Error al actualizar el usuario";
            }            
            response.sendRedirect("verConsola.jsp");           
        }else{
                request.setAttribute("nombre", nuevo.getNombre());
                request.setAttribute("fechaLanzamiento", nuevo.getFechaLanzamiento());
                request.setAttribute("generacion", nuevo.getGeneracion());
                request.setAttribute("url", nuevo.getUrl());
                getServletContext().getRequestDispatcher("/consola/editarConsola.jsp").forward(request, response);
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

    public static Date parseFecha(String fecha) {
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaDate = null;
        try {
            fechaDate = formato.parse(fecha);
        } catch (ParseException ex) {
            System.out.println(ex);
        }
        return fechaDate;
    }
}
