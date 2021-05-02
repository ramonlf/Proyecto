/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

import javax.persistence.Persistence;
import modelo.entidades.Juego;
import modelo.entidades.JuegoJpaController;

/**
 *
 * @author Ramon
 */
public class JuegoBean {
    public static final String PERSISTENCIA = "ProyectoFinalPU";
    public void añadirJuego(Juego jmp) throws Exception{
        JuegoJpaController jjc = new JuegoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        jjc.create(jmp);
    }
}
