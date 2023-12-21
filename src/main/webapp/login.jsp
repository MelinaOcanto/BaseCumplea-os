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
      .alto{
        height: 90px;
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
		    .botonVerde{
            background-color: rgb(150,201,62);
            margin-top: 40px;
            color: white;

            }
            
            .titulo-gral {
              text-align: center;
              font-weight: 400;
              text-transform: uppercase;
              font-size: 1rem;
 
             }
            .titulo-gral span {
              display: block;
              font-weight: 700;
              font-size: 2.2rem;
 
             } 

		  </style>
	
	<body>
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
    <main class="d-flex justify-content-center align-items-center">
		 <section class="mt-5 container" id="form-orador">
		        <div class="row justify-content-center">
		            <div class="col-lg-8 col-xl-7">
		                
		                <h1 class="titulo-gral mb-3">LogIn</h1>
		                
		                <form action="<%=request.getContextPath()%>/LoginAdminController" method="POST">
		                    <div class="row justify-content-center">
		                        <div class="col-8 mb-3 mb-4">
		                            <input type="text" class="form-control" name="nombre" placeholder="Usuario" aria-label="Nombre" required>
		                            
		                        </div>
		                         <div class="col-8 mb-3 mb-4">
		                           <input type="password" class="form-control" name="password" placeholder="Contraseña" aria-label="Password" required>
		                         </div>
		                    </div>
		                    <div class="row justify-content-center">
		                        <div class="col-8 mb-3">
		                            <div class="d-grid">
		                                <button type="submit" class="btn botonVerde btn-lg btn-form">LogIn</button>
		                            </div>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </section>
		
		</main>
     
		 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   
</body>
</html>