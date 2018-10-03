/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
    
        if (request.getSession().getAttribute("usuario_logueado") == null) {
            request.setAttribute("mensaje", "No existe una sesion en el sistema");
            request.getRequestDispatcher("/Vistas/Mensaje_Recibido.jsp").forward(request, response);
        } 
        else{
        List<DtUsuario> lista = ICU.ListarUsuarios();
        request.setAttribute("usuarios", lista);
        request.getRequestDispatcher("Vistas/SeguirUsuario.jsp").forward(request, response);}
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
                        
                        if(accion!=null){
			if (accion.equals("seguir")) {
                            try {
                               ICU.seguirUsuario(seguidor, seguido); 
                               request.setAttribute("solicitudseguir", "Usuario Seguido con Exito!!!");
                            } catch (Exception ex) {
                                Logger.getLogger(SeguirUsuario.class.getName()).log(Level.SEVERE, null, ex);
                                request.setAttribute("solicitudseguir", ex.getMessage());
                            }
                                                     
                            
			} 
                        
                        else if (accion.equals("dejarseguir")){
                            try {
                                ICU.dejarseguirUsuario(seguidor, seguido);
                                request.setAttribute("solicitudseguir", "Finalizacion de Seguimineto realizada con Exito!!!");
                            } catch (Exception ex) {
                                Logger.getLogger(SeguirUsuario.class.getName()).log(Level.SEVERE, null, ex);
                                request.setAttribute("solicitudseguir", ex.getMessage());
                            }

			}
                                processRequest(request, response);
                        }
                        
                        else if (request.getParameter("BuscarUsu") != null) {
                        List<DtUsuario> lista = ICU.ListarUsuarios();
                        ArrayList<DtUsuario> retorno = new ArrayList<>();
                        for (int i = 0; i < lista.size(); i++) {
                            if (lista.get(i).getNickName().contains(request.getParameter("BuscarUsu"))) {
                                retorno.add(new DtUsuario(lista.get(i).getNickName(), lista.get(i).getNombre(),lista.get(i).getApellido()
                                , lista.get(i).getCorreo(), lista.get(i).getFechaN(), lista.get(i).getImagen(), lista.get(i).getPassword(), lista.get(i).Esproponente()));
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
