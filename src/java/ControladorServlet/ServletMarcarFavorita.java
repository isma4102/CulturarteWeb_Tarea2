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
import logica.Clases.DtUsuario;
import logica.Clases.DtinfoPropuesta;
import logica.Fabrica;
import logica.Interfaces.IPropCat;

/**
 *
 * @author gabri
 */
@WebServlet(name = "ServletMarcarFavorita", urlPatterns = {"/ServletMarcarFavorita"})
public class ServletMarcarFavorita extends HttpServlet {

    IPropCat IPC;

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

        DtUsuario usuLogeado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        if (usuLogeado != null) {
            response.setContentType("text/html;charset=UTF-8");
            IPC = Fabrica.getInstance().getControladorPropCat();
            if(IPC.getPropuestas().isEmpty()){
                request.setAttribute("mensaje", "No existen propuestas en el sistema");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
            }
            List<DtinfoPropuesta> propuestas = IPC.ListarPropuestaNOI();
            request.setAttribute("Propuestas", propuestas);
            request.getRequestDispatcher("Vistas/MarcarFavorita.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("Vistas/Inicio.jsp").forward(request, response);
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
        String titulo = (String) request.getParameter("TituloP");
        DtUsuario nick = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        Boolean exito = IPC.AgregarFavorita(titulo, nick.getNickName());
        if (exito) {
            request.setAttribute("favorito", "Propuesta marcada como favorita");
        } else {
            request.setAttribute("favorito", "No se pudo marcar propuesta como favorita");
        }
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
