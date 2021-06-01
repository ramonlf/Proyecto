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
import modelo.entidades.Juego;
import modelo.entidades.JuegoJpaController;
import modelo.modelo.JuegoBean;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "CrearJuego", urlPatterns = {"/juego/CrearJuego"})
public class CrearJuego extends HttpServlet {

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

        String nombre = request.getParameter("nombre");
        String genero = request.getParameter("genero");
        String fechaLanzamiento = request.getParameter("fechaLanzamiento");
        Integer cantidad = Integer.parseInt(request.getParameter("cantidad"));
        Double precio = Double.parseDouble(request.getParameter("precio"));
        String url = request.getParameter("url");
        String consola = request.getParameter("consola");
        String descripcion = request.getParameter("descripcion");

        ConsolaJpaController auxConsola = new ConsolaJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
        List<Consola> consolas = auxConsola.findConsolaEntities();
        Consola aux = null;
        for (Consola con : consolas) {
            if (con.getNombre().equals(consola)) {
                aux = con;
            }
        }

        JuegoBean juego = new JuegoBean();

        Juego nuevo = new Juego(nombre, genero, parseFecha(fechaLanzamiento), cantidad, precio, url, aux, descripcion);

        
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
        List<Juego> juegos = jjc.findJuegoEntities();
        Juego auxJuego = null;

        for (Juego jue : juegos) {
            if (jue.getNombre().equals(nombre) && jue.getConsola().getNombre().equals(consola)) {
                auxJuego = jue;
            }
        }

        try {
            if (auxJuego == null) {
                juego.añadirJuego(nuevo);
            } else {
                error = "El juego ya existe";
            }

        } catch (Exception e) {
            error = "Error al añadir el juego";
        }
        
        if (error != null) {
            response.sendRedirect("crearJuego.jsp");
            return;
        }
        
        if (error != null) {
            request.setAttribute("nombre", nombre);
            request.setAttribute("generacion", genero);
            request.setAttribute("fechaLanzamiento", fechaLanzamiento);
            request.setAttribute("precio", precio);
            request.setAttribute("cantidad", cantidad);
            request.setAttribute("url", url);
            request.setAttribute("descripcion", descripcion);
            getServletContext().getRequestDispatcher("/juego/crearJuego.jsp").forward(request, response);
        } else {
            response.sendRedirect(response.encodeRedirectURL("../administrador/administracion.jsp"));
        }

    }

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
