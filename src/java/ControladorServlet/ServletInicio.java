/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtListPropuestaWeb;
import servicios.DtPropuestaWeb;
import servicios.PublicadorInicio;
import servicios.PublicadorInicioService;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletInicio", urlPatterns = {"/ServletInicio"})
public class ServletInicio extends HttpServlet {

    private PublicadorInicio port;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     */
    @Override
    public void init() throws ServletException {
        try {
            URL url = new URL("http://127.0.0.1:8280/servicioInicio");
            PublicadorInicioService webService = new PublicadorInicioService(url);
            this.port = webService.getPublicadorInicioPort();

        } catch (MalformedURLException ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DtListPropuestaWeb ListaProp = this.port.listarPropuestasWeb();
        
        List<DtPropuestaWeb> listPublicada = ListaProp.getPublicadas();
        List<DtPropuestaWeb> listFinanciada = ListaProp.getNoFinanciadas();
        List<DtPropuestaWeb> listEnFinanciacion = ListaProp.getEnFinanciacion();
        List<DtPropuestaWeb> listNoFinanciada = ListaProp.getNoFinanciadas();
        List<DtPropuestaWeb> listCancelada = ListaProp.getCanceladas();

        request.setAttribute("Cancelada", listCancelada);
        request.setAttribute("Publicada", listPublicada);
        request.setAttribute("Financiada", listFinanciada);
        request.setAttribute("noFinanciada", listNoFinanciada);
        request.setAttribute("enFinanciacion", listEnFinanciacion);

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
