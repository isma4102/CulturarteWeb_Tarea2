<%-- 
    Document   : AgregarComentario
    Created on : 01/10/2018, 04:56:39 PM
    Author     : Santiago.S
--%>

<%@page import="logica.Clases.DtNickTitProp"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
    <head>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <link href="css/bootstrap.css" rel="stylesheet">
        <%
            String comentarProp = (String) request.getAttribute("comentarProp");
            if (comentarProp != null) {%>
        <script type="text/javascript">

            window.onload = function () {
                alert("<%= comentarProp%>");
            }

        </script>
        <%
            }
        %>

        <meta name="viewport" content="width=device-width, initial-scale=1">       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Culturarte:: Comentar Propuesta</title>
    </head>

    <body>

        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <br>
        <br>
        <br>
        <br> 
        <h3 style="position: absolute;top: 76px;left: 657px;">Lista de Propuestas Financiadas</h3>
        <br>
        <br>
        <br>
        <br>
        <table class="table table-bordered table-hover formulario" style="margin-left: 229px;width: 70%;">
            <thead>          

            <th bgcolor="white">Titulo de Propuesta</th>
            <th bgcolor="white">Nombre del Proponente</th>
            <th bgcolor="white" style="text-align:center">Comentar</th>
            <th bgcolor="white" style="text-align:center">Confirmar</th>

        </thead>

        <tbody>
            <%
                List<DtNickTitProp> lista = (List<DtNickTitProp>) request.getAttribute("lista_propuestascomentar");
                for (int i = 0; i < lista.size(); i++) {
                    out.print("<tr>");
                    out.print("<label for=\"" + i + "\"></label></td>");
                    out.print("<td>" + lista.get(i).getTituloP() + "</td>");
                    out.print("<td>" + lista.get(i).getProponente() + "</td>");
            %>


        <form action="ServletComentarPropuesta" method="post">
            <td align="center">   
                <input type="hidden" name="TituloP" value="<%= lista.get(i).getTituloP()%>">
                <textarea name="texto" placeholder="Escriba un Comentario..."  required style="background-color: white; resize: none;width: 300px; height: 100px;" ></textarea>
            </td>
            <td><input type="button" class="btn btn-primary" value="Comentar" onclick="submit()"/></td>
        </form>    




        <%

                out.print("</tr>");

            }
        %>
    </tbody>
</table>
<br><br><br><br><br>        
<jsp:include page="/Vistas/footer.jsp" />    
</body>
</html>
