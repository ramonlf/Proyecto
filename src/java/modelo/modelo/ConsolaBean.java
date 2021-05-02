/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

import java.util.List;
import javax.persistence.Persistence;
import modelo.entidades.Consola;
import modelo.entidades.ConsolaJpaController;

/**
 *
 * @author Ramon
 */
public class ConsolaBean {
    public static final String PERSISTENCIA = "ProyectoFinalPU";        
    public void añadirConsola(Consola cmp) throws Exception{
        ConsolaJpaController cjc = new ConsolaJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        cjc.create(cmp);
    }   
    public List<Consola> getConsolas() {
        ConsolaJpaController pjc = new 
            ConsolaJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        return pjc.findConsolaEntities();
    }
}
