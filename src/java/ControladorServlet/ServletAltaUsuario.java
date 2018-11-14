package ControladorServlet;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import servicios.DtUsuario;
import servicios.PublicadorAltaUsuario;
import servicios.PublicadorAltaUsuarioService;
import servicios.PublicadorConsultarUsuario;
import servicios.PublicadorConsultarUsuarioService;

@MultipartConfig
@WebServlet(name = "ServletAltaUsuario", urlPatterns = {"/altaUsuarioServlet"})
public class ServletAltaUsuario extends HttpServlet {

    private PublicadorAltaUsuario port;
    private RegistroSitio RS = new RegistroSitio();
    configuracion conf = new configuracion();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void init() throws ServletException {

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext context;
        context = request.getServletContext();
        String ruta = context.getResource("").getPath();
        DtUsuario usuLogeado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + "/servicioAltaUsuario");
        PublicadorAltaUsuarioService webService = new PublicadorAltaUsuarioService(url);
        this.port = webService.getPublicadorAltaUsuarioPort();

        if (usuLogeado == null) {
            String browserDetails = request.getHeader("User-Agent");
            String IP = InetAddress.getLocalHost().getHostAddress();
            String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletAltaUsuario";
            RS.ObtenerRegistro(browserDetails, IP, URL);
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
        ServletContext context;
        context = request.getServletContext();
        String ruta = context.getResource("").getPath();
        DtUsuario usuLogeado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        URL url = new URL("http://" + conf.obtenerServer("servidor", ruta) + conf.leerProp("sConsultaUsuario", ruta));
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

        if (!pass.equals(pass2)) {
            request.setAttribute("malPass", "Sus contraseñas no coinciden");
            request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
            return;
        }
        SimpleDateFormat d = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date date = d.parse(fecha.toString());
            int edad = edad(date.toString());
            if (edad < 18) {
                request.setAttribute("menor", edad);
                request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
            }
        } catch (ParseException ex) {
            Logger.getLogger(ServletAltaUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }

        String hash = a.sha1(pass);
        byte[] bytes = null;
        String nombreArchivo = null;
        String extensionArchivo = null;
        final Part partImagen = request.getPart("imagen");
        if (partImagen.getSize() != 0) {
            InputStream data = partImagen.getInputStream();
            final String fileName = Utils.getFileName(partImagen);
            nombreArchivo = nick;
            extensionArchivo = Utils.extensionArchivo(fileName);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            int reads = data.read();
            while (reads != -1) {
                baos.write(reads);
                reads = data.read();
            } // while
            bytes = baos.toByteArray();
        }

        if (tipoP.equals("proponente")) {
            if (nombreArchivo != null) {
                ok = this.port.agregarUsuarioProponente(nick, nombre, apellido, correo, fecha, direccion, biografia, sitio, hash, bytes, nombreArchivo, extensionArchivo);
            } else {
                ok = this.port.agregarUsuarioProponente2(nick, nombre, apellido, correo, fecha, direccion, biografia, sitio, hash);
            }
            if (ok) {
                request.setAttribute("mensaje", "Se registro exitosamente");
                DtUsuario user = portCU.obtenerDtUsuario(nick);
                request.getSession().setAttribute("usuario_logueado", user);
            } else {
                request.setAttribute("mensaje", "Error al registrar este usuario");
            }
            request.getRequestDispatcher("/Vistas/altaUsuario.jsp").forward(request, response);
        } else {
            if (nombreArchivo != null) {
                ok = this.port.agregarUsuarioColaborador(nick, nombre, apellido, correo, fecha, hash, bytes, nombreArchivo, extensionArchivo);
            } else {
                ok = this.port.agregarUsuarioColaborador2(nick, nombre, apellido, correo, fecha, hash);
            }

            if (ok) {
                request.setAttribute("mensaje", "Se registro exitosamente");
                DtUsuario user = portCU.obtenerDtUsuario(nick);
                request.getSession().setAttribute("usuario_logueado", user);
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

    public int edad(String fecha_nac) {     //fecha_nac debe tener el formato dd/MM/yyyy

        Date fechaActual = new Date();
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        String hoy = formato.format(fechaActual);
        String[] dat1 = fecha_nac.split("/");
        String[] dat2 = hoy.split("/");
        int anos = Integer.parseInt(dat2[2]) - Integer.parseInt(dat1[2]);
        int mes = Integer.parseInt(dat2[1]) - Integer.parseInt(dat1[1]);
        if (mes < 0) {
            anos = anos - 1;
        } else if (mes == 0) {
            int dia = Integer.parseInt(dat2[0]) - Integer.parseInt(dat1[0]);
            if (dia > 0) {
                anos = anos - 1;
            }
        }
        return anos;
    }

}
