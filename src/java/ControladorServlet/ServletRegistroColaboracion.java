/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtListaPropuestasR;
import servicios.PublicadorRegistrarColaboracion;
import servicios.PublicadorRegistrarColaboracionService;
import servicios.DtUsuario;
import servicios.DtinfoPropuesta;
import servicios.TipoE;

/**
 *
 * @author Santiago.S
 */
@WebServlet("/ServletRegistroColaboracion")
public class ServletRegistroColaboracion extends HttpServlet {

    private PublicadorRegistrarColaboracion port;
    configuracion conf = new configuracion();

    @Override
    public void init() throws ServletException {

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context;
        context = request.getServletContext();
        String ruta = context.getResource("").getPath();
        URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + conf.leerProp("sRegistrarColaboracion", ruta));

        PublicadorRegistrarColaboracionService webService = new PublicadorRegistrarColaboracionService(url);
        this.port = webService.getPublicadorRegistrarColaboracionPort();

        if (request.getSession().getAttribute("usuario_logueado") == null) {
            request.setAttribute("mensaje", "No existe una sesion en el sistema");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
        } else {
            if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).isEsproponente() == true) {
                request.setAttribute("mensaje", "Solo los colaboradores pueden entrar a este sitio");
                request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
            } else {
                List<DtListaPropuestasR> lista = this.port.listarPropuestasRWEB().getLista();
                if (lista.isEmpty()) {
                    request.setAttribute("mensaje", "No existen propuestas en el sistema");
                    request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
                }
                request.setAttribute("lista_propuestas", lista);
                request.getRequestDispatcher("/Vistas/RegColaboracion.jsp").forward(request, response);
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
        String Opcion = null;
       if (request.getParameter("seleccionar") != null) {
            if (request.getParameter("Estado").compareTo(TipoE.PUBLICADA.toString()) == 0 || request.getParameter("Estado").compareTo(TipoE.EN_FINANCIACION.toString()) == 0) {
                String viene = request.getParameter("TituloP");
                Opcion = new String(viene.getBytes("ISO-8859-1"), "UTF-8");
                DtinfoPropuesta propuesta = this.port.seleccionarPropuestaR(Opcion);
                this.port.seleccionarColaborador(((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickname());
                request.setAttribute("Propuestaseleccionada", propuesta);
                request.getRequestDispatcher("/Vistas/Mensaje_Confirmacion.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", "Usted no puede colaborar en esta propuesta");
                request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
            }
        } else if (request.getParameter("Registrar") != null) {
            if (request.getSession().getAttribute("usuario_logueado") != null) {
                String Tipo_entrada = request.getParameter("Tipo_Retorno");
                String monto = request.getParameter("Monto");
                float monto_final = Float.parseFloat(monto);
                boolean OK = false;
                if (Tipo_entrada.compareTo("Entradas") == 0) {
                    try {
                        OK = this.port.agregarColaboracion(true, monto_final);
                    } catch (Exception ex) {
                        String MENSAJE = ex.getMessage();
                        request.setAttribute("mensaje", MENSAJE);
                        request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
                    }
                    if (OK == true) {
                        String MENSAJE = "La colaboración con la propuesta " + Opcion + " se registró correctamente";
                        request.setAttribute("mensaje", MENSAJE);
                        request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
                    }
                } else if (Tipo_entrada.compareTo("Por_ganancias") == 0) {
                    try {
                        OK = this.port.agregarColaboracion(false, monto_final);
                    } catch (Exception ex) {
                        String MENSAJE = ex.getMessage();
                        request.setAttribute("mensaje", MENSAJE);
                        request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
                    }
                    if (OK == true) {
                        String MENSAJE = "La colaboración con la propuesta " + Opcion + " se registró correctamente";
                        request.setAttribute("mensaje", MENSAJE);
                        request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
                    }
                }
            }
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
