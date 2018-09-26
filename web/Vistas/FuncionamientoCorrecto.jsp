<%-- 
    Document   : FuncionamientoCorrecto
    Created on : 17/09/2018, 04:47:25 PM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> El resultado de la operacion realizada es: </h1>

        <label> <%=request.getAttribute("mensaje")%> </label> 
    <li><a style="color: black" href="/CulturarteWeb/ServletInicio" >Regresar al inicio</a></li>
    <li><a style="color: black" href="/CulturarteWeb/ServletAltaPropuesta" >Generar una nueva Propuesta</a></li>
</body>
</html>
