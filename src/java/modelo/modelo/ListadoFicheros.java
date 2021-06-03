/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author Ramon
 */
public class ListadoFicheros {
     public ListadoFicheros(){
        
    }
    
    private String path;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    
    public List<Fichero> getFicheros(){
        File[] files = new File (path).listFiles();
        List<Fichero> ficheros = new ArrayList();
        for (File f : files){
            ficheros.add(new Fichero(f));
        }
        return ficheros;
    }
    
    public List<Fichero> getFicherosOrdenadosPorNombre(){
        List<Fichero> ficheros = getFicheros();
        Collections.sort(ficheros,
                (a,b) -> a.getNombre().compareTo(b.getNombre()));
        return ficheros;
    } 
}
