<%-- 
    Document   : Mansaje_Confirmacion
    Created on : 21/09/2018, 12:08:02 PM
    Author     : Santiago.S
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="logica.Clases.TipoRetorno"%>
<%@page import="logica.Clases.DtinfoPropuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Colaboración</title>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
       
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />

        <%
            DtinfoPropuesta propuestaSelec = (DtinfoPropuesta) request.getAttribute("Propuestaseleccionada");
            String Opcion = propuestaSelec.getTitulo();
        %>
        <div class="modal-content formulario" style="margin-top: 8%;width: 40%;margin-left: 32%;">
            <div class="modal-header">
                <h4 align="center" class="modal-title" id="exampleModalLabel">Registrar la colaboración con la propuesta "<% out.print(Opcion);%>"</h4>
            </div>
            <div class="modal-body">
                <form class="form-signin" action="ServletRegistroColaboracion" method="POST">
                    <div class="form-group">
                        <label required for="recipient-name" class="col-form-label">Monto</label>
                        <input name="Monto" type="text" class="form-control" id="recipient-name" required>
                    </div>
                    <select name="Tipo_Retorno" class="form-control" style="width: 26%;">
                        <% if (propuestaSelec.getTipoRetorno().compareTo(TipoRetorno.Entradas) == 0) {
                                out.print("<option>Entradas</option>");
                            } else if (propuestaSelec.getTipoRetorno().compareTo(TipoRetorno.porGanancias) == 0) {
                                out.print("<option>Por_ganancias</option>");
                            } else {
                                out.print("<option>Entradas</option>");
                                out.print("<option>Por_ganancias</option>");
                            }
                        %>
                    </select>

            </div>
            <div class="modal-footer">
                <a href="javascript:window.history.back();" class="btn btn-danger"> &laquo; Volver</a>
                <a href="ServletInicio" class="btn btn-primary" > &laquo; Salir a inicio</a>
                <button type="input" name="Registrar" class="btn btn-primary">Registrar</button>
            </div>
        </form>
    </div>

</body>
</html>
