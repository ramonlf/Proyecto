/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Persistence;
import modelo.entidades.Juego;
import modelo.entidades.JuegoJpaController;
import modelo.entidades.Usuario;
import modelo.entidades.UsuarioJpaController;

/**
 *
 * @author Ramon
 */
public class UsuarioBean implements Serializable {

    public UsuarioBean() {
    }

    public static final String PERSISTENCIA = "ProyectoFinalPU";

    public void registroUsuario(Usuario ump) throws Exception {
        UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        ujc.create(ump);
    }

    public List<Usuario> getUsuarios() {
        UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        return ujc.findUsuarioEntities();
    }

    public void añadirJuego(Usuario ump) throws Exception {
        UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        ujc.create(ump);
    }

    public void actualizarJuego(Usuario juego) throws Exception {
        UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        ujc.edit(juego);
    }
    
    public Usuario buscarUsuario(long id){
        UsuarioJpaController ujc = new UsuarioJpaController(Persistence.createEntityManagerFactory(PERSISTENCIA));
        return ujc.findUsuario(id);
    }
}
