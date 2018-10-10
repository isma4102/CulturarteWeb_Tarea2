/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        //request.getRequestDispatcher("script/filtroBuscador.js").forward(request, response);
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
        iControlador = Fabrica.getInstance().getControladorPropCat();
        String filtro = request.getParameter("filtro");
        String busqueda = request.getParameter("busqueda");
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

        if (filtro != null) {
            switch (filtro) {
                case "Alfabeticamente":
                    Collections.sort(resultado, (DtinfoPropuesta o1, DtinfoPropuesta o2) -> o1.getTitulo().compareTo(o2.getTitulo()));
                    request.setAttribute("resultado", resultado);
                    request.setAttribute("busqueda", busqueda);
                    request.setAttribute("tipoRetorno", "busqueda");
                    request.getRequestDispatcher("/Vistas/busqueda.jsp").forward(request, response);
                    break;
                case "Estado":
                    Collections.sort(resultado, (DtinfoPropuesta o1, DtinfoPropuesta o2) -> o1.getEstado().compareTo(o2.getEstado()));
                    request.setAttribute("resultado", resultado);
                    request.setAttribute("busqueda", busqueda);
                    request.setAttribute("tipoRetorno", "busqueda");
                    request.getRequestDispatcher("/Vistas/busqueda.jsp").forward(request, response);
                    break;
                case "Fecha":
                    Collections.sort(resultado, (DtinfoPropuesta o1, DtinfoPropuesta o2) -> o1.getFechaReal().compareTo(o2.getFechaReal()));
                    request.setAttribute("resultado", resultado);
                    request.setAttribute("busqueda", busqueda);
                    request.setAttribute("tipoRetorno", "busqueda");
                    request.getRequestDispatcher("/Vistas/busqueda.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("resultado", resultado);
            request.setAttribute("busqueda", busqueda);
            request.setAttribute("tipoRetorno", "busqueda");
            request.getRequestDispatcher("/Vistas/busqueda.jsp").forward(request, response);
        }
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
