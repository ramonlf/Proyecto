/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.persistence.Persistence;
import modelo.entidades.Juego;
import modelo.entidades.JuegoJpaController;

/**
 *
 * @author Ramon
 */
public class JuegoBean {

    public static final String PERSISTENCIA = "ProyectoFinalPU";

    public void añadirJuego(Juego jmp) throws Exception {
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        jjc.create(jmp);
    }

    public List<Juego> getJuegos() {
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        return jjc.findJuegoEntities();
    }

    public Juego buscarJuego(long id) {
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        return jjc.findJuego(id);
    }

    public void actualizarJuego(Juego juego) throws Exception {
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        jjc.edit(juego);
    }
    
    public void eliminarJuego(long id)throws Exception{
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        jjc.destroy(id);
    }
    
    public List<Juego> getJuegoConsola(){
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
 
        long numero = 4;

        return jjc.findJuegoEntities((int) numero, 0);
    }
    
    public List<Juego> getJuegosRecientes(){
        int numero = 4;
        
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        List<Juego> juego = jjc.findJuegoEntities();
        List<Juego> ordenar = new ArrayList();
        Collections.sort(juego, (j1, j2) -> (j1.getFechaLanzamiento().compareTo(j2.getFechaLanzamiento())));
        for(int i = juego.size() - 1; i >= 0 ; i-- ){
            ordenar.add(juego.get(i));
        }
        List<Juego> aux = new ArrayList(); 
        if(ordenar.size() < numero){
            for(Juego jue : ordenar){
                aux.add(jue);
            }
        }else{
            for(int i = 0; i < numero; i++){
                aux.add(ordenar.get(i));
            }
        }
                      
        return aux;
    }
    
    public List<Juego> getJuegosAlfabeticos(){
        int numero = 4;
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        List<Juego> juego = jjc.findJuegoEntities();
         Collections.sort(juego, (j1, j2) -> (j1.getNombre().compareTo(j2.getNombre())));
         
         List<Juego> aux = new ArrayList(); 
        if(juego.size() < numero){
            for(Juego jue : juego){
                aux.add(jue);
            }
        }else{
            for(int i = 0; i < numero; i++){
                aux.add(juego.get(i));
            }
        }
        return aux;
    }
}
