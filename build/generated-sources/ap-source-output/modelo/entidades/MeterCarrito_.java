package modelo.entidades;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.entidades.Juego;
import modelo.entidades.Usuario;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-20T13:04:53")
@StaticMetamodel(MeterCarrito.class)
public class MeterCarrito_ { 

    public static volatile SingularAttribute<MeterCarrito, Usuario> usuario;
    public static volatile SingularAttribute<MeterCarrito, Long> id;
    public static volatile SingularAttribute<MeterCarrito, Integer> cantidad;
    public static volatile SingularAttribute<MeterCarrito, Juego> juego;

}