/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Clases.DtConsultaPropuesta;
import logica.Clases.DtUsuario;
import logica.Clases.TipoRetorno;
import logica.Fabrica;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletAltaPropuest", urlPatterns = {"/ServletAltaPropuesta"})
public class ServletAltaPropuesta extends HttpServlet {

    public static final String MENSAJE_ERROR = "mensaje_error";
    public static final String MENSAJE_EXITO = "mensaje_exito";
    private String MENSAJE;

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

        DtUsuario usuLogeado = (DtUsuario) request.getAttribute("usuario_logueago");

        if (usuLogeado.Esproponente()) {
            List<String> listCat = Fabrica.getInstance().getControladorPropCat().ListarCategorias();
            request.setAttribute("listCat", listCat);
            request.getRequestDispatcher("Vistas/AltaPropuesta.jsp").forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        String titulo = request.getParameter("TituloP");
        String lugar = request.getParameter("LugarP");
        String desc = request.getParameter("Descripcion");
        String cat = request.getParameter("Categoria");

        float montoT = Float.parseFloat(request.getParameter("MontoT"));
        float montoE = Float.parseFloat(request.getParameter("MontoE"));

        String fechaR = (request.getParameter("FechaR") == null ? "" : request.getParameter("FechaR"));
        Calendar fecha = this.dateToCalendar(ParseFecha(fechaR));

        try {
            DtUsuario dtLogeado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

            boolean encontrado = Fabrica.getInstance().getControladorPropCat().seleccionarUC(dtLogeado.getNickName(), cat);

            if (!encontrado) {
                boolean ok = Fabrica.getInstance().getControladorPropCat().crearPropuesta(titulo, desc, lugar, cat, fecha, montoE, montoT, TipoRetorno.EntGan);
                MENSAJE = "Se registro exitosamente";
                request.setAttribute("mensaje", MENSAJE);
                request.getRequestDispatcher("/Vistas/FuncionamientoCorrecto.jsp").forward(request, response);
            }

        } catch (ExceptionInInitializerError | Exception a) {
            String mensajeError = "La propuesta no pudo ser dada de alta";
            request.setAttribute("mensaje", mensajeError);
            request.getRequestDispatcher("/Vistas/FuncionamientoCorrecto.jsp").forward(request, response);
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

    private Calendar dateToCalendar(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar;
    }

    public Date ParseFecha(String fecha) {
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaDate = new Date();
        try {
            fechaDate = formato.parse(fecha);
        } catch (ParseException ex) {
            System.out.println(ex);
        }
        return fechaDate;
    }
}
