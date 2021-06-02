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
import java.util.List;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Consola;
import modelo.entidades.ConsolaJpaController;
import modelo.modelo.ConsolaBean;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "/consola/CrearConsola", urlPatterns = {"/consola/CrearConsola"})
public class CrearConsola extends HttpServlet {

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
        String error = null;
        String nombre = request.getParameter("nombre");
        int generacion = Integer.parseInt(request.getParameter("generacion"));
        String fechaLanzamiento = request.getParameter("fechaLanzamiento");
        String url = request.getParameter("url");
        

        Consola nuevo = new Consola(nombre, parseFecha(fechaLanzamiento), generacion, url);
        ConsolaBean consola = new ConsolaBean();

        ConsolaJpaController cjc = new ConsolaJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
        List<Consola> consolas = cjc.findConsolaEntities();

        Consola aux = null;
        try {
            consola.añadirConsola(nuevo);
        } catch (Exception e) {
                error = "ERROR esta consola ya existe";
        }

        if (error != null) {
            request.setAttribute("nombre", nombre);
            request.setAttribute("generacion", generacion + "");
            request.setAttribute("fechaLanzamiento", fechaLanzamiento);
            request.setAttribute("url", url);
            request.setAttribute("error", error);
            getServletContext().getRequestDispatcher("/consola/crearConsola.jsp").forward(request, response);
        } else {
            response.sendRedirect(response.encodeRedirectURL("../administrador/administracion.jsp"));
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
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaDate = null;
        try {
            fechaDate = formato.parse(fecha);
        } catch (ParseException ex) {
            System.out.println(ex);
        }
        return fechaDate;
    }
}
