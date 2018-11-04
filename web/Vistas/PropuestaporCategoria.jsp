<%-- 
    Document   : PropuestasporCategoria2
    Created on : 8/10/2018, 11:44:12 PM
    Author     : gabri
--%>

<%@page import="servicios.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
           
        <title>Culturarte</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp"/>
       
         <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"> </div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile">
        
                                <h2 style="text-align: center">Selecciona la categoria a filtrar...</h2>
        
        <div style="text-align: center;" class="dropdown formulario_ver_propuesta">
            <br><br>
            <form action="${pageContext.request.contextPath}/ServletPropuestaCategoria" method="POST">
                <select class="dropdown-toggle" name="cat">
                    <%List<String> categorias = (List<String>) request.getAttribute("Categorias");
                        for (String cat : categorias) {%>
                    <option><%=cat%></option>
                    <%}%>
                </select>
                <input class="oi btn" type="submit"  value="Buscar"/><br>
            </form>
        </div>
        <%String nom = (String) request.getAttribute("nombre");
            if (nom != null) {%>
        <div class="formulario_ver_propuesta" style="margin-top: 7%;margin-left: 3%;">

            <h3 align="center">Propuestas con categoria <%=nom%></h3>
            <table class="table table-bordered table-hover" style="margin-left: 30%; width: 35%  ">
                <tr>
                    <th>Titulo</th>
                    <th>Descripcion</th>
                    <th>Ver Info</th>
                </tr>
                <tbody>
                    <% List<DtinfoPropuesta> propuestas = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                        for (int i = 0; i < propuestas.size(); i++) {

                            out.print("<form class=\"form-signin\" action=\"ServletConsultarPropuesta\" method=\"POST\"> ");
                            out.print("<input style=\"border:none\" type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + propuestas.get(i).getTitulo() + "\" readonly=\"readonly\"/>");
                            out.print("<td><p>" + propuestas.get(i).getTitulo() + " </p></td>");
                            out.print("<td><p>" + propuestas.get(i).getDescripcion() + "</p></td>");
                            out.print("<td><button style=\"background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px\" type=\"input\" name=\"Ver\" class=\"btn btn-primary\"></button></td>");
                            out.print("</form>");
                            out.print("</tr>");

                        }
                    %>
                </tbody>
            </table>
        </div>
        <%}%>
        <div style="text-align: center;margin-left: -1%; margin-top: 3%;">

            <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
            <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
        </div>
        <br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <br><br>
        <jsp:include page="/Vistas/footer.jsp" />
    </body>
</html>
