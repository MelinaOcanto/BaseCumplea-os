package ar.com.proyecto.controllers;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.com.proyecto.dao.*;
import ar.com.proyecto.dao.implement.PersonaDAOMysqlImpl;
import ar.com.proyecto.domain.Persona;


@WebServlet("/UpdatePersonaController")

public class UpdatePersonaController extends HttpServlet{

		@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//capturo los parametros que viene en el request enviado por el form
		String id = req.getParameter("id");//name de input
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
			errores.add("Fecha de nacimiento vacía");
		}
		
		if(!errores.isEmpty()) {
			req.setAttribute("errors", errores);
			//vuelvo a la jsp con la lista de errores cargadas 
			getServletContext().getRequestDispatcher("/dashboard.jsp").forward(req, resp);
			return;
		}
		
		//interface = new class que implementa la interface
		iPersonaDAO dao = new PersonaDAOMysqlImpl();
		Persona persona;
       
		persona = new Persona(Long.parseLong(id),nombre,apellido,fecha_nac);
		// si no usamos try catch podemos arriba poner throws Exception
		try { 
			dao.update(persona);
			//aca mensaje de exito, PERO COMO UNA LISTA
			req.setAttribute("success", List.of("Persona id:" + persona.getId() + " actualizado correctamente"));
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errors", List.of("Error actualizando Persona<" + e.getMessage()));
		}
		
		
		//ahora redirect!!!!
	     getServletContext().getRequestDispatcher("/DashboardPersonaController").forward(req, resp);
		
		
	}
	// cuando desde el listado, por url, viene al metodo get
	//cargar el departamento y enviarlo a la jsp que va a editar los datos
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String id = req.getParameter("id");
			
			// realizar validaciones, para los datos que vienen!!!
			
			//interface = new class que implementa la interface
			iPersonaDAO dao = new PersonaDAOMysqlImpl();
			
			Persona persona = null;
			//cargo los datos 
			try {
				persona = dao.getById(Long.parseLong(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//guardar el producto en request y pasar dicho producto a la jsp
			req.setAttribute("persona", persona);
			
			//redirect
			//ahora redirect!!!!
		     getServletContext().getRequestDispatcher("/editar.jsp").forward(req, resp);
		}

}

