/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Clases.DtColaboraciones;
import logica.Fabrica;
import logica.Interfaces.IPropCat;
import logica.Clases.Propuesta;
import logica.Clases.DtinfoPropuesta;

@WebServlet(name = "servletBuscador", urlPatterns = {"/servletBuscador"})

public class servletBuscador extends HttpServlet {

    IPropCat iControlador;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("script/buscador.js").forward(request, response);
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
        String busqueda = request.getParameter("busqueda").toLowerCase();
        iControlador = Fabrica.getInstance().getControladorPropCat();
        List<DtinfoPropuesta> resultado = new ArrayList<>();
        Map<String, Propuesta> propuestas = iControlador.getPropuestas();
        Set set = propuestas.entrySet();
        Iterator iter = set.iterator();
        while (iter.hasNext()) {
            Map.Entry mentry = (Map.Entry) iter.next();
            Propuesta prop = (Propuesta) mentry.getValue();
            if (prop.getTituloP().toLowerCase().contains(busqueda) || prop.getDescripcionP().toLowerCase().contains(busqueda) || prop.getLugar().toLowerCase().contains(busqueda)) {
                DtinfoPropuesta dtP = new DtinfoPropuesta(prop);
                resultado.add(dtP);
            }
        }
        request.setAttribute("resultado", resultado);
        request.getRequestDispatcher("/Vistas/busqueda.jsp").forward(request, response);
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
