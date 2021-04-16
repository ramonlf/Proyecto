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
import modelo.entidades.Usuario;
import modelo.entidades.UsuarioJpaController;
import modelo.modelo.UsuarioBean;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "RegistroUsuario", urlPatterns = {"/usuario/RegistroUsuario"})
public class RegistroUsuario extends HttpServlet {

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

        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        boolean administrador = false;
        UsuarioBean usuario = new UsuarioBean();

        Usuario nuevo = new Usuario(dni, nombre, apellido, login, password, parseFecha(fechaNacimiento), administrador);
        
        UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
        List<Usuario> usuarios = ujc.findUsuarioEntities();
        for(Usuario usu : usuarios){
        }
        
        try{
            usuario.registroUsuario(nuevo);
        }catch(Exception e){
            error = "Error al crear el usuario";
        }
        
        if (error != null) {
            request.setAttribute("error", error);
            request.setAttribute("nombre", nombre);
            request.setAttribute("login", login);
            request.setAttribute("password", password);
            getServletContext().getRequestDispatcher("/usuario/registrarse.jsp").forward(request, response);
        } else {
            String mensaje = "Se ha dado de alta al Sanitario";
            response.sendRedirect(response.encodeRedirectURL("../index.html?mensaje=" + mensaje));
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
