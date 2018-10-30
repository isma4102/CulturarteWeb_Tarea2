/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
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
import servicios.DtConsultaPropuesta;
import servicios.DtConsultaPropuesta2;
import servicios.DtNickTitProp;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;
import servicios.DtUsuario;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletConsultarPropuesta", urlPatterns = {"/ServletConsultarPropuesta"})
public class ServletConsultarPropuesta extends HttpServlet {

    private PublicadorConsultarPropuesta port;

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
        } catch (MalformedURLException ex) {
            Logger.getLogger(ServletCancelarPropuesta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<DtNickTitProp> listP = this.port.listarPropuestas().getListPropuestas();

        request.setAttribute("listaPropuestas", listP);
        request.getRequestDispatcher("Vistas/ConsultarPropuesta.jsp").forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        String tit = request.getParameter("TituloP");
        String titulo = new String(tit.getBytes("ISO-8859-1"), "UTF-8");

        try {
            DtUsuario proponente = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

            if (request.getSession().getAttribute("usuario_logueado") != null) {
                DtConsultaPropuesta dtinfo = this.port.seleccionarPropuesta(titulo, proponente.getNickname());
                request.setAttribute("propuesta", dtinfo);
            } else {
                DtConsultaPropuesta dtinfo = this.port.seleccionarPropuesta2(titulo);
                request.setAttribute("propuesta", dtinfo);
            }
            List<DtConsultaPropuesta2> listColab = this.port.listarColaboradoresProp(titulo).getLista();

            request.setAttribute("listaC", listColab);

        } catch (Exception ex) {
            String error = ex.getMessage();
            request.setAttribute("errorContrasenia", error);
            request.getRequestDispatcher("/Vistas/ConsultarPropuesta.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/Vistas/ConsultarPropuesta2.jsp").forward(request, response);

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
