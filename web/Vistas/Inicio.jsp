<%-- 
    Document   : Inicio
    Created on : 18/09/2018, 01:12:17 AM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Culturarte</title>

    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <jsp:include page="/Vistas/Tabs_Propuestas.jsp" />
         <%
                if(request.getParameter("mensaje") != null){
                out.print("</div>");
                out.print("<div class=\"alert alert-success alert-dismissable\" style=\"position:absolute; z-index:1; width: 26%;margin-top: -7%;margin-left: 1%\">");
                out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>");
                out.print("<strong>Mensaje: </strong>"+ request.getParameter("mensaje") + "");
                out.print("</div>");
                }
            %>
    </body>
</html>
