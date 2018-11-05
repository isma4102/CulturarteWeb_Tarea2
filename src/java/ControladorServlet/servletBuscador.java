/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtConsultaPropuesta;
import servicios.PublicadorConsultarPropuesta;
import servicios.PublicadorConsultarPropuestaService;

@WebServlet(name = "servletBuscador", urlPatterns = {"/servletBuscador"})
public class servletBuscador extends HttpServlet {

    private PublicadorConsultarPropuesta port;
    configuracion conf = new configuracion();

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

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context;
        context = request.getServletContext();
        String ruta = context.getResource("").getPath();
        URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + "/servicioConsultaP");
        //URL url = new URL("http://"+conf.leerPropiedades("servidor")+"/servicioConsultaP");
        PublicadorConsultarPropuestaService webService = new PublicadorConsultarPropuestaService(url);
        this.port = webService.getPublicadorConsultarPropuestaPort();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String filtro = request.getParameter("filtro");

            String busqueda = request.getParameter("busqueda");
            List<DtConsultaPropuesta> resultado = new ArrayList<>();
            List<DtConsultaPropuesta> propuestas = this.port.getDtPropuestas().getLista();
            Iterator iter = propuestas.iterator();
            while (iter.hasNext()) {
                DtConsultaPropuesta prop = (DtConsultaPropuesta) iter.next();
                busqueda = busqueda.toLowerCase();
                if (prop.getTitulo().toLowerCase().contains(busqueda) || prop.getDescripcion().toLowerCase().contains(busqueda) || prop.getLugar().toLowerCase().contains(busqueda)) {
                    resultado.add(prop);
                }
            }

            if (filtro != null) {
                switch (filtro) {
                    case "Alfabeticamente":
                        Collections.sort(resultado, (DtConsultaPropuesta o1, DtConsultaPropuesta o2) -> o1.getTitulo().toLowerCase().compareTo(o2.getTitulo().toLowerCase()));
                        request.setAttribute("resultado", resultado);
                        request.setAttribute("busqueda", busqueda);
                        request.setAttribute("tipoRetorno", "busqueda");
                        request.getRequestDispatcher("/Vistas/busqueda.jsp").forward(request, response);
                        break;
                    case "Estado":
                        Collections.sort(resultado, (DtConsultaPropuesta o1, DtConsultaPropuesta o2) -> o1.getEstadoActual().compareTo(o2.getEstadoActual()));
                        request.setAttribute("resultado", resultado);
                        request.setAttribute("busqueda", busqueda);
                        request.setAttribute("tipoRetorno", "busqueda");
                        request.getRequestDispatcher("/Vistas/busqueda.jsp").forward(request, response);
                        break;
                    case "Fecha":
                        Collections.sort(resultado, (DtConsultaPropuesta o1, DtConsultaPropuesta o2) -> o1.getFechaR().compareTo(o2.getFechaR()));
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
        } catch (Exception ex) {

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
