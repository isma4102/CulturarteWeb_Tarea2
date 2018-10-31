<%-- 
    Document   : AgregarComentario
    Created on : 01/10/2018, 04:56:39 PM
    Author     : Santiago.S
--%>

<%@page import="servicios.DtNickTitProp"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
    <head>
         <link href="css/RegistrarColaboracion.css" rel="stylesheet">        <script type="text/javascript" src="script/FiltrarTabla.js"></script>
         
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
         <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"> </div>
         <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile" style="width: 252%;margin-left: -75%;font-size: 60%;">
       
        <h2 style="text-align: center;top: 76px;left: 657px;">Lista de Propuestas Financiadas</h2>
      
        
        <input id="buscar" style="width: 24%;margin-left: 38%;" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />
        <table id="tabla" class="table table-bordered table-hover formulario" style="margin-left: 229px;width: 70%;">
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
                    out.print("<td>" + lista.get(i).getTitulo() + "</td>");
                    out.print("<td>" + lista.get(i).getProponente() + "</td>");
            %>


        <form action="ServletComentarPropuesta" method="post">
            <td align="center">   
                <input type="hidden" name="TituloP" value="<%= lista.get(i).getTitulo()%>">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    
        <br>
<jsp:include page="/Vistas/footer.jsp" />    
</body>
</html>
