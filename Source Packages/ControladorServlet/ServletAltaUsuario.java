package ControladorServlet;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.Interfaces.IControladorUsuario;

@WebServlet(name = "ServletAltaUsuario", urlPatterns = {"/altaUsuarioServlet"})

public class ServletAltaUsuario extends HttpServlet {

    IControladorUsuario iUsuario;

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
        request.getRequestDispatcher("Vistas/altaUsuario.jsp").forward(request, response);
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

        iUsuario = Fabrica.getInstance().getIControladorUsuario();
        Boolean ok = false;
        String nick = request.getParameter("nick");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String pass = request.getParameter("pass");
        String fecha = (request.getParameter("fecha") == null ? "" : request.getParameter("fecha"));
        String pass2 = request.getParameter("pass2");
        String direccion = request.getParameter("direccion");
        String sitio = request.getParameter("sitio");
        String biografia = request.getParameter("biografia");
        String tipoP = request.getParameter("tipoP");
        String imagen = "";
        Date nacimiento = ParseFecha(fecha);
        Calendar cal = dateToCalendar(nacimiento);
        if (!pass.equals(pass2)) {
            request.setAttribute("malPass", "Sus contraseñas no coinciden");
            request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
            return;
        }

        if (tipoP.equals("proponente")) {

            ok = iUsuario.AgregarUsuarioProponente(nick, nombre, apellido, correo, cal, imagen, direccion, biografia, sitio, pass);
            if (ok) {
                request.setAttribute("mensaje", "Se registro exitosamente");
            } else {
                request.setAttribute("mensaje", "Error al registrar este usuario");
            }
            request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
        } else {
            ok = iUsuario.AgregarUsuarioColaborador(nick, nombre, apellido, correo, cal, imagen, pass);
            if (ok) {
                request.setAttribute("mensaje", "Se registro exitosamente");
            } else {
                request.setAttribute("mensaje", "Error al dar registrar este usuario");
            }
            request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
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
