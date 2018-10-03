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

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/buscadorCSS.css">
    <title>Busqueda</title>
</head>


<%@page import="ControladorServlet.servletBuscador"%>
<%  List<DtinfoPropuesta> lista = new ArrayList<>();
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
<br>
<br>
<br>
<div>
    <input style="display: none" id="busqueda" type="text" value="<%=busqueda%>"></input>
    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Ordenar<span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li id="filtro-estado" value="estado"><a>Estado</a></li>
            <li id="filtro-alfa" value="alfa"><a>Alfabeticamente A-Z</a></li>
            <li id="filtro-fecha" value="fecha"><a>Fecha creacion(decendiente)</a></li>
        </ul>
    </div> 
    <div id="resultado" style=" margin-left: 225px; width: 700px">
        <h1>Resultado de la busqueda</h1>
        <h3>Se encontraron <%=lista.size()%> resultados</h3>
        <%for (int i = 0; i < lista.size(); i++) {
                DtinfoPropuesta p = lista.get(i);
        %>
        <div id="elemento<%=i%>" class="panel panel-primary">
            <div style="display: inline-block; width: 100%" class="btn btn-info panel-heading" data-toggle="collapse" data-target="#descripcion<%=i%>" ><div class="Titulo"><%=p.getTitulo()%></div><hr class="linea"><div class="Lugar"><%=p.getLugar()%></div></div>
            <div id="descripcion<%=i%>" class="collapse panel-footer Descripcion"><%=p.getDescripcion()%></div>
        </div>
        <%}
        %>   
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="script/filtroBusqueda.js"></script>        


