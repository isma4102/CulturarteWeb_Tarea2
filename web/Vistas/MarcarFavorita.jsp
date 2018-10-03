<%-- 
    Document   : MarcarFavorita
    Created on : 3/10/2018, 01:04:32 AM
    Author     : gabri
--%>

<%@page import="logica.Clases.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/marcarfavorita.css"/>
        <title>Marcar propuesta como favorita</title>
    </head>
    <body>
        <div class="propuestas" style="margin-top: 2%">
            <h3>Propuestas</h3>
            <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">
                <form action="ServletMarcarFavorita" method="POST">
                    <tr>
                        <th>Titulo</th>
                        <th>Nombre</th>
                    </tr>
                    <%List<DtinfoPropuesta> propuestas = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                        for (DtinfoPropuesta dtp : propuestas) {%>
                    <tr>
                        <td><input name="TituloP" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><textarea style="width: 300px; height: 100px;"><%=dtp.getDescripcion()%></textarea></td> 
                        <td><input name="consulta" type="submit" value="Marcar como favorita"/></td>
                    </tr>
                    <%}%>
                </form>
            </table>
        </div>
    </body>
</html>
