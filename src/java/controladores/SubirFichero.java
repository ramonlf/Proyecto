/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Ramon
 */
@WebServlet(name = "SubirFichero", urlPatterns = {"/SubirFichero"})
public class SubirFichero extends HttpServlet {

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
        String error ="";
        
        try {
            Part parteFichero = request.getPart("fichero");
            String ruta = getServletContext().getRealPath("fotos/juegos/");
            File directorioUsuario = new File(ruta);

            ruta += "/" + parteFichero.getSubmittedFileName();
            if (error.isEmpty()) {
                FileOutputStream salida = new FileOutputStream(ruta);
                InputStream entrada = parteFichero.getInputStream();
                // Creamos un buffer de entrada / salida de bytes
                // Su tamaño se toma del parámetro de inicialización tamBuffer
                int tamBuffer = Integer.parseInt(getServletConfig().getInitParameter("tamBuffer"));
                byte[] buffer = new byte[tamBuffer];
                int leidos;
                while (entrada.available() > 0) {
                    leidos = entrada.read(buffer);
                    salida.write(buffer, 0, leidos);
                }
                salida.close();
                entrada.close();
                parteFichero.delete();
            }
        } catch (IOException e) {
            error += "Se ha producido un error de entrada/salida: " + e.getMessage();
        }
        error = response.encodeURL(error);
        response.sendRedirect("juego/subirFoto.jsp?error=" + error);
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
