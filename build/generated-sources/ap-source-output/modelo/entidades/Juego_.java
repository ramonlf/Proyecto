package modelo.entidades;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.entidades.Consola;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-20T13:04:53")
@StaticMetamodel(Juego.class)
public class Juego_ { 

    public static volatile SingularAttribute<Juego, String> descripcion;
    public static volatile SingularAttribute<Juego, Date> fechaLanzamiento;
    public static volatile SingularAttribute<Juego, Double> precio;
    public static volatile SingularAttribute<Juego, Consola> consola;
    public static volatile SingularAttribute<Juego, String> genero;
    public static volatile SingularAttribute<Juego, Long> id;
    public static volatile SingularAttribute<Juego, Integer> cantidad;
    public static volatile SingularAttribute<Juego, String> nombre;
    public static volatile SingularAttribute<Juego, String> url;

}