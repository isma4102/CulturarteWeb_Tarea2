<%-- 
    Document   : FuncionamientoCorrecto
    Created on : 17/09/2018, 04:47:25 PM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
             <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />

        <div class="modal-content formulario" style="margin-top: 8%;width: 32%;margin-left: 34%;">
            <div class="modal-header">
                <h5 align="center" class="modal-title" id="exampleModalLabel">Resultado de la operacion realizada</h5>

            </div>
            <div class="modal-body">
                <%out.print(request.getAttribute("mensaje"));%>
            </div>
            <div class="modal-footer">
                <a href="/CulturarteWeb/ServletAltaPropuesta" class="btn btn-primary"> &laquo; Generar una nueva propuesta</a>
                <a style="color:#FFFFFF" class="btn btn-primary" href="/CulturarteWeb/ServletInicio">Regresar al Inicio</a> </button>

            </div>
        </div>
 <div style="margin-top: 25%;" >
    <jsp:include page="/Vistas/footer.jsp" /> 
                    </div>

    </body>
</html>
