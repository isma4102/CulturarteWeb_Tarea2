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
import servicios.DtNickTitProp;
import servicios.DtUsuario;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletCancelarPropuesta", urlPatterns = {"/ServletCancelarPropuesta"})
public class ServletCancelarPropuesta extends HttpServlet {

    private PublicadorConsultarPropuesta port;
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
            URL url = new URL("http://127.0.0.1:8280/servicioConsultaP");

            PublicadorConsultarPropuestaService webService = new PublicadorConsultarPropuestaService(url);
            this.port = webService.getPublicadorConsultarPropuestaPort();
            RS = new RegistroSitio();
        } catch (MalformedURLException ex) {
            Logger.getLogger(ServletCancelarPropuesta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DtUsuario usuLogueado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        if (usuLogueado == null) {
            request.setAttribute("mensaje", "No existe una sesion en el sistema");
            request.getRequestDispatcher("Vistas/Mensaje_Recibido.jsp").forward(request, response);
        } else {
            if (usuLogueado.isEsproponente()) {
                List<DtNickTitProp> list = port.listarPropuestasCancelar(usuLogueado.getNickname()).getListPropuestas();
                if (list.isEmpty()) {
                    request.setAttribute("mensaje", "No tiene propuestas para cancelar");
                    request.getRequestDispatcher("Vistas/Mensaje_Recibido.jsp").forward(request, response);
                } else {
                    request.setAttribute("Lista", list);
                    String browserDetails = request.getHeader("User-Agent");
                    String IP = InetAddress.getLocalHost().getHostAddress();
                    String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletCancelarPropuesta";
                    RS.ObtenerRegistro(browserDetails, IP, URL);
                    request.getRequestDispatcher("Vistas/CancelarPropuesta.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("mensaje", "Solo los proponentes pueden entrar");
                request.getRequestDispatcher("Vistas/Mensaje_Recibido.jsp").forward(request, response);
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
        try {
            String tit = request.getParameter("TituloP");
            String titulo = new String(tit.getBytes("ISO-8859-1"), "UTF-8");
            DtUsuario proponente = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

            boolean ok = port.cancelarPropuesta(titulo, proponente.getNickname());

            if (ok) {
                request.setAttribute("mensaje", "Se cancelo con exito la propuesta");
            } else {
                request.setAttribute("mensaje", "La propuesta no pudo ser cancelada");
            }
        } catch (ExceptionInInitializerError | Exception a) {
            String mensajeError = "La propuesta no pudo ser cancelada";
            request.setAttribute("mensaje", mensajeError);
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);

        }
        request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);

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
