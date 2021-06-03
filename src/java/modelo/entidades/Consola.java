/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidades;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Ramon
 */
@Entity
public class Consola implements Serializable {

     private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(unique = true, length = 40)
    private String nombre;
    @Column
    @Temporal(TemporalType.DATE)
    private Date fechaLanzamiento;
    @Column
    private int generacion;
    @Column
    private String url;

    public Consola() {
    }

    public Consola(String nombre, Date fechaLanzamiento, int generacion, String url) {
        this.nombre = nombre;
        this.fechaLanzamiento = fechaLanzamiento;
        this.generacion = generacion;
        this.url = url;
    }

    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechaLanzamiento() {
        return fechaLanzamiento;
    }

    public void setFechaLanzamiento(Date fechaLanzamiento) {
        this.fechaLanzamiento = fechaLanzamiento;
    }

    public int getGeneracion() {
        return generacion;
    }

    public void setGeneracion(int generacion) {
        this.generacion = generacion;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nombre != null ? nombre.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Consola other = (Consola) obj;
        if (this.generacion != other.generacion) {
            return false;
        }
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        if (!Objects.equals(this.url, other.url)) {
            return false;
        }
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.fechaLanzamiento, other.fechaLanzamiento)) {
            return false;
        }
        return true;
    }

   

    @Override
    public String toString() {
        return "modelo.entidades.Consola[ id=" + nombre + " ]";
    }

    public String getFechaLanzamientoCorta() {
        SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
        String fecha;
        fecha = formateador.format(this.getFechaLanzamiento());

        return fecha;
    }

}
