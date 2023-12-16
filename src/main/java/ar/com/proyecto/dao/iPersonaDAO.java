package ar.com.proyecto.dao;
import ar.com.proyecto.domain.Persona;
import java.util.List;

public interface iPersonaDAO {
	 // en esta interface vamos a definir metodos de acceso a la tabla datos
		// LAS INTERFACES POR SI SOLAS NO HACEN NADA, SOLO ES UNA ESTRUCTURA
		// SE DEBE IMPLEMENTAR EN UNA CLASE, ES DECIR EN UNA CLASE USAMOS ESTOS METODOS QUE DEFINIMOS ACA
		
		/*crud
		 getById()
		 find()
		 delete()
		 update()
		 create()*/
		
		// select * from datos where id_persona = id;
		public Persona getById(Long id) throws Exception; // devuelve de un id todos los campos 
		
		// cambiamos el array por una lista de java 
		// select * from datos;
		public List<Persona> findAll() throws Exception;	// devuelve todos los registros de la tabla personas
		
		
		// delete from datos where id_persona = id;
		public void delete(Long id) throws Exception;// esto borra un registro por el id de persona
		
		// delete from datos where id_persona = id;pero primero buscar persona si existe en la base por su mail y el id levantandolo de la base 
		public void deletePersona(Persona persona) throws Exception;// esto borra un registro por el id de persona
		
		
		//update personas set nombre = nombre, apellido = apellido, mail = mail, tema = tema , activo = activo where id_orador = orador.id;
		public void update(Persona persona) throws Exception; // se le pasa un objeto 
		
		// insert to oradores (campo 1..campo2..campo3) values(newOrador.campo1....newOrador.campoN)
		public void create(Persona newPersona) throws Exception;
		
		//select * from datos where tema like '%clave%' 
	    public List<Persona> search(String clave) throws Exception;
		
		// crear un method que consulte a la base por el nombre y que devuelva una lista de departamentos
		// crear un nuevo method que haga update solo al nombre o solo al presupuesto 
}
