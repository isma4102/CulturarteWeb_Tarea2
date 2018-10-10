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
import logica.Clases.DtNickTitProp;
import logica.Clases.DtUsuario;
import logica.Fabrica;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletCancelarPropuesta", urlPatterns = {"/ServletCancelarPropuesta"})
public class ServletCancelarPropuesta extends HttpServlet {

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

        DtUsuario usuLogueado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        if (usuLogueado == null) {
            request.setAttribute("mensaje", "No existe una sesion en el sistema");
            request.getRequestDispatcher("Vistas/Mensaje_Recibido.jsp").forward(request, response);
        } else {
            if (usuLogueado.Esproponente()) {
                List<DtNickTitProp> list = Fabrica.getInstance().getControladorPropCat().ListarPropuestasCancelar(usuLogueado.getNickName());
                request.setAttribute("Lista", list);
                request.getRequestDispatcher("Vistas/CancelarPropuesta.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", "Solo los proponentes pueden entrar");
                 request.getRequestDispatcher("Vistas/Mensaje_Recibido.jsp").forward(request, response);
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

        String tit = request.getParameter("TituloP");
        String titulo = new String(tit.getBytes("ISO-8859-1"), "UTF-8");
        DtUsuario proponente = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

        boolean ok = Fabrica.getInstance().getControladorPropCat().CancelarPropuesta(tit, proponente.getNickName());

        if (ok) {
            request.setAttribute("mensaje", "Se cancelo con exito la propuesta");
        } else {
            request.setAttribute("mensaje", "La propuesta no pudo ser cancelada");
        }

        request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);

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
