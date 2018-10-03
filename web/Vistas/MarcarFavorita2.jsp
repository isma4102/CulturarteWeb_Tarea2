<%-- 
    Document   : MarcarFavorita2
    Created on : 3/10/2018, 03:00:40 PM
    Author     : gabri
--%>

<%@page import="java.lang.Boolean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%Boolean exito=(Boolean)request.getAttribute("Exito");
        if(exito){%>
        <h1>Propuesta marcada favorita con exito</h1>
        <%}else{%>
        <h1>No se pudo marcar la propuesta como favorita</h1>
        <%}%>
    </body>
</html>
