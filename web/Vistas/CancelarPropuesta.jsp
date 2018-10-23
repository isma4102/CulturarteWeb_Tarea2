<%-- 
    Document   : CancelarPropuesta
    Created on : 10/10/2018, 01:26:15 AM
    Author     : Martin
--%>

<%@page import="servicios.DtNickTitProp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/RegistrarColaboracion.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="script/FiltrarTabla.js"></script>
        <script src="js/bootstrap.js"></script> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Consultar Propuesta</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />

        <table id="tabla" class="table table-bordered table-hover formulario" style="margin-left: 229px;width: 70%;">
            <thead>
            <h3 style="position: absolute;top: 76px;left: 657px;">Consulta de propuesta</h3>
            <form class="navbar-form navbar-right" >
                <input id="buscar" style="width: 216px;margin-left: 671px;margin-top: 139px;margin-bottom: -4px;" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />
            </form>

            <tr>
                <th style="color:black" class="active">Titulo</th>
                <th style="color:black" class="active">Categoria</th>
                <th style="color:black" class="active">Cancelar Propuesta</th>
            </tr>
        </thead>
        <div style="overflow: auto">
            <tbody>
                <%
                    List<DtNickTitProp> lista = (List<DtNickTitProp>) request.getAttribute("Lista");
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<form class=\"form-signin\" action=\"ServletCancelarPropuesta\" method=\"POST\"> ");
                        out.print("<input style=\"border:none\" type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + lista.get(i).getTitulo() + "\" readonly=\"readonly\"/>");
                        out.print("<td><p>" + lista.get(i).getTitulo() + " </p></td>");
                        out.print("<td><p>" + lista.get(i).getProponente() + "</p></td>");
                        out.print("<td><button style=\"background:url('/CulturarteWeb/Imagenes/cancelar.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px\" type=\"input\" name=\"Ver\" class=\"btn btn-primary\"></button></td>");
                        out.print("</form>");
                        out.print("</tr>");
                    }
                %>
            </tbody>
    </table>
    <br><br><br><br><br>        
    <jsp:include page="/Vistas/footer.jsp" /> 
</body>
</html>
