<%-- 
    Document   : Inicio
    Created on : 18/09/2018, 01:12:17 AM
    Author     : Martin
--%>

<%@page import="clases.EstadoSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <link href="css/Indicador_Carga.css" rel="stylesheet">
        <title>Culturarte</title>

    </head>
    <body>


        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <jsp:include page="/Vistas/Tabs_Propuestas.jsp" />

        <%
            if (request.getParameter("mensaje") != null) {
                out.print("</div>");
                out.print("<div class=\"alert alert-success alert-dismissable\" style=\"position:absolute; z-index:1; width: 26%;margin-top: -7%;margin-left: 1%\">");
                out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>");
                out.print("<strong>Mensaje: </strong>" + request.getParameter("mensaje") + "");
                out.print("</div>");
            }
        %>

        <!-- Se muestra un mensaje cuando se cargaron los datos de prueba -->
        <div style="display: none;" id="datos_de_prueba_carga" class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Exito!</strong> Se cargaron los datos de prueba
        </div>
        <script>
            <% if (request.getSession().getAttribute("datos_de_prueba") != null) {
            %>
            var var2 = document.getElementById("datos_de_prueba_carga");
            var2.style = "margin-top: 2%;margin-right: -16%;margin-left: 73%;";
            var2.style.display = "block";
            <%
                    request.getSession().removeAttribute("datos_de_prueba");
                }%>
        </script>
        <br>
        <br>
        <jsp:include page="/Vistas/footer.jsp"/>   



    </body>
</html>
