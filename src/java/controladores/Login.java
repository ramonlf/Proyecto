/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.entidades.Usuario;
import modelo.entidades.UsuarioJpaController;
import modelo.modelo.ConsolaBean;
import modelo.modelo.JuegoBean;

/**
 *
 * @author usuario
 */
@WebServlet(name = "Login", urlPatterns = {"/usuario/Login"})
public class Login extends HttpServlet {

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

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if (login == null || password == null) {
            error = "Debe acceder por la pagina de login";
        } else {
            if (login.isEmpty() || password.isEmpty()) {
                error = "Ambos campos no estan rellenados";
            } else {
                UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory("ProyectoFinalPU"));
                List<Usuario> usuarios = ujc.findUsuarioEntities();
                for(Usuario usu : usuarios){
                    if (usu.getLogin().equals(login) && usu.getPassword().equals(password)) {
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("usuario", usu);
                        sesion.setAttribute("consolaBean", new ConsolaBean());
                        sesion.setAttribute("juegoBean", new JuegoBean());
                        response.sendRedirect("../index.jsp");
                        return;
                    }
                }
                error = "Usuario o contraseña incorrecto";
            }
        }
        request.setAttribute("error", error);
        getServletContext().getRequestDispatcher("/usuario/login.jsp").forward(request, response);
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
