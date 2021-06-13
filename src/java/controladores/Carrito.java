/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Juego;
import modelo.entidades.JuegoJpaController;
import modelo.entidades.Usuario;
import modelo.entidades.UsuarioJpaController;
import modelo.modelo.JuegoBean;
import modelo.modelo.UsuarioBean;
import modelo.entidades.MeterCarrito;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "Carrito", urlPatterns = {"/usuario/Carrito"})
public class Carrito extends HttpServlet {

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
        double total = 0;

        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute("usuarioBean");
        UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
        Usuario aux = (Usuario) request.getSession().getAttribute("usuario");
        long id = 0;
        Juego nuevo = null;
        if (request.getParameter("verCarrito") == null) {
            id = Long.parseLong(request.getParameter("id"));

            JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
            nuevo = jjc.findJuego(id);
        }
        MeterCarrito meterCarrito = new MeterCarrito(nuevo);
        List<MeterCarrito> carrito = aux.getCarrito();

        if (request.getParameter("carrito") != null) {
            MeterCarrito repetido = null;
            for (MeterCarrito jue : carrito) {
                if (jue.getJuego().equals(nuevo)) {
                    repetido = jue;
                    jue.setCantidad(jue.getCantidad() + 1);
                }
            }
            if (repetido == null) {
                meterCarrito.setCantidad(meterCarrito.getCantidad() + 1);
                carrito.add(meterCarrito);
            }

        }

        if (request.getParameter("eliminar") != null) {
            for (int i = 0; i < carrito.size(); i++) {

                if (carrito.get(i).getJuego().equals(nuevo)) {
                    carrito.remove(i);
                    i = 0;
                }
            }
        }

        if (request.getParameter("mas") != null) {
            MeterCarrito repetido = null;
            for (MeterCarrito jue : carrito) {
                if (jue.getJuego().equals(nuevo)) {
                    jue.setCantidad(jue.getCantidad() + 1);
                }
            }
        }

        if (request.getParameter("menos") != null) {
            MeterCarrito repetido = null;
            for (MeterCarrito jue : carrito) {
                if (jue.getJuego().equals(nuevo)) {
                    if (jue.getCantidad() > 0) {
                        jue.setCantidad(jue.getCantidad() - 1);
                    }
                }
            }
            for (int i = 0; i < carrito.size(); i++) {

                if (carrito.get(i).getCantidad() < 1) {
                    carrito.remove(i);
                    i = 0;
                }

            }
        }

        if (request.getParameter("verCarrito") != null) {

        }

        aux.setCarrito(carrito);
        for (MeterCarrito jue : carrito) {
            total += jue.getJuego().getPrecio() * jue.getCantidad();
        }
        request.setAttribute("total", total);
        response.sendRedirect("carrito.jsp?total=" + total);
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
