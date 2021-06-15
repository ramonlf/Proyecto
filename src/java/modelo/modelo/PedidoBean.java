/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

import javax.persistence.Persistence;
import modelo.entidades.Pedido;
import modelo.entidades.PedidoJpaController;

/**
 *
 * @author Ramon
 */
public class PedidoBean {
    public static final String PERSISTENCIA = "ProyectoFinalPU";
    
    public void crearPedido(Pedido pedido) throws Exception{
        PedidoJpaController pjc = new PedidoJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        pjc.create(pedido);
    }
}
