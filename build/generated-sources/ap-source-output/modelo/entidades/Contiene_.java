package modelo.entidades;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.entidades.Juego;
import modelo.entidades.Pedido;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-17T17:16:31")
@StaticMetamodel(Contiene.class)
public class Contiene_ { 

    public static volatile SingularAttribute<Contiene, Double> precio;
    public static volatile SingularAttribute<Contiene, Date> fechaRealizacion;
    public static volatile SingularAttribute<Contiene, Integer> unidades;
    public static volatile SingularAttribute<Contiene, Pedido> pedido;
    public static volatile SingularAttribute<Contiene, Long> id;
    public static volatile SingularAttribute<Contiene, Juego> juego;

}