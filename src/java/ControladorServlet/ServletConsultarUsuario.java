package ControladorServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Clases.DtColaboraciones;
import logica.Clases.DtUsuario;
import logica.Clases.DtinfoColaborador;
import logica.Clases.DtinfoPropuesta;
import logica.Fabrica;
import logica.Interfaces.IControladorUsuario;
import logica.Interfaces.IPropCat;

/**
 *
 * @author gabri
 */
@WebServlet("/ServletConsultarUsuario")
public class ServletConsultarUsuario extends HttpServlet {

    IControladorUsuario ICU;
    IPropCat ICP;

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
        response.setContentType("text/html;charset=UTF-8");
        ICU = Fabrica.getInstance().getIControladorUsuario();
        if (ICU.getUsuarios().isEmpty()) {
            request.setAttribute("mensaje", "No existen usuarios en el sistema");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
        }
        List<DtUsuario> usuarios = ICU.ListarUsuarios();
        request.setAttribute("Usuarios", usuarios);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ICU = Fabrica.getInstance().getIControladorUsuario();
        ICP = Fabrica.getInstance().getControladorPropCat();
        String nickname = request.getParameter("nick");
        DtUsuario dtu = ICU.ObtenerDTUsuario(nickname);
        List<DtUsuario> seguidos = ICU.ObtenerSeguidos(nickname);
        List<DtUsuario> seguidores = ICU.ObtenerSeguidores(nickname);
        List<DtinfoPropuesta> favoritas = ICU.obtenerfavoritas(nickname);
        request.setAttribute("Seguidos", seguidos);
        request.setAttribute("Seguidores", seguidores);
        request.setAttribute("Usuario", dtu);
        request.setAttribute("Favoritas", favoritas);
        ICP = Fabrica.getInstance().getControladorPropCat();

        DtUsuario nick = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

        if (dtu.Esproponente()) {
            List<DtinfoPropuesta> propuestas = ICP.ListarPropuestasNoIngresadas(nickname);
            request.setAttribute("Propuestas", propuestas);
            if (nick != null) {
                if (dtu.getNickName().equals(nick.getNickName())) {
                    List<DtinfoPropuesta> propuestasing = ICP.ListarPropuestasDeProponenteX(nickname);
                    request.setAttribute("Propuestas2", propuestasing);
                }
            }
        } else {

            List<DtinfoPropuesta> colaboraciones = ICU.verPropuestas(nickname);
            DtinfoColaborador dtc = Fabrica.getInstance().getIControladorUsuario().getDtColaborador(nickname);
            List<DtColaboraciones> monto = ICU.getMontoColaboracion(dtc);
            request.setAttribute("Colaborador", monto);
            request.setAttribute("Colaboraciones", colaboraciones);
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
