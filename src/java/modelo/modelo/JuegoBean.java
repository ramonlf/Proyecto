/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

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
}
