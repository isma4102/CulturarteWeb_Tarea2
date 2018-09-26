<%-- 
    Document   : RegColaboracion
    Created on : 18/09/2018, 07:14:01 PM
    Author     : Santiago.S
--%>

<%@page import="logica.Clases.DtinfoPropuesta"%>
<%@page import="logica.Clases.DtinfoColaborador"%>
<%@page import="logica.Clases.DtNickTitProp"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/RegistrarColaboracion.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Registrar Colaboración</title>

    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />

        <table class="table table-bordered table-hover formulario" style="margin-left: 229px;width: 70%;">
            <thead>
            <h3 style="position: absolute;top: 76px;left: 657px;">Registro de propuestas</h3>
            <form class="navbar-form navbar-right">
                <input style="width: 216px;margin-left: 671px;margin-top: 139px;margin-bottom: -4px;" type="text" class="form-control" placeholder="Buscar" />
            </form>

            <tr>
                <th style="color:black" class="active">Registrar</th>
                <th style="color:black" class="active">Titulo de Propuesta</th>
                <th style="color:black" class="active">Nombre del Proponente</th>
                <th style="color:black" class="active">Ver</th>
            </tr>
        </thead>
        <div style="overflow: auto">
            <tbody>
                <%
                    List<DtNickTitProp> lista = (List<DtNickTitProp>) request.getAttribute("lista_propuestas");
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<form class=\"form-signin\" action=\"ServletRegistroColaboracion\" method=\"POST\"> ");
                        out.print("<td><button style=\"background:url('/CulturarteWeb/Imagenes/selecc.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px\"  type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\"></button></td>");
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
