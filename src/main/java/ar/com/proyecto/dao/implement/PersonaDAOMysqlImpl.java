package ar.com.proyecto.dao.implement;
import ar.com.proyecto.dao.iPersonaDAO;
import ar.com.proyecto.db.AdministradorDeConexiones;
import ar.com.proyecto.domain.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class PersonaDAOMysqlImpl implements iPersonaDAO{
	@Override
	public Persona getById(Long id) throws Exception {
		//-1 necesito la conection a la base
		Connection connection = AdministradorDeConexiones.getConnection();
		//2 - arma el statement
		String sql = "select * from datos where id_persona = " + id;
	   
		Statement statement  = connection.createStatement();
		
		//3 - obtengo el resulSet
		ResultSet resultset = statement.executeQuery(sql);
		// El resultset devuelve un registro de una tabla 
		
	     // primero verifico si hay datos 
		
		if (resultset.next()){
			// obtengo el dato del campo id
			Long idBd = resultset.getLong("id_persona");
			String nombreBd = resultset.getString("nombre");
			String apellidoBd = resultset.getString("apellido");
			String fecha_nacBd = resultset.getString("fecha_nac");
			
			
			return new Persona(idBd,nombreBd,apellidoBd,fecha_nacBd);
						
		}
		cerrar(connection);
		return null; // si no hay resultset entonces no devuelve nada
	}

    @Override
	public List<Persona> findAll() throws Exception {
		//-1 necesito la conection a la base
		Connection connection = AdministradorDeConexiones.getConnection();
		//2 - arma el statement
	    String sql = "select * from datos;";
			   
		Statement statement  = connection.createStatement();
				
		//3 - obtengo el resulSet
		ResultSet resultset = statement.executeQuery(sql);
		// El resultset devuelve un registro de una tabla 
				
	     // primero verifico si hay datos 
		    // creo una lista de Oradores
			List<Persona> datos = new ArrayList<Persona>();	
			
			// mientras encontremos resultados de la base 
			while (resultset.next()){
			// obtengo el dato del campo id
			Long idBd = resultset.getLong("id_persona");
			String nombreBd = resultset.getString("nombre");
			String apellidoBd = resultset.getString("apellido");
            String fecha_nacBd = resultset.getString("fecha_nac");
			
			// creamos un departamento y lo agregamos a la lista 
			Persona d = new Persona(idBd,nombreBd,apellidoBd,fecha_nacBd);
			datos.add(d);
					
			}
			cerrar(connection);
		   // devolvemos departamentos		
		   return datos; //
	}
    @Override
	public void delete(Long id) throws Exception { /* BAJA LOGICA*/
	   //-1 necesito la conection a la base
		Connection connection = AdministradorDeConexiones.getConnection();
		//2 - arma el statement
	     String sql = "DELETE FROM datos WHERE id_persona=" + id;
		
	 	 Statement statement  = connection.createStatement();
	 	//3 -devuelve un entero devuelve 1 o 0, pero no hace falta confirmar para este caso 
		  statement.executeUpdate(sql);
		  cerrar(connection);
		 
	}
    @Override
	public void deletePersona(Persona persona) throws Exception {
	    Connection connection = AdministradorDeConexiones.getConnection();
	    
	    // Primero, busca la persona basado en la información proporcionada (por ejemplo, el correo electrónico).
	    String sql = "SELECT id_persona FROM datos WHERE fecha_nac = ?";
	    PreparedStatement searchStatement = connection.prepareStatement(sql);
	    searchStatement.setString(1, persona.getFecha_nac());

	    ResultSet resultset = searchStatement.executeQuery();
	    
	    if (resultset.next()) {
	        Long idBd = resultset.getLong("id_persona");

	        // Ahora que tienes el ID, puedes eliminar el orador por ID.
	        String deleteSql = "DELETE FROM datos WHERE id_persona = ?";
	        PreparedStatement deleteStatement = connection.prepareStatement(deleteSql);
	        deleteStatement.setLong(1, idBd);
	        deleteStatement.executeUpdate();
	    }
	    
	    cerrar(connection);
	}
    @Override
	public void update(Persona persona) throws Exception {
		// creo un orador con los datos modificados del orador
		
		//-1 necesito la conection a la base
		Connection connection = AdministradorDeConexiones.getConnection();
		//2 - arma el statement
		 String sql = "update datos set nombre = ?, apellido = ?, fecha_nac = ? where id_persona= ?"  ;
		 PreparedStatement statement  = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
	     statement.setString(1,persona.getNombre());
		 statement.setString(2,persona.getApellido());
		 statement.setString(3,persona.getFecha_nac());
		 statement.setLong(4,persona.getId());
		//3 -devuelve un entero devuelve 1 o 0, pero no hace falta confirmar para este caso 
		 statement.execute();
		
		 cerrar(connection);
	}

    @Override
	public void create(Persona newPersona) throws Exception {
		
        
		//-1 necesito la conection a la base
		Connection connection = AdministradorDeConexiones.getConnection();
		//2 - arma el statement
		 String sql = "insert into datos (nombre, apellido,fecha_nac) values (?,?,?)" ;
		 PreparedStatement statement  = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		 statement.setString(1,newPersona.getNombre());
		 statement.setString(2,newPersona.getApellido());
		 statement.setString(3,newPersona.getFecha_nac());
		//3 -devuelve un entero devuelve 1 o 0, pero no hace falta confirmar para este caso 
		 statement.execute();
		 
		 ResultSet res = statement.getGeneratedKeys(); // RETORNA LA KEY QUE SE GENERO
		 if (res.next()) {
			 System.out.println("Se creo el Persona correctamente");
		 }
		 cerrar(connection);
	}
    @Override
	public List<Persona> search(String clave) throws Exception {
		// 1 - necesito la Connection
		Connection connection = AdministradorDeConexiones.getConnection();

		// 2 - arma el statement
		String sql = "SELECT * FROM DATOS WHERE NOMBRE LIKE ?";
		PreparedStatement statement = connection.prepareStatement(sql);

		//setear el valor que va en remplazo del ?
		statement.setString(1, "%" + clave + "%");
		
		// 3 - resultset
		ResultSet resultSet = statement.executeQuery();

		// Interface i = new ClaseQueImplementaLaInterface();
		List<Persona> persona = new ArrayList<Persona>();

		// verifico si hay datos
		while (resultSet.next()) {
			persona.add(this.crearPersona(resultSet));
		}
		
		cerrar(connection);
		
		return persona;
	}
	
	private void cerrar(Connection con) throws Exception{
		con.close();
	}
	
	private Persona crearPersona(ResultSet resultset) throws Exception {
		// obtengo el dato del campo id
		Long idBd = resultset.getLong("id_persona");
		String nombreBd = resultset.getString("nombre");
		String apellidoBd = resultset.getString("apellido");
		String fecha_nacBd = resultset.getString("fecha_nac");
		
		

		return new Persona(idBd,nombreBd,apellidoBd,fecha_nacBd);
	}

}
