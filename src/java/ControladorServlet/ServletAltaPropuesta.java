/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import servicios.DtUsuario;
import servicios.PublicadorAltaPropuesta;
import servicios.PublicadorAltaPropuestaService;

/**
 *
 * @author Martin
 */
@WebServlet(name = "ServletAltaPropuest", urlPatterns = {"/ServletAltaPropuesta"})
@MultipartConfig
public class ServletAltaPropuesta extends HttpServlet {

    public static final String MENSAJE_ERROR = "mensaje_error";
    public static final String MENSAJE_EXITO = "mensaje_exito";
    private String MENSAJE;
    private PublicadorAltaPropuesta port;
    private RegistroSitio RS = new RegistroSitio();

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
        configuracion conf = new configuracion();
        ServletContext context;
        context = request.getServletContext();
        String ruta = context.getResource("").getPath();

        URL url = new URL("http://"+conf.obtenerServer("servidor", ruta)+"/servicioAltaP");
        PublicadorAltaPropuestaService webService = new PublicadorAltaPropuestaService(url);
        this.port = webService.getPublicadorAltaPropuestaPort();

        DtUsuario usuLogeado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
        if (usuLogeado == null) {
            request.getRequestDispatcher("iniciar-sesion").forward(request, response);
        } else {
            if (usuLogeado.isEsproponente()) {
                SimpleDateFormat fechaA = new SimpleDateFormat("yyyy-MM-dd");
                String fActual = fechaA.format(new Date());
                request.setAttribute("FechaActual", fActual);

                List<String> listCat = this.port.listarCategorias().getListCategoria();
                request.setAttribute("listCat", listCat);
                String browserDetails = request.getHeader("User-Agent");
                String IP = InetAddress.getLocalHost().getHostAddress();
                String URL = "http://" + RS.obtenerIP() + "/CulturarteWeb/ServletAltaPropuesta";
                RS.ObtenerRegistro(browserDetails, IP, URL);
                request.getRequestDispatcher("Vistas/AltaPropuesta.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", "Usted no tiene permiso para crear una propuesta");
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
        String tipoR = request.getParameter("TipoR");
        float montoT = Float.parseFloat(request.getParameter("MontoT"));
        float montoE = Float.parseFloat(request.getParameter("MontoE"));
        String fechaR = (request.getParameter("FechaR") == null ? "" : request.getParameter("FechaR"));

        final Part partImagen = request.getPart("imagen");

        if (partImagen.getSize() != 0) {
            InputStream data = partImagen.getInputStream();
            final String fileName = Utils.getFileName(partImagen);
            String nombreArchivo = titulo;
            String extensionArchivo = Utils.extensionArchivo(fileName);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            int reads = data.read();
            while (reads != -1) {
                baos.write(reads);
                reads = data.read();
            }
            byte[] bytes = baos.toByteArray();
        }

        try {
            DtUsuario dtLogeado = (DtUsuario) request.getSession().getAttribute("usuario_logueado");

            boolean encontrado = port.seleccionarUC(dtLogeado.getNickname(), cat);

            if (!encontrado) {
                boolean ok = port.crearPropuesta(titulo, desc, lugar, fechaR, montoE, montoT, tipoR);
                if (ok) {
                    MENSAJE = "Se registro exitosamente";
                    request.setAttribute("mensaje", MENSAJE);
                } else {
                    MENSAJE = "No se pudo registrar";
                    request.setAttribute("mensaje", MENSAJE);
                }
                request.getRequestDispatcher("/Vistas/FuncionamientoCorrecto.jsp").forward(request, response);
            }
        } catch (ExceptionInInitializerError | Exception a) {
            String mensajeError = "La propuesta no pudo ser dada de alta";
            request.setAttribute("mensaje", a.getMessage());
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
}
