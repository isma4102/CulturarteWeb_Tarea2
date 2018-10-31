/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import static java.lang.Math.log;
import java.net.MalformedURLException;
import java.net.URL;
import servicios.DtListConsultaPropuesta;
import servicios.DtListPropuestaWeb;
import servicios.Exception_Exception;
import servicios.PublicadorInicio;
import servicios.PublicadorInicioService;

/**
 *
 * @author gabri
 */
public class RegistroSitio {

    private String ip;
    private String navegador;
    private String sitio;
    private String SO;
    private PublicadorInicioService PI;
    private PublicadorInicio port;

    public RegistroSitio() {
        this.SO = "";
        this.navegador = "";
        this.sitio = "";
        this.ip = "";
        PI = new PublicadorInicioService();
        port = PI.getPublicadorInicioPort();
    }

    public String getIp() {
        return ip;
    }

    public String getNave() {
        return navegador;
    }

    public String getSitio() {
        return sitio;
    }

    public String getSO() {
        return SO;
    }

    public void ObtenerRegistro(String browserDetails, String IP, String URL) {
        this.ip = IP;
        this.sitio = URL;
        String userAgent = browserDetails;
        String user = userAgent.toLowerCase();

        String os = "";
        String browser = "";

        if (userAgent.toLowerCase().indexOf("windows") >= 0) {
            os = "Windows";
        } else if (userAgent.toLowerCase().indexOf("mac") >= 0) {
            os = "Mac";
        } else if (userAgent.toLowerCase().indexOf("x11") >= 0) {
            os = "Unix";
        } else if (userAgent.toLowerCase().indexOf("android") >= 0) {
            os = "Android";
        } else if (userAgent.toLowerCase().indexOf("iphone") >= 0) {
            os = "IPhone";
        } else {
            os = "UnKnown, More-Info: " + userAgent;
        }
        //===============Browser===========================
        if (user.contains("msie")) {
            String substring = userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
            browser = substring.split(" ")[0].replace("MSIE", "IE") + "-" + substring.split(" ")[1];
        } else if (user.contains("safari") && user.contains("version")) {
            browser = (userAgent.substring(userAgent.indexOf("Safari")).split(" ")[0]).split("/")[0] + "-" + (userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
        } else if (user.contains("opr") || user.contains("opera")) {
            if (user.contains("opera")) {
                browser = (userAgent.substring(userAgent.indexOf("Opera")).split(" ")[0]).split("/")[0] + "-" + (userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
            } else if (user.contains("opr")) {
                browser = ((userAgent.substring(userAgent.indexOf("OPR")).split(" ")[0]).replace("/", "-")).replace("OPR", "Opera");
            }
        } else if (user.contains("chrome")) {
            browser = (userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1) || (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1)) {
            //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
            browser = "Netscape-?";

        } else if (user.contains("firefox")) {
            browser = (userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
        } else if (user.contains("rv")) {
            browser = "IE-" + user.substring(user.indexOf("rv") + 3, user.indexOf(")"));
        } else {
            browser = "UnKnown, More-Info: " + userAgent;
        }
        this.SO = os;
        this.navegador = browser;

        port.agregarRegistro(ip, navegador, sitio, SO);

    }

    public String obtenerIP() throws MalformedURLException {
        return port.leerPropiedades("Ip");
    }
}
