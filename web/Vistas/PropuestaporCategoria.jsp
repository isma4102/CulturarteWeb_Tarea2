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
        <jsp:include page="/Vistas/Barra_menu.jsp"/>
        <br><br><br>
        <div style="align-content: center;width: 100%">
            <h1>Selecciona la categoria a filtrar...</h1>
        </div>
        <div style=" right: -40%;width: 40%;height: 30%" class="dropdown formulario_ver_propuesta">
            <br><br>
            <form action="${pageContext.request.contextPath}/ServletPropuestaCategoria" method="POST">
                <select class="btn btn-default dropdown-toggle" name="cat">
                    <%List<String> categorias = (List<String>) request.getAttribute("Categorias");
                        for (String cat : categorias) {%>
                    <option><%=cat%></option>
                    <%}%>
                </select>
                <input class="oi btn" type="submit"  value="Buscar"/><br>
            </form>
        </div>
        <div>
            <a href="ServletInicio" class="btn btn-primary" style="margin-left: 45%; margin-top: 5%"> &laquo; Volver a inicio</a>
        </div>
        <br><br><br><br>
        <jsp:include page="/Vistas/footer.jsp" />
    </body>
</html>
