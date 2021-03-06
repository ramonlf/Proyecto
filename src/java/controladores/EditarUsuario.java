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
import modelo.entidades.Usuario;
import modelo.modelo.UsuarioBean;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "EditarUsuario", urlPatterns = {"/usuario/EditarUsuario"})
public class EditarUsuario extends HttpServlet {

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
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute("usuarioBean");
        Usuario nuevo = usuario.buscarUsuario(id);
        if (request.getParameter("actualizar") != null) {
            boolean administrador = (request.getParameter("administrador") != null);
            nuevo.setNombre(request.getParameter("nombre"));
            nuevo.setApellido(request.getParameter("apellido"));
            nuevo.setDni(request.getParameter("dni"));
            nuevo.setLogin(request.getParameter("login"));
            nuevo.setPassword(request.getParameter("password"));
            nuevo.setEmail(request.getParameter("email"));
            nuevo.setTelefono(request.getParameter("telefono"));
            nuevo.setFechaNacimiento(parseFecha(request.getParameter("fechaNacimiento")));
            nuevo.setAdministrador(administrador);
            try {
                usuario.actualizarUsuario(nuevo);
            } catch (Exception e) {
                error = "Error al actualizar el usuario";
            }
            if (error != null) {
                response.sendRedirect("verUsuario.jsp?error=" + error);
            }else{
                response.sendRedirect("verUsuario.jsp");
            }
        } else {
            if (request.getParameter("eliminar") != null) {
                try {
                    usuario.borrarUsuario(id);
                } catch (Exception e) {
                    error = "Error al borrar el usuario";
                    request.setAttribute("error", error);
                    getServletContext().getRequestDispatcher("/usuario/verUsuario.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("id", nuevo.getId());
                request.setAttribute("nombre", nuevo.getNombre());
                request.setAttribute("apellido", nuevo.getApellido());
                request.setAttribute("dni", nuevo.getDni());
                request.setAttribute("login", nuevo.getLogin());
                request.setAttribute("password", nuevo.getPassword());
                request.setAttribute("email", nuevo.getEmail());
                request.setAttribute("telefono", nuevo.getTelefono());
                request.setAttribute("fechaNacimiento", nuevo.getFechaNacimientoCorta());
                request.setAttribute("checked", nuevo.isAdministrador() ? "checked" : "");
                request.setAttribute("error", error);
                getServletContext().getRequestDispatcher("/usuario/editarUsuario.jsp").forward(request, response);
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
}
