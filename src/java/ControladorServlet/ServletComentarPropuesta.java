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
import servicios.DtNickTitProp;
import servicios.DtUsuario;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;

/**
 *
 * @author Santiago.S
 */
@WebServlet(name = "ServletComentarPropuesta", urlPatterns = {"/ServletComentarPropuesta"})
public class ServletComentarPropuesta extends HttpServlet {

    private PublicadorConsultarPropuesta port;

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

        if (request.getSession().getAttribute("usuario_logueado") == null) {
            request.setAttribute("mensaje", "No existe una sesion en el sistema");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
        } else {
            if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).isEsproponente() == false) {
                List<DtNickTitProp> lista = port.listarPropuestasComentar().getListPropuestas();
                request.setAttribute("lista_propuestascomentar", lista);
                request.getRequestDispatcher("/Vistas/AgregarComentario.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", "Solo los colaboradores pueden entrar");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DtUsuario usuario = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

        if (usuario != null) {
            String nickColab = usuario.getNickname();
            String TituloP = request.getParameter("TituloP");
            String texto = request.getParameter("texto");

            try {
                this.port.comentarPropuesta(TituloP, texto, texto);
                request.setAttribute("comentarProp", "Propuesta Comentada con Éxito!!!");
            } catch (Exception ex) {
                Logger.getLogger(ServletComentarPropuesta.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("comentarProp", ex.getMessage());
            }

            processRequest(request, response);

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
