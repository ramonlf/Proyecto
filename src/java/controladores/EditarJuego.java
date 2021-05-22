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
import modelo.modelo.JuegoBean;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "EditarJuego", urlPatterns = {"/juego/EditarJuego"})
public class EditarJuego extends HttpServlet {

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
        long id = Long.parseLong(request.getParameter("id"));
        JuegoBean juego = (JuegoBean) request.getSession().getAttribute("juegoBean");
        Juego nuevo = juego.buscarJuego(id);

        if (request.getParameter("actualizar") != null) {
            ConsolaJpaController auxConsola = new ConsolaJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
            List<Consola> consolas = auxConsola.findConsolaEntities();
            String consola = request.getParameter("consola");
            Consola aux = null;
            for (Consola con : consolas) {
                if (con.getNombre().equals(consola)) {
                    aux = con;
                }
            }
            nuevo.setNombre(request.getParameter("nombre"));
            nuevo.setConsola(aux);
            nuevo.setPrecio(Double.parseDouble(request.getParameter("precio")));
            nuevo.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
            nuevo.setGenero(toUpperCaseFirst(request.getParameter("genero")));
            nuevo.setUrl(request.getParameter("url"));
            nuevo.setFechaLanzamiento(parseFecha(request.getParameter("fechaLanzamiento")));
            try{
                juego.actualizarJuego(nuevo);
            }catch(Exception e){
                error = "Error al actualizar el juego";
            }
            response.sendRedirect("verJuego.jsp");
        }else{
            if(request.getParameter("eliminar") != null){
                try {
                    juego.eliminarJuego(id);
                } catch (Exception e) {
                    error = "Error al eliminar la consola";
                    getServletContext().getRequestDispatcher("/juego/verJuego.jsp").forward(request, response);
                }
                response.sendRedirect("verJuego.jsp");
            }else{
                 
                request.setAttribute("id", nuevo.getId());
                request.setAttribute("nombre", nuevo.getNombre());
                request.setAttribute("fechaLanzamiento", nuevo.getFechaLanzamientoCorta());
                request.setAttribute("precio", nuevo.getPrecio());
                request.setAttribute("cantidad", nuevo.getCantidad());
                request.setAttribute("genero", nuevo.getGenero());
                request.setAttribute("url", nuevo.getUrl());
                request.setAttribute("consola", nuevo.getConsola().getNombre());
                getServletContext().getRequestDispatcher("/juego/editarJuego.jsp").forward(request, response);
            
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
    
    public static String toUpperCaseFirst(String valor) {
    if (valor == null || valor.isEmpty()) {
        return valor;
    } else {       
        return  valor.toUpperCase().charAt(0) + valor.substring(1, valor.length()).toLowerCase();
    }
}
}
