package ar.com.proyecto.controllers;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.com.proyecto.dao.iPersonaDAO;
import ar.com.proyecto.dao.implement.PersonaDAOMysqlImpl;

@WebServlet("/DeletePersonaController")

public class DeletePersonaController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long id = Long.parseLong(req.getParameter("idPersona"));//viene como String -> Long.parseLong()

		//interface = new class que implementa la interface
		iPersonaDAO dao = new PersonaDAOMysqlImpl();
		
		//eliminar
		try {
			dao.delete(id);
			//mensaje de exito
			req.setAttribute("success", List.of("Se he eliminado la persona con id:" + id));
		} catch (Exception e) {
			e.printStackTrace();
			//mensaje de error
			req.setAttribute("erorrs", List.of("NO se he eliminado la persona :" + e.getMessage()));
		}//ctrl+t
		
		//ahora redirect!!!!
		getServletContext().getRequestDispatcher("/DashboardPersonaController").forward(req, resp);
		
		
	}

}
