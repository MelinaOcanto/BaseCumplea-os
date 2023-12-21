<%@page import="ar.com.proyecto.domain.Persona"%>
<%@page import="java.util.List"%>

<!doctype html>
<html lang="es">

	<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Cumpleaños</title>
    <link rel="shortcut icon" href="./img/papel-picado.png" type="image/x-icon">
    <link rel="stylesheet" href="./css/estilos.css">
    </head>
		<style>
			.buscador{
				width: 400px;
				
			}
			.buscador input{
				margin-right: 10px;
			}

			
		    body{
		        height:100vh;
		        display: grid;
		        grid-template-rows: 10% 75% 15%;
		        grid-template-areas: "header"
		                             "main"
		                             "footer";  
		
		    }
		    header{
		        grid-area: header;
		    }
		    main{
		        grid-area: main;
		        overflow: auto;
		    }
		    footer{
		        grid-area: footer;
		      
		    }
		  </style>
		  <header>
            <nav class="navegador navbar navbar-expand-lg navbar-dark">
              <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0 w-100 justify-content-end">
                    <li class="nav-item">
                        <a class="login nav-link" href="./login.jsp">LogIn</a>
                    </li>
                  </ul>
                </div>
              </div>
            </nav> 
</header>
	
	<body>
		<main>
			<section class="mt-5">
		        <h3 class="text-center my-3">Fechas importantes</h3>
		        <div class="d-flex justify-content-center">
					<form class="buscador" action="<%=request.getContextPath()%>/BuscarCumpleNombreController" method="post">
						<div class="input-group">
							<input class="form-control" name="nombreBuscar" id="nombreBuscar" type="search" placeholder="Ingresa un nombre" aria-label="Buscar">
							<div class="input-group-append">
								<button class="btn btn-outline-success" type="submit">Buscar</button>
							</div>
						</div>
					</form>
				</div>

	        </section>
			<section class="container mt-5 mb-4" id="restoOradores">
		        <h4 class="text-center">Cumpleaños</h4>
		      
		        <div class="row">
		            <table class="table">
		                <thead>
		                  <tr>
		                    <th scope="col">#</th>
		                    <th scope="col">Nombre</th>
		                    <th scope="col">Apellido</th>
		                    <th scope="col">Fecha_nac</th>
							<th scope="col">Acciones</th>
		                  </tr>
		                </thead>
		                 <% 
						  	//codigo java
						  	//obtener el listado desde el request
						  	//se guardo bajo el nombre de "listado"
						  	List<Persona> listado = (List<Persona>)request.getAttribute("listado");
					 	 %>
		                <tbody>
			                 <!-- ESTO SE REPITE TANTA CANDTIDAD DE VECES COMO ARTICULOS TENGA -->
						   <%
						   	for( Persona  unPersona : listado) {
						   %>
		                  <tr>
		                    <th scope="row"><%=unPersona.getId()%></th>
		                    <td><%=unPersona.getNombre() %></td>
		                    <td><%=unPersona.getApellido() %></td>
		                    <td><%=unPersona.getFecha_nac() %></td>
		                    <td><a class="btn btn-info" role="button" href="<%=request.getContextPath()%>/UpdatePersonaController?id=<%=unPersona.getId()%>">
							       Editar
							    </a> | 
					      		<!-- Button trigger modal -->
								<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="setPersonaId(<%=unPersona.getId()%>)">
								  Eliminar
								</button>
							  </td>
		                  </tr>
		                   <%
					   		}
					  	   %>
		                </tbody>
		              </table>
		        </div>

    	  </section>
	
		
		</main>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<form action="<%=request.getContextPath()%>/DeletePersonaController">
		    	  <input type="hidden" name="idPersona" id="idPersona">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Dar de baja Persona</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			       Confirma que desea eliminar? 
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
			        <button type="submit" class="btn btn-danger">Eliminar</button>
			      </div>
		    	</form>
		    </div>
		  </div>
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script>
			function setPersonaId(id) {
				document.getElementById('idPersona').value=id;
			}
	  </script>
	</body>
</html>