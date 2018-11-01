/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtNickTitProp;
import servicios.DtUsuario;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;

/**
 *
 * @author Santiago.S
 */
@WebServlet(name = "ServletExtenderFinanciacion", urlPatterns = {"/ServletExtenderFinanciacion"})
public class ServletExtenderFinanciacion extends HttpServlet {

    private PublicadorConsultarPropuesta port;
    private RegistroSitio RS= new RegistroSitio();
    configuracion conf = new configuracion();

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

        if (request.getSession().getAttribute("usuario_logueado") == null) {
            request.setAttribute("mensaje", "No existe una sesión en el sistema");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
        } else {
            if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).isEsproponente() == true) {

                List<DtNickTitProp> lista = this.port.listarPropuestasXDeProponenteX(((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickname()).getListPropuestas();
                if (lista.isEmpty()) {
                    request.setAttribute("mensaje", "No existen propuestas para extender");
                    request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
                } else {
                    request.setAttribute("lista_propuestas", lista);
                    String browserDetails = request.getHeader("User-Agent");
                    String IP = InetAddress.getLocalHost().getHostAddress();
                    String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletConsultarUsuario";
                    RS.ObtenerRegistro(browserDetails, IP, URL);
                    request.getRequestDispatcher("/Vistas/ExtenderFinanciacion.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("mensaje", "Solo los proponentes pueden entrar");
                request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("TituloP") != null) {
            String viene = request.getParameter("TituloP");
            String Opcion = new String(viene.getBytes("ISO-8859-1"), "UTF-8");
            this.port.extenderFinanciacion(((String) request.getParameter("TituloP")));
            request.setAttribute("mensaje", "Se extendio la fecha de la propuesta");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
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

}
