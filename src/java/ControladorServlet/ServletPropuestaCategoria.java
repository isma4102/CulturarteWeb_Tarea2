/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtinfoPropuesta;
import servicios.PublicadorAltaPropuesta;
import servicios.PublicadorAltaPropuestaService;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;

/**
 *
 * @author gabri
 */
@WebServlet(name = "ServletPropuestaCategoria", urlPatterns = {"/ServletPropuestaCategoria"})
public class ServletPropuestaCategoria extends HttpServlet {

    private PublicadorConsultarPropuesta port;
    private PublicadorAltaPropuesta portCat;
    private RegistroSitio RS= new RegistroSitio();
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
    @Override
    public void init() throws ServletException {
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context;
        context = request.getServletContext();
        String ruta = context.getResource("").getPath();

        URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + "/servicioConsultaP");

        PublicadorConsultarPropuestaService webService = new PublicadorConsultarPropuestaService(url);
        this.port = webService.getPublicadorConsultarPropuestaPort();

        URL urlP = new URL("http://" + conf.obtenerServer("servidor", ruta) + "/servicioAltaP");

        PublicadorAltaPropuestaService webServiceP = new PublicadorAltaPropuestaService(urlP);
        this.portCat = webServiceP.getPublicadorAltaPropuestaPort();

        response.setContentType("text/html;charset=UTF-8");
        List<String> categorias = this.portCat.listarCategorias().getListCategoria();
        request.setAttribute("Categorias", categorias);
        request.getRequestDispatcher("Vistas/PropuestaporCategoria.jsp").forward(request, response);;
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
        String nombre = request.getParameter("cat");
        request.setAttribute("nombre", nombre);
        List<DtinfoPropuesta> propuestas = this.port.listarPropuestasCategoria(nombre).getLista();
        if (propuestas.isEmpty()) {
            request.setAttribute("mensaje", "No existen propuestas de esa categoria");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
        }
        request.setAttribute("Propuestas", propuestas);
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
