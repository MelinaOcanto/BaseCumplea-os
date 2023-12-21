package ar.com.proyecto.controllers;
import ar.com.proyecto.dao.iPersonaDAO;
import ar.com.proyecto.dao.implement.PersonaDAOMysqlImpl;
import ar.com.proyecto.domain.Persona;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BuscarCumpleNombreController")

public class BuscarCumpleNombreController extends HttpServlet {
	// tienen metodos importantes como es el 
	//doGet
	//doPost
	// version para la web 
	// se escribe doGet + ctrl + espacio
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// levantamos el tema a buscar 
    	String nombreBuscar = req.getParameter("nombreBuscar");
		//interface = new class que implementa la interface
	     iPersonaDAO dao = new PersonaDAOMysqlImpl();
	     List<Persona> personas = new ArrayList<>();
			
	       try {
	    	 personas = dao.search(nombreBuscar);
	       } catch (Exception e) {
	    	 // TODO Auto-generated catch block
	    	 e.printStackTrace(); //  muestra por consola el error 
	       }
	       req.setAttribute("listado", personas);
	      // este bloque de codigo lo vamos a usar en todos lados, redirecciona al index.jsp 
	       getServletContext().getRequestDispatcher("/listado.jsp").forward(req, resp);
		   //En resumen, la línea de código en cuestión redirige la solicitud actual 
	       //a un archivo JSP llamado "listado.jsp", lo que significa que el control 
	       //se transferirá a ese archivo y se generará una respuesta basada 
	       //en el contenido del JSP. Esto permite separar la lógica 
	       //de presentación de la lógica de negocio en una aplicación web Java
	       //que sigue el patrón MVC.
	
	}
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
