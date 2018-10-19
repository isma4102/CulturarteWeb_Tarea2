/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtUsuario;
import servicios.PublicadorConsultarUsuario;
import servicios.PublicadorConsultarUsuarioService;

/**
 *
 * @author PabloDesk
 */
@WebServlet(name = "SeguirUsuario", urlPatterns = {"/SeguirUsuario"})
public class SeguirUsuario extends HttpServlet {
    private PublicadorConsultarUsuario port;
    private static final long serialVersionUID = 1L;

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
        response.setContentType("text/html;charset=UTF-8");
        URL url = new URL("http://127.0.0.1:8280/servicioConsultarU");
        PublicadorConsultarUsuarioService webService = new PublicadorConsultarUsuarioService(url);
        this.port = webService.getPublicadorConsultarUsuarioPort();

        if (request.getSession().getAttribute("usuario_logueado") == null) {
            request.setAttribute("mensaje", "No existe una sesion en el sistema");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
        } else {
            List<DtUsuario> lista = this.port.listarUsuarios().getLista();
            request.setAttribute("usuarios", lista);
            request.getRequestDispatcher("Vistas/SeguirUsuario.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DtUsuario usuario = Login.getUsuarioSesion(request);

        if (usuario != null) {
            String seguidor = usuario.getNickname();
            String seguido = request.getParameter("seguido");
            String accion = request.getParameter("accion");

            if (accion != null) {
                if (accion.equals("seguir")) {
                    try {
                        this.port.seguirUsuario(seguidor, seguido);
                        request.setAttribute("solicitudseguir", "Usuario Seguido con Exito!!!");
                    } catch (Exception ex) {
                        Logger.getLogger(SeguirUsuario.class.getName()).log(Level.SEVERE, null, ex);
                        request.setAttribute("solicitudseguir", ex.getMessage());
                    }

                } else if (accion.equals("dejarseguir")) {
                    try {
                        this.port.dejarSeguirUsuario(seguidor, seguido);
                        request.setAttribute("solicitudseguir", "Finalizacion de Seguimineto realizada con Exito!!!");
                    } catch (Exception ex) {
                        Logger.getLogger(SeguirUsuario.class.getName()).log(Level.SEVERE, null, ex);
                        request.setAttribute("solicitudseguir", ex.getMessage());
                    }

                }
                processRequest(request, response);
            } else if (request.getParameter("BuscarUsu") != null) {
                List<DtUsuario> lista = this.port.listarUsuarios().getLista();
                ArrayList<DtUsuario> retorno = new ArrayList<>();
                for (int i = 0; i < lista.size(); i++) {
                    if (lista.get(i).getNickname().contains(request.getParameter("BuscarUsu"))) {
                        retorno.add(lista.get(i));
                    }
                }
                if (!retorno.isEmpty()) {
                    request.setAttribute("usuarios", retorno);
                    request.getRequestDispatcher("/Vistas/SeguirUsuario.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensaje", "Ese Usuario no existe en el sistema");
                    request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);

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
