/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Clases.TipoE;
import logica.Fabrica;
import logica.Clases.DtPropuestaWeb;
/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletInicio", urlPatterns = {"/ServletInicio"})
public class ServletInicio extends HttpServlet {

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
            Fabrica.getInstance().getIControladorUsuario().CargarUsuarios();
            Fabrica.getInstance().getControladorPropCat().CargarPropuestas();
            Fabrica.getInstance().getControladorPropCat().CargarColaboraciones();
            Fabrica.getInstance().getControladorPropCat().comprobarBaseCat();
            Fabrica.getInstance().getIControladorUsuario().CargarFavoritas();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DtPropuestaWeb> listPublicada = Fabrica.getInstance().getControladorPropCat().ListarPropuestasWeb(TipoE.Publicada);
        List<DtPropuestaWeb> listFinanciada = Fabrica.getInstance().getControladorPropCat().ListarPropuestasWeb(TipoE.Publicada);
        List<DtPropuestaWeb> listenFinanciacion = Fabrica.getInstance().getControladorPropCat().ListarPropuestasWeb(TipoE.Publicada);
        List<DtPropuestaWeb> listnoFinanciada = Fabrica.getInstance().getControladorPropCat().ListarPropuestasWeb(TipoE.Publicada);
        
        request.setAttribute("Publicada", listPublicada);
        request.setAttribute("Financiada", listFinanciada);
        request.setAttribute("noFinanciada", listnoFinanciada);
        request.setAttribute("enFinanciacion", listenFinanciacion);
        
        request.getRequestDispatcher("Vistas/Inicio.jsp").forward(request, response);
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
