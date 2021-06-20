package modelo.entidades;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.entidades.Usuario;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-17T17:16:31")
@StaticMetamodel(Pedido.class)
public class Pedido_ { 

    public static volatile SingularAttribute<Pedido, Date> fechaRealizacion;
    public static volatile SingularAttribute<Pedido, Double> factura;
    public static volatile SingularAttribute<Pedido, Usuario> usuario;
    public static volatile SingularAttribute<Pedido, Long> id;

}