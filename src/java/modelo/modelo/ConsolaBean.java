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
        ConsolaJpaController cjc = new 
            ConsolaJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        return cjc.findConsolaEntities();
    }
    
    public Consola buscarConsola(long id) {
        ConsolaJpaController cjc = new 
            ConsolaJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        return cjc.findConsola(id);
    }
    
    public void actualizarConsola(Consola consola) throws Exception {
        ConsolaJpaController cjc = new 
            ConsolaJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        cjc.edit(consola);
    }
    
    public void eliminarConsola(long id) throws Exception {
        ConsolaJpaController cjc = new
            ConsolaJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        cjc.destroy(id);
    }
}
