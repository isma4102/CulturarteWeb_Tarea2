<%-- 
    Document   : ConsultarPropuesta
    Created on : 16/09/2018, 11:20:12 PM
    Author     : Martin
--%>

<%@page import="logica.Clases.DtNickTitProp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/RegistrarColaboracion.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Consultar Propuesta</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />

        <table class="table table-bordered table-hover formulario" style="margin-left: 229px;width: 70%;">
            <thead>
            <h3 style="position: absolute;top: 76px;left: 657px;">Registro de propuestas</h3>
            <form class="navbar-form navbar-right" >
                <input style="width: 216px;margin-left: 671px;margin-top: 139px;margin-bottom: -4px;" type="text" name="Buscar" class="form-control" placeholder="Buscar" />
            </form>

            <tr>
                <th style="color:black" class="active">Titulo</th>
                <th style="color:black" class="active">Categoria</th>
                <th style="color:black" class="active">Ver informacion</th>
            </tr>
        </thead>
        <div style="overflow: auto">
            <tbody>
                <%
                    List<DtNickTitProp> lista = (List<DtNickTitProp>) request.getAttribute("listaPropuestas");
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<form class=\"form-signin\" action=\"ServletConsultarPropuesta\" method=\"POST\"> ");
                        out.print("<td><input style=\"border:none\" type=\"text\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + lista.get(i).getTituloP() + "\" readonly=\"readonly\"/></td>");
                        out.print("<td><input style=\"border:none\" type=\"text\" class=\"form-control-plaintext\" name=\"Proponente\" value=\"" + lista.get(i).getProponente() + "\" readonly=\"readonly\"/></td>");
                        out.print("<td><button style=\"background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px\" type=\"input\" name=\"Ver\" class=\"btn btn-primary\"></button></td>");
                        out.print("</form>");
                        out.print("</tr>");
                    }
                %>
            </tbody>
    </table>
</body>
</html>
