<%@page import="ar.com.proyecto.domain.Persona"%>
<%@page import="java.util.List"%>
<%
 Persona persona = (Persona)request.getAttribute("persona"); // levanto el departamento que viene del controller
%>

<!doctype html>
<html lang="es">

	<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Cumpleaños</title>
    <link rel="stylesheet" href="./css/estilos.css">
    <link rel="shortcut icon" href="./img/papel-picado.png" type="image/x-icon">
    </head>
	  <style>
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
		    .modificar{
		        background-color: rgb(150,201,62);
                margin-top: 40px;
                color: white;
		    }
		    
		    #modificar{
		        background-color: rgb(150,201,62);
                
                color: white;
                display: flex;
                justify-content: center;
                margin: 0 auto;
		    }
		  </style>
	</head>
	<body>
	
		
		
		<main class="mb-5">
          <section class="container mt-5" id="form-orador">
		        <div class="row justify-content-center">
		            <div class="col-lg-8 col-xl-7">
		                <h2 class="titulo-gral">Modificar datos de la persona</h2>
		               
		                <form action="<%=request.getContextPath()%>/UpdatePersonaController" method="POST">
		                    <div class="row gx-2">
		                        <div class="col-md mb-3">
		                            <input type="hidden" name="id" value="<%=persona.getId()%>">
		                            <input type="text" class="form-control" 
		                             name="nombre" 
		                             placeholder="Nombre" 
		                             aria-label="Nombre"
		                             id="validationCustom02"
		                             value="<%=persona.getNombre()%>" 
		                             required>
		                        </div>
		                        <div class="col-md mb-3">
		                            <input type="text" class="form-control" name="apellido" placeholder="Apellido" aria-label="Apellido"
		                             value="<%=persona.getApellido()%>" 
		                             required>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col mb-3">
		                            <input type="date" class="form-control" name="fecha_nac" 
		                            value="<%=persona.getFecha_nac()%>"  
		                            required>
		                        </div>
		                    </div>
								<button type="submit" id= modificar class="btn modificar btn-lg btn-form">Modificar</button>                        
		                 </div>
		                </div>
		               </div>
		             </form>
		        </div>
		    </div>
		</section>
		
		</main>
		
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	</body>
</html>