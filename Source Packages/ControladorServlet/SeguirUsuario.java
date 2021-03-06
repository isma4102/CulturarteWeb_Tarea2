/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Clases.DtUsuario;
import logica.Fabrica;
import logica.Interfaces.IControladorUsuario;

/**
 *
 * @author PabloDesk
 */
@WebServlet(name = "SeguirUsuario", urlPatterns = {"/SeguirUsuario"})
public class SeguirUsuario extends HttpServlet {
private static final long serialVersionUID = 1L;
    Fabrica fabrica=Fabrica.getInstance();
    IControladorUsuario ICU= fabrica.getIControladorUsuario();
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
        ICU.CargarUsuarios(); 
       List<DtUsuario> lista = ICU.ListarUsuarios();
       request.setAttribute("usuarios", lista);
        
       List<DtUsuario> lista2 = ICU.ListarProponentes2();
        request.setAttribute("usuarios", lista);
        
        request.getRequestDispatcher("Vistas/SeguirUsuario.jsp").forward(request, response);
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
			String seguidor = usuario.getNickName();
			String seguido = request.getParameter("seguido");
                        String accion = request.getParameter("accion");
                        
			if (accion.equals("seguir")) {
                            try {
                                ICU.seguirUsuario(seguidor, seguido);
                            } catch (Exception ex) {
                                Logger.getLogger(SeguirUsuario.class.getName()).log(Level.SEVERE, null, ex);
                            }
			} else {
                            try {
                                ICU.dejarseguirUsuario(seguidor, seguido);
                            } catch (Exception ex) {
                                Logger.getLogger(SeguirUsuario.class.getName()).log(Level.SEVERE, null, ex);
                            }
			}
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
