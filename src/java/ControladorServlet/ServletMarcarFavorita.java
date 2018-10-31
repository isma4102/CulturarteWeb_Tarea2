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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtUsuario;
import servicios.DtinfoPropuesta;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;
import servicios.PublicadorConsultarUsuario;
import servicios.PublicadorConsultarUsuarioService;

/**
 *
 * @author gabri
 */
@WebServlet(name = "ServletMarcarFavorita", urlPatterns = {"/ServletMarcarFavorita"})
public class ServletMarcarFavorita extends HttpServlet {

    private PublicadorConsultarUsuario portU;
    private PublicadorConsultarPropuesta portP;
    private RegistroSitio RS;

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
        try {
            URL urlP = new URL("http://127.0.0.1:8280/servicioConsultaP");

            PublicadorConsultarPropuestaService webServiceP = new PublicadorConsultarPropuestaService(urlP);
            this.portP = webServiceP.getPublicadorConsultarPropuestaPort();

            URL url = new URL("http://127.0.0.1:8280/servicioConsultaU");
            PublicadorConsultarUsuarioService webService = new PublicadorConsultarUsuarioService(url);
            this.portU = webService.getPublicadorConsultarUsuarioPort();
            RS = new RegistroSitio();
        } catch (MalformedURLException ex) {
            Logger.getLogger(ServletCancelarPropuesta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            DtUsuario usuLogeado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
            if (usuLogeado != null) {
                response.setContentType("text/html;charset=UTF-8");

                if (this.portP.getDtPropuestas().getLista().isEmpty()) {
                    request.setAttribute("mensaje", "No existen propuestas en el sistema");
                    request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
                }
                List<DtinfoPropuesta> propuestas = this.portP.listarPropuestasNoI().getLista();
                request.setAttribute("Propuestas", propuestas);
                request.getRequestDispatcher("Vistas/MarcarFavorita.jsp").forward(request, response);
                String browserDetails = request.getHeader("User-Agent");
                String IP = InetAddress.getLocalHost().getHostAddress();
                String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletConsultarUsuario";
                RS.ObtenerRegistro(browserDetails, IP, URL);
            } else {
                request.setAttribute("mensaje", "No existe una sesion en el sistema");
                request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
            }

        } catch (Exception a) {

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
        String titulo = (String) request.getParameter("TituloP");
        DtUsuario nick = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        Boolean exito = this.portU.agregarFavortio(titulo, nick.getNickname());
        if (exito) {
            request.setAttribute("favorito", "Propuesta marcada como favorita");
        } else {
            request.setAttribute("favorito", "No se pudo marcar propuesta como favorita");
        }
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
