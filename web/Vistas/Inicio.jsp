<%-- 
    Document   : Inicio
    Created on : 18/09/2018, 01:12:17 AM
    Author     : Martin
--%>

<%@page import="clases.EstadoSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head >        
          <link href="css/RegistrarColaboracion.css" rel="stylesheet">
        <link rel="icon" type="image/png" href="Imagenes/icono.png"/>
        <title>Culturarte</title>

        <%
            String mensaje = (String) request.getAttribute("mensajeDesactivacion");
            if (mensaje != null) {%>
        <script type="text/javascript">
            window.alert("<%= mensaje%>");
            location.href = "/CulturarteWeb/ServletInicio";
        </script>
        <% }%>


    </head>
    <body>

      
            <jsp:include page="/Vistas/Barra_menu.jsp" />
        

          <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"></div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile" style="width: 252%;margin-left: -75%;font-size: 60%;">
                                        <jsp:include page="/Vistas/Tabs_Propuestas.jsp" />
                                     
                                        <br><br>
        <%
            if (request.getParameter("mensaje") != null) {
                out.print("</div>");
                out.print("<div class=\"alert alert-success alert-dismissable\" style=\"position:absolute; z-index:1; width: 26%;margin-top: -7%;margin-left: 1%\">");
                out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>");
                out.print("<strong>Mensaje: </strong>" + request.getParameter("mensaje") + "");
                out.print("</div>");
            }
        %>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br>        
        <jsp:include page="/Vistas/footer.jsp" />
    </body>

</html>
