/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladorServlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.swing.JOptionPane;

/**
 *
 * @author Lucas
 */
public class configuracion {

    public String obtenerServer(String caso, String ruta) throws IOException {
        Properties prop = new Properties();
        InputStream archivo;
        ruta = ruta.replace("%", " ");
        ruta = ruta.replace("20", "");
        ruta = this.recortarRuta(ruta);

        ruta = ruta + "config.properties";
        try {
            archivo = new FileInputStream(ruta);
            prop.load(archivo);
        } catch (IOException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
        String rutaLarga = prop.getProperty("Ip")+":"+prop.getProperty("Porth");
        return rutaLarga;
    }

    public String recortarRuta(String ruta) {
        String recortada = null;
        String[] partes;
        partes = ruta.split("/");
        int parts = partes.length;//commit
        for (int i = 1; i < parts; i++) {
            if (i == 1) {
                recortada = partes[i] + "/";
            } else {
                recortada = recortada + partes[i] + "/";
            }
        }
        return recortada;
    }

}
