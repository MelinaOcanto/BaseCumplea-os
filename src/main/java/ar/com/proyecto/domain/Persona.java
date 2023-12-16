package ar.com.proyecto.domain;

public class Persona {
	// atributos
		private Long id_persona;
		private String nombre;
		private String apellido;
		private String fecha_nac;
		
		
		// constructor de clase -- instanciar un objeto en memoria 
		public Persona(String nombre, String apellido,String fecha_nac) {
			/*this.id_orador = id_orador;*/
			// this, es una palabra reservada que hace referencia al objeto actual
			this.nombre = nombre;
			this.apellido = apellido;
			this.fecha_nac = fecha_nac;
			
		}
		// constructor de clase. Este contructor es cuando se le pasa el id de la persona sino debe crearse. Ese es el de arriba
		public Persona(Long id_persona, String nombre, String apellido,String fecha_nac) {
			this.id_persona = id_persona;
			this.nombre = nombre;
			this.apellido = apellido;
			this.fecha_nac = fecha_nac;
		}
	    
		
		// methods getters y setters , method public retorna un Long DameId
		// getter = dame el atributo, tiene que retornar el valor del atributo, el tipo de dato del atributo
		//setter = guardar el atributo en memoria, no retorna nada, asi que en la firma del method se usa void, no se usa el return dentro, sino una asingacion
		
		//esto seria devolveme el atributo, me retorna algo
		
		public Long getId() {
			return this.id_persona;
		}
		
		//esto seria guardame el atributo(set), no me retorna nada, dice void(no devuelve nada)
	    
		public void setId(Long id_persona) {
			this.id_persona = id_persona;
		}
		

		public String getNombre() {
			return this.nombre;
		}

		public void setNombre(String nombre) {
			this.nombre = nombre;
		}

		public String getApellido() {
			return this.apellido;
		}

		public void setApellido(String apellido) {
			this.apellido = apellido;
		}

		public String getFecha_nac() {
			return this.fecha_nac;
		}

		public void setFecha_nac(String fecha_nac) {
			this.fecha_nac = fecha_nac;
		}
		
		
		
	    // sobreescribir methods que heredan de la clase padre, hereda de object 
		@Override
		public String toString() {
			return "Persona : nombre=" + nombre + ", apellido=" + apellido + ", fecha_nac=" + fecha_nac ;
		}
		
}