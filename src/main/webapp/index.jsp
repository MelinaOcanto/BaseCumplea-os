<%@page import="ar.com.proyecto.domain.Persona"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
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
  body{
    background: #f5f5f5;
  }
  .navegador{
    height: 80px;
    background-color: rgb(71, 69, 69);
  }

  .login{
    color: rgb(78, 132, 78);
    font-size: 20px;
    font-weight: 500px;
  }
  .botonVerde{
    background-color: rgb(150,201,62);
    margin-top: 40px;
    color: white;
  
  
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
    <h1 class="tituloPrincipal">Fechas de cumpleaños</h1>
    <section class="container mb-4 text-center" id="registros">
        <a class="btn btn-outline-success" href="<%=request.getContextPath()%>/FindAllCumpleController">Conoce la lista de cumpleaños</a>
     </section>

    <h2 class="tituloPrincipal">Registro de Cumpleaños</h2>
    <section class="form" id="formularioCumple">
            <div class="contenidoForm">
                    <form action="<%=request.getContextPath()%>/CreatePersonaController" method="POST">
		                    <div class="row gx-2">
		                        <div class="col-md mb-3">
		                            <input type="text" class="form-control" name="nombre" placeholder="Nombre" aria-label="Nombre" required>
		                        </div>
		                        <div class="col-md mb-3">
		                            <input type="text" class="form-control" name="apellido" placeholder="Apellido" aria-label="Apellido" required>
		                        </div>
		                    </div>
		                   <div class="form-group">
                                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                                <input type="date" class="form-control" id="fechaNacimiento" name="fecha_nac" required>
                            </div>
		                    <div class="d-grid">
		                            <button type="submit" class="botonVerde btn btn-lg btn-form">Enviar</button>
		                    </div>
                    </form>
		    </div>
	
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>

