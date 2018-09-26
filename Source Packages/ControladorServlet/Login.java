package ControladorServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clases.EstadoSesion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Clases.DtUsuario;
import logica.Clases.Usuario;
import logica.Fabrica;
import logica.Interfaces.IControladorUsuario;

/**
 *
 * @author PabloDesk
 */

@WebServlet("/iniciar-sesion")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Fabrica fabrica=Fabrica.getInstance();
    IControladorUsuario ICU= fabrica.getIControladorUsuario();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @return 
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static DtUsuario getUsuarioSesion(HttpServletRequest request)
	{
            Fabrica fabrica=Fabrica.getInstance();
                        IControladorUsuario ICU= fabrica.getIControladorUsuario();
		return ICU.ObtenerDTUsuario(
				(String) request.getSession().getAttribute("usuario_logueado")
			);
       
	}
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/iniciarSesion.jsp");
        dispatcher.forward(request, response);
        
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
        HttpSession objSesion = request.getSession();
        String login = request.getParameter("login");
        String password = request.getParameter("pass");
        EstadoSesion nuevoEstado;
        
        // chequea contraseña
//		try {
                      

                        
			DtUsuario usr = ICU.ObtenerDTUsuario(login);
			if(usr.getPassword().compareTo(password)!=0)
				nuevoEstado = EstadoSesion.LOGIN_INCORRECTO;
			else {
				nuevoEstado = EstadoSesion.LOGIN_CORRECTO;
//				 setea el usuario logueado
				request.getSession().setAttribute("usuario_logueado", usr);
			}
//		} catch(UsuarioNoEncontrado ex){
//			nuevoEstado = EstadoSesion.LOGIN_INCORRECTO;
//		}
		
        objSesion.setAttribute("estado_sesion", nuevoEstado);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.html");
        dispatcher.forward(request, response);
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
