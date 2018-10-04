<%-- 
    Document   : FuncionamientoCorrecto
    Created on : 17/09/2018, 04:47:25 PM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <br>
        <br>
        <br>
        <br>
        <br>

        <div style="text-align: center" class="panel panel-default">
            <div class="panel-heading">Resultado de la operacion realizada</div>
            <div class="panel-body">
                <a class="alert-info"> <%= request.getAttribute("mensaje")%></a>
                <a class="alert-link" href="/CulturarteWeb/ServletAltaPropuesta" >Generar una nueva Propuesta</a>
                <a class="alert-link" href="/CulturarteWeb/ServletInicio" >Regresar al inicio</a>
            </div>
        </div>
    </body>
</html>
