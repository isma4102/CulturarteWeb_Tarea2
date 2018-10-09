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
import logica.Clases.DtNickTitProp;
import logica.Clases.DtUsuario;
import logica.Fabrica;
import logica.Interfaces.IPropCat;

/**
 *
 * @author Santiago.S
 */
@WebServlet(name = "ServletExtenderFinanciacion", urlPatterns = {"/ServletExtenderFinanciacion"})
public class ServletExtenderFinanciacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        IPropCat IPC = Fabrica.getInstance().getControladorPropCat();
        List<DtNickTitProp> lista = IPC.ListarPropuestasX_DeProponenteX(((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickName());
        request.setAttribute("lista_propuestas", lista);
        request.getRequestDispatcher("/Vistas/ExtenderFinanciacion.jsp").forward(request, response);
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
        IPropCat IPC = Fabrica.getInstance().getControladorPropCat();
        if (request.getParameter("TituloP") != null) {
            String viene = request.getParameter("TituloP");
            String Opcion = new String(viene.getBytes("ISO-8859-1"), "UTF-8");
            IPC.ExtenderFinanciacion(((String) request.getParameter("TituloP")));
            request.setAttribute("mensaje","Se extendio la fecha de la propuesta");
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
