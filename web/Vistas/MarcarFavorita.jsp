<%-- 
    Document   : MarcarFavorita
    Created on : 3/10/2018, 01:04:32 AM
    Author     : gabri
--%>

<%@page import="logica.Clases.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%
            String favorito = (String) request.getAttribute("favorito");
            if (favorito != null) 
    {%>
        <script type="text/javascript">
            
    window.onload = function(){
      alert("<%= favorito%>");
    }
          
        </script>
        <%
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/marcarfavorita.css"/>
        <title>Marcar propuesta como favorita</title>
    </head>
    <body>
        <div class="propuestas" style="margin-top: 2%">
            <h3>Propuestas</h3>
            <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">

                <tr>
                    <th>Titulo</th>
                    <th>Nombre</th>
                </tr>
                <%List<DtinfoPropuesta> propuestas = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                    for (DtinfoPropuesta dtp : propuestas) {%>
                <tr>

                    <td><input type="text" value="<%=dtp.getTitulo()%>"/></td>&nbsp;&nbsp;&nbsp;
                    <td><textarea style="width: 300px; height: 100px;"><%=dtp.getDescripcion()%></textarea></td> 
                    <td>
                        <form action="ServletMarcarFavorita" method="POST">
                            <input name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>
                            <input  onclick="submit()" type="button" value="Marcar como favorita"/>
                        </form>
                    </td>

                </tr>
                <%}%>

            </table>
        </div>
    </body>
</html>
