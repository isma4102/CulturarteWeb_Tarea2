/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.Exception_Exception;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;
import servicios.PublicadorConsultarUsuario;
import servicios.PublicadorConsultarUsuarioService;

/**
 *
 * @author Santiago.S
 */
@WebServlet(name = "ServletImagenes", urlPatterns = {"/ServletImagenes"})
public class ServletImagenes extends HttpServlet {

    private PublicadorConsultarUsuario port;
    private PublicadorConsultarPropuesta port1;
    configuracion conf = new configuracion();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception_Exception {
        response.setContentType("text/html;charset=UTF-8");

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
        try {
            ServletContext context;
            context = request.getServletContext();
            String ruta = context.getResource("").getPath();

            URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + conf.leerProp("sConsultaUsuario", ruta));
            URL url1 = new URL("http://" + conf.obtenerServer("servidor", ruta) + conf.leerProp("sConsultaPropuesta", ruta));
            PublicadorConsultarUsuarioService webService = new PublicadorConsultarUsuarioService(url);
            PublicadorConsultarPropuestaService webService2 = new PublicadorConsultarPropuestaService(url1);
            this.port = webService.getPublicadorConsultarUsuarioPort();
            this.port1 = webService2.getPublicadorConsultarPropuestaPort();

            if (request.getParameter("TituloP") != null) {
                String titulo = request.getParameter("TituloP");
                titulo = titulo.replace("%20", " ");
                BufferedImage bi = null;
                byte[] arreglo = port1.retornarImagen(titulo);
                BufferedImage bi1 = this.createImageFromBytes(arreglo);
                OutputStream out1 = response.getOutputStream();
                ImageIO.write((RenderedImage) bi1, "png", out1);
                out1.close();
            } else if (request.getParameter("nickname") != null) {
                String nick = request.getParameter("nickname");
                byte[] arreglo = port.retornarImagen(nick);
                BufferedImage bi = this.createImageFromBytes(arreglo);
                OutputStream out = response.getOutputStream();
                ImageIO.write((RenderedImage) bi, "png", out);
                out.close();
            }
        } catch (Exception_Exception ex) {
            Logger.getLogger(ServletImagenes.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception_Exception ex) {
            Logger.getLogger(ServletImagenes.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    private BufferedImage createImageFromBytes(byte[] imageData) {
        ByteArrayInputStream bais = new ByteArrayInputStream(imageData);
        try {
            return ImageIO.read(bais);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
