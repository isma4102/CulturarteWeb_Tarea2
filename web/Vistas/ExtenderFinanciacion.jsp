<%-- 
    Document   : Extender Financiación
    Created on : 08/10/2018, 12:16:40 AM
    Author     : Santiago.S
--%>

<%@page import="servicios.DtNickTitProp"%>
<%@page import="servicios.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Culturarte</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"> </div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile">
                                <table id="tabla" class="table table-bordered table-hover formulario" style="font-size: 74%;width: 70%;">
                                    <thead>
                                    <h3 style="text-align: center;top: 76px;left: 657px;">Propuestas</h3>

                                    <input id="buscar" style="margin-left: 30%;width: 216px;margin-bottom: -4px;" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />
                                    <br>

                                    <tr>
                                        <th style="color:black" class="active">Seleccionar</th>
                                        <th style="color:black" class="active">Titulo de Propuesta</th>
                                        <th style="color:black" class="active">Nombre del Proponente</th>
                                    </tr>
                                    </thead>
                                    <div style="overflow: auto">
                                        <tbody>
                                            <%
                                                List<DtNickTitProp> lista = (List<DtNickTitProp>) request.getAttribute("lista_propuestas");
                                                for (int i = 0; i < lista.size(); i++) {
                                                    out.print("<tr>");
                                                    out.print("<form class=\"form-signin\" action=\"ServletExtenderFinanciacion\" method=\"POST\"> ");
                                                    out.print("<td><button style=\"background:url('/CulturarteWeb/Imagenes/selecc.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px\"  type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\"></button></td>");
                                                    out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + lista.get(i).getTitulo() + "\" readonly=\"readonly\"/>");
                                                    out.print("<td><p> " + lista.get(i).getTitulo() + "</p></td>");
                                                    out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"Proponente\" value=\"" + lista.get(i).getProponente() + "\" readonly=\"readonly\"/>");
                                                    out.print("<td><p> " + lista.get(i).getProponente() + "</p></td>");
                                                    out.print("</form>");
                                                    out.print("</tr>");
                                                }
                                            %>
                                        </tbody>
                                </table>
                                <br><br><br><br>
                               
                                 
                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
                                        
   <jsp:include page="/Vistas/footer.jsp" />
    </body>
</html>
