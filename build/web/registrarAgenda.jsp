<%-- 
    Document   : registrarAgenda
    Created on : 19/11/2019, 11:49:56 a. m.
    Author     : PC1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <title>Registrar</title>
    </head>
    <body>

        <form class="was-validated" method="post" action="Agenda" >
            <div class="row justify-content-md-center">
                <div class="col-6 col-sm-3">
                    <h1>Registrar Agenda Servicio</h1><br>
                </div>
            </div>
            <div class="container">
                <div class="row row justify-content-md-center">
                    <div class="col-6 col-sm-3">
                        <h6><label>Fecha</label></h6>
                        <textarea class="form-control is-invalid" id="validationTextarea" placeholder="Campo Requerido" required name ="txtFechaAgenda"></textarea>
                    </div>
                    <div class="col-6 col-sm-3">
                        <h6><label>Servicio</label></h6>
                        <textarea class="form-control is-invalid" id="validationTextarea" placeholder="Campo Requerido" required name ="txtFkServicio"></textarea>
                    </div>
                </div>
            </div>
            <div class="w-100"></div>
            <div class="container">
                <div class="row row justify-content-md-center">
                    <div class="col-6 col-sm-3">
                        <h6><label>Mascota</label></h6>
                        <textarea class="form-control is-invalid" id="validationTextarea" placeholder="Campo Requerido" required name ="txtFkMascota"></textarea>
                    </div>
                </div>
            </div>
            <br>
            <div class="row justify-content-md-center">
                <button class="btn btn-primary">Registrar</button>
                <input type="hidden" name="opcion" value="1">
            </div>
        </form>
    </div>
    <%         if (request.getAttribute("mensajeError") != null) {        %>
    ${mensajeError}
    <%            } else { %>
    ${mensajeExito}
    <% }%>
</body>
</html>
