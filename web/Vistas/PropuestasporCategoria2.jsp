<%-- 
    Document   : PropuestasporCategoria2
    Created on : 8/10/2018, 11:44:12 PM
    Author     : gabri
--%>

<%@page import="logica.Clases.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>Consultar propuestas por categoria</title>
    </head>
    <body> 
        <div class="formulario_ver_propuesta" style="margin-top: 7%">
            <%String nom = (String) request.getAttribute("nombre");%>
            <h3 align="center">Propuestas con categoria <%=nom%></h3>
            <table class="table table-bordered table-hover" style="margin-left: 30%; width: 35%  ">
                <tr>
                    <th>Titulo</th>
                    <th>Nombre</th>
                </tr>
                <%List<DtinfoPropuesta> propuestas = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                    for (DtinfoPropuesta dtp : propuestas) {%>
                <tr>
                    <td><p><%=dtp.getTitulo()%></p></td>&nbsp;&nbsp;&nbsp;
                    <td><textarea style="background-color: white; resize: none;width: 500px; height: 100px;"><%=dtp.getDescripcion()%></textarea></td> 
                </tr>
                <%}%>

            </table>

            <div style="text-align: center;margin-left: -1%;">

            <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
            <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
        </div>
        </div>
    </body>
</html>
