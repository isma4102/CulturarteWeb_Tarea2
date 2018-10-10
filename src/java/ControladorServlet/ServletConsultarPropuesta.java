/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Clases.DtConsultaPropuesta;
import logica.Clases.DtNickTitProp;
import logica.Fabrica;
import logica.Clases.DtUsuario;
import logica.Clases.DtConsultaPropuesta2;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletConsultarPropuesta", urlPatterns = {"/ServletConsultarPropuesta"})
public class ServletConsultarPropuesta extends HttpServlet {

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
        List<DtNickTitProp> listP = Fabrica.getInstance().getControladorPropCat().listarPropuestas();
        
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
        DtUsuario proponente = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        String nickProp = null;
        
        if (proponente != null) {
            nickProp = proponente.getNickName();
        }

        try {
            DtConsultaPropuesta dtinfo = Fabrica.getInstance().getControladorPropCat().SeleccionarPropuesta(titulo, nickProp);
            request.setAttribute("propuesta", dtinfo);

            List<DtConsultaPropuesta2> listColab = Fabrica.getInstance().getControladorPropCat().ListaColaboradoresProp(titulo);

            request.setAttribute("listaC", listColab);

        } catch (Exception ex) {
            Logger.getLogger(ServletConsultarPropuesta.class.getName()).log(Level.SEVERE, null, ex);
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
