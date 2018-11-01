/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.swing.JOptionPane;

/**
 *
 * @author Lucas
 */
public class configuracion {

    public String obtenerServer(String caso, String ruta) {
        Properties prop = new Properties();
        InputStream archivo = null;
        String rutaRecortada = recortarRuta(ruta);
        rutaRecortada=rutaRecortada+"/config/config.properties";
        try {
            archivo = new FileInputStream(rutaRecortada);
            prop.load(archivo);
        } catch (IOException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
        String rutaLarga = prop.getProperty(caso);
        return rutaLarga;
    }

    public String recortarRuta(String ruta) {
        String recortada;
        String[] partes;
        partes = ruta.split("/");
        recortada=partes[1]+"/"+partes[2]+"/"+partes[3]+"/"+partes[4]+"/"+partes[5]+"/"+partes[6];
        return recortada;
    }

}
