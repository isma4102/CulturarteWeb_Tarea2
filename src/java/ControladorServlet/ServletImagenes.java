/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Clases.DtUsuario;
import logica.Clases.DtinfoPropuesta;
import logica.Fabrica;
import logica.Interfaces.IControladorUsuario;
import logica.Interfaces.IPropCat;

/**
 *
 * @author Santiago.S
 */
@WebServlet(name = "ServletImagenes", urlPatterns = {"/ServletImagenes"})
public class ServletImagenes extends HttpServlet {

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
        IControladorUsuario ICU = Fabrica.getInstance().getIControladorUsuario();
        IPropCat IPC = Fabrica.getInstance().getControladorPropCat();
        if (request.getParameter("TituloP") != null) {
            String ruta = getServletContext().getRealPath("/");
            String[] parte = ruta.split("CulturarteWeb_Tarea2");
            String tarea1 = parte[0] + "culturarte" + File.separator;
            BufferedImage bi = null;
            DtinfoPropuesta propuesta = IPC.RetornarPropuestaR(request.getParameter("TituloP"));
            try {
                bi = ImageIO.read(new File(tarea1 + "fPropuestas\\" + request.getParameter("TituloP") + "\\" + propuesta.getImagen()));
            } catch (IOException e) {
                bi = ImageIO.read(new File(tarea1 + "fPropuestas" + "\\" + "Culturarte.png"));
            }
            OutputStream out = response.getOutputStream();
            ImageIO.write(bi, "png", out);
            out.close();
        } else if (request.getParameter("nickname") != null) {
            String ruta = getServletContext().getRealPath("/");
            String[] parte = ruta.split("CulturarteWeb_Tarea2");
            String tarea1 = parte[0] + "culturarte" + File.separator;
            BufferedImage bi = null;
            DtUsuario usuario = ICU.ObtenerDTUsuario(request.getParameter("nickname"));
            try {
                bi = ImageIO.read(new File(tarea1 + "fPerfiles\\" + usuario.getCorreo() + "\\" + usuario.getImagen()));
            } catch (IOException e) {
                bi = ImageIO.read(new File(tarea1 + "fPerfiles" + "\\" + "nadie.png"));
            }
            OutputStream out = response.getOutputStream();
            ImageIO.write(bi, "png", out);
            out.close();
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
