/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

import java.io.File;

/**
 *
 * @author Ramon
 */
public class Fichero {
    private File path;
    
    public Fichero(){
        
    }
    
    public Fichero (File path){
        this.path = path;
    }
    
    public String getNombre(){
        return path.getName();
    }

    public File getPath() {
        return path;
    }

    public void setPath(File path) {
        this.path = path;
    }
    
    public String getTipo(){
        String nombre = path.getName();
        int pos = nombre.lastIndexOf('.');
        String tipo = "";
        if (pos != -1){
            tipo = nombre.substring(pos+1);
        }
        return tipo;
    }
    
    public long getLongitudFichero(){
        return path.length();
    }
}
