package ControladorServlet;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.sun.org.apache.xerces.internal.jaxp.datatype.XMLGregorianCalendarImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import servicios.DataImagen;
import servicios.DtUsuario;
import servicios.PublicadorAltaUsuario;
import servicios.PublicadorAltaUsuarioService;
import servicios.PublicadorConsultarUsuario;
import servicios.PublicadorConsultarUsuarioService;

@MultipartConfig
@WebServlet(name = "ServletAltaUsuario", urlPatterns = {"/altaUsuarioServlet"})
public class ServletAltaUsuario extends HttpServlet {

    private PublicadorAltaUsuario port;

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
        URL url = new URL("http://127.0.0.1:8280/servicioAltaUsuario");
        PublicadorAltaUsuarioService webService = new PublicadorAltaUsuarioService(url);
        this.port = webService.getPublicadorAltaUsuarioPort();

        DtUsuario usuLogeado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

        if (usuLogeado == null) {
            request.getRequestDispatcher("Vistas/altaUsuario.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "Ya existe una sesion en el sistema");
            request.getRequestDispatcher("Vistas/Mensaje_Recibido.jsp").forward(request, response);
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
        try {
            URL url = new URL("http://127.0.0.1:8280/servicioConsultarU");
            PublicadorConsultarUsuarioService webService = new PublicadorConsultarUsuarioService(url);
            PublicadorConsultarUsuario portCU = webService.getPublicadorConsultarUsuarioPort();

            codificador a = new codificador();

            Boolean ok = false;
            String nick = request.getParameter("nick");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String pass = request.getParameter("pass");
            String fecha = request.getParameter("fecha");
            String pass2 = request.getParameter("pass2");
            String direccion = request.getParameter("direccion");
            String sitio = request.getParameter("sitio");
            String biografia = request.getParameter("biografia");
            String tipoP = request.getParameter("tipoP");

            GregorianCalendar cal = new GregorianCalendar();
            cal.setTime(ParseFecha(fecha));
            XMLGregorianCalendar fechaxml = DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);

            if (!pass.equals(pass2)) {
                request.setAttribute("malPass", "Sus contraseñas no coinciden");
                request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
                return;
            }
            String hash = a.sha1(pass);
            DataImagen imagen = null;
            final Part partImagen = request.getPart("imagen");
            if (partImagen.getSize() != 0) {
                InputStream data = partImagen.getInputStream();
                final String fileName = Utils.getFileName(partImagen);
                String nombreArchivo = nick;
                String extensionArchivo = Utils.extensionArchivo(fileName);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                int reads = data.read();
                while (reads != -1) {
                    baos.write(reads);
                    reads = data.read();
                } // while
                byte[] bytes = baos.toByteArray();
                imagen = new DataImagen();
                imagen.setStream(bytes);
                imagen.setExtensionArchivo(extensionArchivo);
                imagen.setNombreArchivo(nombreArchivo);
            }
            if (tipoP.equals("proponente")) {
                ok = this.port.agregarUsuarioProponente(nick, nombre, apellido, correo, fechaxml, imagen, direccion, biografia, sitio, hash);
                if (ok) {
                    request.setAttribute("mensaje", "Se registro exitosamente");
                    DtUsuario user = portCU.obtenerDtUsuario(nick);
                    request.getSession().setAttribute("usuario_logueado", user);
                } else {
                    request.setAttribute("mensaje", "Error al registrar este usuario");
                }
                request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
            } else {
                ok = this.port.agregarUsuarioColaborador(nick, nombre, apellido, correo, fechaxml, imagen, hash);
                if (ok) {
                    request.setAttribute("mensaje", "Se registro exitosamente");
                    DtUsuario user = portCU.obtenerDtUsuario(nick);
                    request.getSession().setAttribute("usuario_logueado", user);
                } else {
                    request.setAttribute("mensaje", "Error al dar registrar este usuario");
                }
                request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
            }
        } catch (DatatypeConfigurationException ex) {
            Logger.getLogger(ServletAltaUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
