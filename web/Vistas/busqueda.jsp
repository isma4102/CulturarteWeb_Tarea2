<%-- 
    Document   : busqueda
    Created on : 22-sep-2018, 13:20:24
    Author     : Lucas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="logica.Clases.DtinfoPropuesta"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="css/bootstrap.css"> 
        <link rel="stylesheet" href="css/">
        <title>Busqueda</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#verMas").hover(function () {
                document.getElementById('descripcion').style.display = "block";
                };
            });
        </script>
    </head>
    <body>
        <%            List<DtinfoPropuesta> lista = new ArrayList<>();
            lista = (ArrayList) request.getAttribute("resultado");
            if (lista.isEmpty()) {%>
        <script>
            window.alert("No se a encontrado resultados para su busqueda");
            location.href = "index.html";
        </script>
        <% }%>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <br>
        <br>
        <br>
        <br>
        
        <div style=" margin-left: 225px; width: 700px">
            <h1>Resultado de la busqueda</h1>
            <h3>Se encontraron <%=lista.size()%> resultados</h3>
            <%for (int i = 0; i < lista.size(); i++) {
                    DtinfoPropuesta p = lista.get(i);
            %>
            <div class="panel panel-primary">
                <div class="panel-heading"><td><%=p.getTitulo()%></td><td><%=p.getLugar()%></td><td><button id="verMas" type="submit" class="glyphicon-plus" type="button"/></td></div>
                <div id="descripcion" style="display: none"><td><%=p.getDescripcion()%></td></div>
            </div><br>

            <%}
            %>   
        </div>
    </body>
</html>
