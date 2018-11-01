package ControladorServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import servicios.DtColaboraciones;
import servicios.DtUsuario;
import servicios.DtinfoColaborador;
import servicios.DtinfoPropuesta;
import servicios.PublicadorConsultarUsuario;
import servicios.PublicadorConsultarUsuarioService;
import java.net.InetAddress;
import java.util.Properties;
import javax.servlet.ServletContext;
import servicios.PublicadorInicio;
import servicios.PublicadorInicioService;

/**
 *
 * @author gabri
 */
@WebServlet("/ServletConsultarUsuario")
public class ServletConsultarUsuario extends HttpServlet {

    private PublicadorConsultarUsuario port;
    private PublicadorInicio port2;
    private RegistroSitio RS;
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

        URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + "/servicioConsultaU");
        PublicadorConsultarUsuarioService webService = new PublicadorConsultarUsuarioService(url);
        this.port = webService.getPublicadorConsultarUsuarioPort();

        response.setContentType("text/html;charset=UTF-8");

        if (port.listarUsuarios().getLista().isEmpty()) {
            request.setAttribute("mensaje", "No existen usuarios en el sistema");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
        }
        List<DtUsuario> usuarios = this.port.listarUsuarios().getLista();
        request.setAttribute("Usuarios", usuarios);
        String browserDetails = request.getHeader("User-Agent");
        String IP = InetAddress.getLocalHost().getHostAddress();
        String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletConsultarUsuario";
        RS.ObtenerRegistro(browserDetails, IP, URL);
        request.getRequestDispatcher("Vistas/ConsultarPerfilUsuario.jsp").forward(request, response);

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
        try {
            String nickname = request.getParameter("nick");

            DtUsuario dtu = this.port.obtenerDtUsuario(nickname);
            List<DtUsuario> seguidos = this.port.obtenerSeguidos(nickname).getLista();
            List<DtUsuario> seguidores = this.port.obtenerSeguidores(nickname).getLista();
            List<DtinfoPropuesta> favoritas = this.port.obtenerFavoritas(nickname).getLista();
            request.setAttribute("Seguidos", seguidos);
            request.setAttribute("Seguidores", seguidores);
            request.setAttribute("Usuario", dtu);
            request.setAttribute("Favoritas", favoritas);

            DtUsuario nick = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

            if (dtu.isEsproponente()) {
                List<DtinfoPropuesta> propuestas = this.port.listarPropuestasNoIngresadas(nickname).getLista();
                request.setAttribute("Propuestas", propuestas);
                if (nick != null) {
                    if (dtu.getNickname().equals(nick.getNickname())) {
                        List<DtinfoPropuesta> propuestasing = this.port.listarPropuestasDeProponenteX(nickname).getLista();
                        request.setAttribute("Propuestas2", propuestasing);
                    }
                }
            } else {
                List<DtinfoPropuesta> colaboraciones = this.port.verPropuestas(nickname).getLista();
                DtinfoColaborador dtc = this.port.getDtColaborador(nickname);
                List<DtColaboraciones> monto = this.port.getMontoColaboracion(dtc.getNickname()).getLista();
                request.setAttribute("Colaborador", monto);
                request.setAttribute("Colaboraciones", colaboraciones);
            }
        } catch (ExceptionInInitializerError | Exception a) {
            String mensajeError = "No se puede visualizar la informacion";
            request.setAttribute("mensaje", mensajeError);
            request.getRequestDispatcher("Vistas/ConsultarPerfilUsuario2.jsp").forward(request, response);
        }
        request.getRequestDispatcher("Vistas/ConsultarPerfilUsuario2.jsp").forward(request, response);
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
