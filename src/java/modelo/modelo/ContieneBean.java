/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

import javax.persistence.Persistence;
import modelo.entidades.Contiene;
import modelo.entidades.ContieneJpaController;

/**
 *
 * @author Ramon
 */
public class ContieneBean {
    public static final String PERSISTENCIA = "ProyectoFinalPU";  
    public void crearContiene(Contiene cmp) throws Exception{
        ContieneJpaController cjc = new ContieneJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        cjc.create(cmp);
    }
}
