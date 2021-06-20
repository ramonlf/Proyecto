/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.entidades.Contiene;
import modelo.entidades.ContieneJpaController;
import modelo.entidades.Juego;
import modelo.entidades.JuegoJpaController;
import modelo.entidades.MeterCarrito;
import modelo.entidades.Pedido;
import modelo.entidades.PedidoJpaController;
import modelo.entidades.Usuario;
import modelo.entidades.UsuarioJpaController;
import modelo.modelo.UsuarioBean;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "CrearPedido", urlPatterns = {"/usuario/CrearPedido"})
public class CrearPedido extends HttpServlet {

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
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute("usuarioBean");
        UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
        Usuario aux = (Usuario) request.getSession().getAttribute("usuario");

        String error = null;

        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
        List<MeterCarrito> carrito = aux.getCarrito();
        double total = 0;
        if (carrito.size() > 0) {
            for (MeterCarrito jue : carrito) {
                total += jue.getJuego().getPrecio() * jue.getCantidad();
                Juego juego = jjc.findJuego(jue.getJuego().getId());
                juego.setCantidad(juego.getCantidad() - jue.getCantidad());
                try {
                    jjc.edit(juego);
                } catch (Exception e) {
                }
            }

            Date date = new Date();
            Pedido pedido = new Pedido(date, total, aux);
            PedidoJpaController pjc = new PedidoJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
            try {
                pjc.create(pedido);
            } catch (Exception e) {
                error = "Error al realizar el pedido";
                response.sendRedirect("../home.jsp?error=" + error);
            }

            try {
                for (MeterCarrito jue : carrito) {
                    Contiene contiene = new Contiene(pedido, jue.getJuego(), (jue.getJuego().getPrecio() * jue.getCantidad()), date, jue.getCantidad());
                    ContieneJpaController cjc = new ContieneJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
                    cjc.create(contiene);
                }
            } catch (Exception e) {
                error = "Error  al procesar el contenido del pedido";
                response.sendRedirect("../home.jsp?error=" + error);
            }
        }
        carrito.clear();
        aux.setCarrito(carrito);
        response.sendRedirect("../home.jsp");
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
