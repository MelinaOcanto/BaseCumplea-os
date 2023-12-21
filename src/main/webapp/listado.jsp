<%@page import="ar.com.proyecto.domain.Persona"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Cumpleaños</title>
    <link rel="shortcut icon" href="./img/papel-picado.png" type="image/x-icon">
    <link rel="stylesheet" href="./css/estilos.css">
</head>
<style>
    .volver{
		border-radius: 5px;
        background-color: rgb(41, 167, 68);
	    color:white;
		padding: 10px;
	    margin-bottom: 20px;
				
	}

	.volver a{
		text-decoration: none;
	}
  


</style>

	<body>
	    
	    
		 
		 <main>
			<section class="container mt-5 mb-4">
		        <h2 class="titulo-gral">Fechas de cumpleaños</h2>
		      
		        <div class="row">
		            <table class="table">
		                <thead>
		                  <tr>
		                    <th scope="col">#</th>
		                    <th scope="col">Nombre</th>
		                    <th scope="col">Apellido</th>
		                    <th scope="col">Fecha Nacimiento</th>
		                  </tr>
		                </thead>
		                 <% 
						  	//codigo java
						  	//obtener el listado desde el request
						  	//se guardo bajo el nombre de "listado"
						  	List<Persona> listado = (List<Persona>)request.getAttribute("listado");
					 	 %>
						  <tbody>
							<% 
								// Verificar si la lista está vacía
								if (listado != null && !listado.isEmpty()) {
									// Si la lista no está vacía, mostrar los elementos
									for (Persona unPersona : listado) {
							%>
							<tr>
								<th scope="row"><%= unPersona.getId() %></th>
								<td><%= unPersona.getNombre() %></td>
								<td><%= unPersona.getApellido() %></td>
								<td><%= unPersona.getFecha_nac() %></td>
							</tr>
							<%
								}
								} else {
									// Si la lista está vacía, mostrar un mensaje
							%>
							<tr>
								<td colspan="4">No existe ese nombre en la lista.</td>
							</tr>
							<%
								}
							%>
						</tbody>

		              </table>
		        </div>

    	  </section>
		  <div class="d-flex justify-content-center align-items-center">
			<a class= "volver" href="javascript:history.back()">VOLVER</a>
		</div>
	
		
		
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    
</body>
</html>