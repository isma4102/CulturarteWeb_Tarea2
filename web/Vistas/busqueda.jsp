<%-- 
    Document   : busqueda
    Created on : 22-sep-2018, 13:20:24
    Author     : Lucas
--%>

<%@page import="servicios.DtConsultaPropuesta"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="css/buscadorCSS.css">
    <title>Culturarte</title>
</head>


<%@page import="ControladorServlet.servletBuscador"%>
<%  List<DtConsultaPropuesta> lista = new ArrayList<>();
    lista = (ArrayList) request.getAttribute("resultado");
    if (lista.isEmpty()) {%>
<script>
    window.alert("No se a encontrado resultados para su busqueda");
    location.href = "index.html";
</script>
<% }%>
<%
    String busqueda = request.getAttribute("busqueda").toString();
%>


<jsp:include page="/Vistas/Barra_menu.jsp" />
<input id="cantidad" style="display: none" type="text" value="<%= lista.size()%>"/>
<br>
<div>
    <input style="display: none" id="busqueda" type="text" value="<%=busqueda%>"></input>
    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Ordenar</button>
        <ul class="dropdown-menu">
            <form action="servletBuscador" method="GET">
                <input style="display: none" type="text" name="busqueda" value="<%= busqueda%>"/>
                <input class="btn" type="submit" name="filtro" value="Estado"></input><br>
                <input class="btn" type="submit" name="filtro" value="Alfabeticamente"></input><br>
                <input class="btn" type="submit" name="filtro" value="Fecha"></input>
            </form>
        </ul>
    </div> 
    <div id="resultado" style=" margin-left: 25%; width: 700px">
        <h1>Resultado de la busqueda</h1>
        <h3>Se encontraron <%=lista.size()%> resultados</h3>
        <%for (int i = 0; i < lista.size(); i++) {
                DtConsultaPropuesta p = lista.get(i);
        %>
        <div style="background-color: #444; border-color: #444" id="elemento<%=i%>" class="panel panel-primary">
            <div style="height: 30%;width: 100%" class="btn btn-info panel-heading" data-toggle="collapse" data-target="#descripcion<%=i%>" >
                <div style="float: left;width: 30% ; height: 30%" class="img-thumbnail">
                    <% out.print("<img style=\"width: 100%; height:100%\" src=\"/CulturarteWeb/ServletImagenes?TituloP=" + p.getTitulo() + "\" >");%><br>
                    <div class="Estado" style="float: left"><h5 style="color: black;font-weight: bold" ><%=p.getEstadoActual()%></h5></div>
                </div>
                <div><h3 class="Titulo"><%=p.getTitulo()%></h3></div><br><br>
                <div style="font-weight: bold;float: right" class="Lugar"><%=p.getLugar()%></div><br>
                <div style="font-weight: bold;float: right" class="Lugar"><%=p.getFechaR()%></div>
            </div>
            <div id="descripcion<%=i%>" class="collapse panel-footer Descripcion"><h4 style="font-weight: bold">Descripcion</h4><%=p.getDescripcion()%></div>
        </div>
        <%}
        %>   
    </div>
</div>

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<jsp:include page="/Vistas/footer.jsp" />


