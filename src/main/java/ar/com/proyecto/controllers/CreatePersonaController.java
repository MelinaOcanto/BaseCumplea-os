package ar.com.proyecto.controllers;
import ar.com.proyecto.dao.iPersonaDAO;
import ar.com.proyecto.dao.implement.PersonaDAOMysqlImpl;
import ar.com.proyecto.domain.Persona;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreatePersonaController")

public class CreatePersonaController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//capturo los parametros que viene en el request enviado por el form
		String nombre= req.getParameter("nombre");//name de input
		String apellido = req.getParameter("apellido");//name de input
		String fecha_nac = req.getParameter("fecha_nac");

		
		
		//validaciones!
		List<String> errores = new ArrayList<>();
		if(nombre == null || "".equals(nombre)) {
			errores.add("Nombre vacío");
		}
		if(apellido== null || "".equals(apellido)) {
			errores.add("Apellido vacío");
		}
		if(fecha_nac== null || "".equals(fecha_nac)) {
			errores.add("Fecha_nac vacío");
		}
		
		if(!errores.isEmpty()) {
			req.setAttribute("errors", errores);
			//vuelvo a la jsp con la lista de errores cargadas 
			getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
			return;
		}

		
		
		
		//interface = new class que implementa la interface
		iPersonaDAO dao = new PersonaDAOMysqlImpl();
		
		// como llego a la base de datos si quiero pedir datos de un orador?
		
		
         Persona persona = new Persona(nombre,apellido,fecha_nac);
	
		// si no usamos try catch podemos arriba poner throws Exception
		try {
			 dao.create(persona); // cuando se crea el orador se le setea el id que se levanta de la base 
			 req.setAttribute("success", List.of("Alta de Persona exitosa"));
		}catch (Exception e) {
			//si falla volver al nuevo.jsp
			e.printStackTrace();
			
		 }
		//ahora redirect!!!!
		getServletContext().getRequestDispatcher("/FindAllCumpleController").forward(req, resp);
		
		
		
		
	}
}
