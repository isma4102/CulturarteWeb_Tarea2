<%-- 
    Document   : MarcarFavorita
    Created on : 3/10/2018, 01:04:32 AM
    Author     : gabri
--%>

<%@page import="logica.Clases.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <%
            String favorito = (String) request.getAttribute("favorito");
            if (favorito != null) {%>
        <script type="text/javascript">

            window.onload = function () {
                alert("<%= favorito%>");
            }

        </script>
        <%
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/RegistrarColaboracion.css"/>
        <title>Marcar propuesta como favorita</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="formulario_ver_propuesta" style="margin-top: 7%">
            <h3 align="center">Propuestas</h3>
            <table class="table table-bordered table-hover" style="margin-right: 200px; width: 88%  ">

                <tr>
                    <th>Titulo</th>
                    <th>Descripción</th>
                </tr>
                <%List<DtinfoPropuesta> propuestas = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                    for (DtinfoPropuesta dtp : propuestas) {%>
                <tr>

                    <td><p><%=dtp.getTitulo()%></p></td>&nbsp;&nbsp;&nbsp;
                    <td><text style="background-color: white; resize: none;width: 300px; height: 100px;"><%=dtp.getDescripcion()%></text></td> 
                    <td>
                        <form action="ServletMarcarFavorita" method="POST">
                            <input  name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>
                            <input class="btn btn-primary"  onclick="submit()" type="button" value="Marcar como favorita"/>
                        </form>
                    </td>

                </tr>
                <%}%>

            </table>

            <a href="javascript:window.history.back();" class="btn btn-primary"> &laquo; Volver</a>

        </div>

        <br><br><br><br><br>        
        <jsp:include page="/Vistas/footer.jsp" />
    </body>
</html>
