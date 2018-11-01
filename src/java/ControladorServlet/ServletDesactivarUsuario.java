/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtUsuario;
import servicios.PublicadorConsultarUsuario;
import servicios.PublicadorConsultarUsuarioService;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletDesactivarUsuario", urlPatterns = {"/ServletDesactivarUsuario"})
public class ServletDesactivarUsuario extends HttpServlet {

    private PublicadorConsultarUsuario port;
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
        RS = new RegistroSitio();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context;
        context = request.getServletContext();
        String ruta = context.getResource("").getPath();

        try {
            URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + "/servicioConsultaU");
            PublicadorConsultarUsuarioService webService = new PublicadorConsultarUsuarioService(url);
            this.port = webService.getPublicadorConsultarUsuarioPort();

        } catch (MalformedURLException ex) {
            Logger.getLogger(ServletCancelarPropuesta.class.getName()).log(Level.SEVERE, null, ex);
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
        String browserDetails = request.getHeader("User-Agent");
        String IP = InetAddress.getLocalHost().getHostAddress();
        String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletConsultarUsuario";
        RS.ObtenerRegistro(browserDetails, IP, URL);
        DtUsuario usu = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        if (usu != null && usu.isEsproponente()) {
            try {
                boolean ok = this.port.desactivarProponente(usu.getNickname());

                if (ok) {
                    request.getSession().setAttribute("usuario_logueado", null);
                    String mensajeD = "El usuario fue desactivado con exito";
                    request.setAttribute("mensajeDesactivacion", mensajeD);
                    request.getRequestDispatcher("ServletInicio").forward(request, response);
                }

            } catch (ExceptionInInitializerError | Exception a) {
                String mensajeD = "La operacion no pudo ser realizada con exito";
                request.setAttribute("mensajeDesactivacion", mensajeD);
                request.getRequestDispatcher("ServletInicio").forward(request, response);
            }
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
