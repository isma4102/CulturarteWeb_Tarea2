/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtRecomendacionProp;
import servicios.DtUsuario;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletRecomendacionProp", urlPatterns = {"/ServletRecomendacionProp"})
public class ServletRecomendacionProp extends HttpServlet {

    private PublicadorConsultarPropuesta port;
    private RegistroSitio RS = new RegistroSitio();

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DtUsuario usu = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

        if (!usu.isEsproponente()) {
            ServletContext context;
            context = request.getServletContext();
            String ruta = context.getResource("").getPath();
            URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + "/servicioConsultaP");
            PublicadorConsultarPropuestaService webService = new PublicadorConsultarPropuestaService(url);
            this.port = webService.getPublicadorConsultarPropuestaPort();

            List<DtRecomendacionProp> listP = this.port.recomendacionDePropuestas(usu.getNickname()).getLista();
            Collections.sort(listP, (DtRecomendacionProp o1, DtRecomendacionProp o2) -> new Integer(o2.getPuntaje()).compareTo(o1.getPuntaje()));

            request.setAttribute("listaPropuestas", listP);
            String browserDetails = request.getHeader("User-Agent");
            String IP = InetAddress.getLocalHost().getHostAddress();
            String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletConsultarPropuesta";
            RS.ObtenerRegistro(browserDetails, IP, URL);
            request.getRequestDispatcher("Vistas/RecomendacionPropuesta.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
