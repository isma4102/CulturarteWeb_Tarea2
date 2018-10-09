<%-- 
    Document   : PropuestaporCategoria
    Created on : 8/10/2018, 02:04:10 PM
    Author     : gabri
--%>

<%@page import="java.util.HashMap"%>
<%@page import="logica.Clases.Categoria"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.Map"%>
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
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="formulario_ver_propuesta" style="margin-top: 7%; margin-left:45% ">
            <form action="${pageContext.request.contextPath}/ServletPropuestaCategoria" method="POST">
                <input  type="submit"  value="Buscar"/>
                <select name="cat">
                    <%List<String> categorias = (List<String>) request.getAttribute("Categorias");
                        for (String cat : categorias) {%>
                    <option><%=cat%></option>
                    <%}%>
                </select>
            </form>
        </div>
       
        <a href="ServletInicio" class="btn btn-primary" style="margin-left: 45%; margin-top: 5%"> &laquo; Volver a inicio</a>
    </body>
</html>
