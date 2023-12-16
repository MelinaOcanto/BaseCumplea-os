<%@page import="ar.com.proyecto.domain.Persona"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Cumpleaños</title>
    <link rel="stylesheet" href="./css/estilos.css">
</head>
<body>
    <h1 class="tituloPrincipal">Fechas de cumpleaños</h1>
    <section class="container mb-4 text-center" id="registros">
        <a class="btn btn-outline-success" href="<%=request.getContextPath()%>/FindAllCumpleañosController">Conoce la lista de cumpleaños</a>
     </section>

    <h2 class="tituloPrincipal">Registro de Cumpleaños</h2>
    <section class="form" id="formularioCumple">
            <div class="contenidoForm">
                <form action="<%=request.getContextPath()%>/CreateCumpleController" method="POST">
		                    <div class="row gx-2">
		                        <div class="col-md mb-3">
		                            <input type="text" class="form-control" name="nombre" placeholder="Nombre" aria-label="Nombre" required>
		                        </div>
		                        <div class="col-md mb-3">
		                            <input type="text" class="form-control" name="apellido" placeholder="Apellido" aria-label="Apellido" required>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col mb-3">
		                            <input type="email" class="form-control" name="mail" placeholder="Email" aria-label="Email" required>
		                        </div>
		                    </div>
		                   <div class="form-group">
                                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                                <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" required>
                            </div>
		                            <div class="d-grid">
		                                <button type="submit" class="botonVerde btn btn-lg btn-form">Enviar</button>
		                            </div>
		                        </div>
		                    </div>
		                </form>
            </div>
        </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

