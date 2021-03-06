/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import clases.EstadoSesion;
import java.io.IOException;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.URL;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servicios.DtListPropuestaWeb;
import servicios.DtPropuestaWeb;
import servicios.DtUsuario;
import servicios.PublicadorConsultarUsuario;
import servicios.PublicadorConsultarUsuarioService;
import servicios.PublicadorInicio;
import servicios.PublicadorInicioService;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletInicio", urlPatterns = {"/ServletInicio"})
public class ServletInicio extends HttpServlet {

    private PublicadorInicio port;
    private PublicadorConsultarUsuario port1;
    private RegistroSitio RS = new RegistroSitio();
    private configuracion conf = new configuracion();

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

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context;
        context = (ServletContext) request.getServletContext();
        String ruta = context.getResource("").getPath();
        String sv = conf.obtenerServer("servidor", ruta);
        URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + conf.leerProp("sInicio", ruta));
        PublicadorInicioService webService = new PublicadorInicioService(url);
        this.port = webService.getPublicadorInicioPort();

        URL url1 = new URL("http://" + conf.obtenerServer("servidor", ruta) + "/servicioConsultaU");
        PublicadorConsultarUsuarioService webService1 = new PublicadorConsultarUsuarioService(url1);
        this.port1 = webService1.getPublicadorConsultarUsuarioPort();
        RS = new RegistroSitio();

        DtListPropuestaWeb ListaProp = this.port.listarPropuestasWeb();
        List<DtPropuestaWeb> listPublicada = ListaProp.getPublicadas();
        List<DtPropuestaWeb> listFinanciada = ListaProp.getFinanciadas();
        List<DtPropuestaWeb> listEnFinanciacion = ListaProp.getEnFinanciacion();
        List<DtPropuestaWeb> listNoFinanciada = ListaProp.getNoFinanciadas();
        List<DtPropuestaWeb> listCancelada = ListaProp.getCanceladas();

        request.setAttribute("Cancelada", listCancelada);
        request.setAttribute("Publicada", listPublicada);
        request.setAttribute("Financiada", listFinanciada);
        request.setAttribute("noFinanciada", listNoFinanciada);
        request.setAttribute("enFinanciacion", listEnFinanciacion);

        DtUsuario usrCorreo = null;
        DtUsuario usrNick = null;
        DtUsuario logueado = null;
        HttpSession session = request.getSession();
        if (session.getAttribute("usuario_logueado") == null) {

            boolean haySesion = false;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("cookieSesion")) {
                        if (!cookies[i].getValue().equals("")) {
                            haySesion = true;
                            String usuarioid = cookies[i].getValue();
                            try {
                                usrNick = this.port1.obtenerDtUsuario(usuarioid);
                            } catch (Exception error) {
                                try {
                                    usrCorreo = this.port1.obtenerDtUsuarioCorreo(usuarioid);
                                } catch (Exception e) {
                                }
                            }

                            if (usrNick == null) {
                                logueado = usrCorreo;
                            } else {
                                logueado = usrNick;
                            }

                            session.setAttribute("estado_sesion", EstadoSesion.LOGIN_CORRECTO);
                            session.setAttribute("usuario_logueado", logueado);
                        }
                    }
                }
            }
            if (!haySesion) {
                session.setAttribute("estado_sesion", null);
                session.setAttribute("usuario_logueado", null);
            }
        }
        String browserDetails = request.getHeader("User-Agent");
        String IP;
        try (final DatagramSocket socket = new DatagramSocket()) {
            socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
            IP = socket.getLocalAddress().getHostAddress();
        }
        String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletInicio";
        RS.ObtenerRegistro(browserDetails, IP, URL);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
