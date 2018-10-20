<%-- 
    Document   : ConsultarPropuesta2
    Created on : 30/09/2018, 04:19:30 PM
    Author     : Martin
--%>
<%@page import="servicios.TipoE"%>
<%@page import="servicios.DtUsuario"%>
<%@page import="servicios.DtConsultaPropuesta"%>
<%@page import="servicios.DtConsultaPropuesta2"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="servicios.DtinfoColaborador"%>
<%@page import="java.util.List"%>
<%@page import="servicios.DtinfoPropuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Información de Propuesta</title>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>


    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />

        <%
            DtConsultaPropuesta propuestaSelec = (DtConsultaPropuesta) request.getAttribute("propuesta");

        %>

        <div class="modal-content formulario" style="margin-top: 8%;width: 32%;margin-left: 34%;">
            <div class="modal-header">
                <h3 align="center">Información de la Propuesta de <% out.print(propuestaSelec.getNickproponente()); %></h3>
                <div class="modal-body">
                    <div id="mostrarinfo">
                        <div style="width: 41%;margin: 0 auto">
                            <% out.print("<img style=\"width: 139%;margin-left: -15%;\" src=\"/CulturarteWeb/ServletImagenes?TituloP=" + propuestaSelec.getTitulo() + "\" class=\"img-rounded\" alt=\"avatar\">");
                            %>
                        </div>
                        </br>
                        </br>
                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Titulo</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <% out.print(propuestaSelec.getTitulo()); %>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Descripción</h3>
                            </div>
                            <textarea readonly style="background-color: white; height: 76px;resize: none" class="form-control rounded-0" rows="20"><%out.print(propuestaSelec.getDescripcion());%></textarea>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Tipo de espectaculo</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <%out.print(propuestaSelec.getCategoria());%>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Lugar</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <%out.print(propuestaSelec.getLugar());%>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Estado Actual</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <%if (propuestaSelec.getEstadoActual()== TipoE.EN_FINANCIACION.toString())
                                        out.print("En Financiacion");
                                    else if (propuestaSelec.getEstadoActual()== TipoE.NO_FINANCIADA.toString())
                                        out.print("No Financiada");
                                    else
                                        out.print(propuestaSelec.getEstadoActual());
                                    %>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Fecha de relizacion</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <% out.print(propuestaSelec.getFechaR());%>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Precio de entrada</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <%out.print(propuestaSelec.getMontoE());%>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Monto Final</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <%out.print(propuestaSelec.getMontoTot());%>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Monto Actual</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <%out.print(propuestaSelec.getMontoActual());%>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading" style="padding: 1%">
                                <h3 class="panel-title">Tipo de retorno</h3>
                            </div>
                            <div class="panel-body" style="padding: 1%">
                                <%out.print(propuestaSelec.getTipoRet());%>
                            </div>
                        </div>

                        <h4 align="center" class="modal-title" id="classModalLabel">
                            Colaboradores
                        </h4>
                        <% if (((List<DtConsultaPropuesta2>) (List<DtConsultaPropuesta2>) request.getAttribute("listaC")).isEmpty()) {
                                out.print("<h3 align=\"center\" class=\"panel-title\">No existen Colaboradores</h3>");
                            } else {%>

                        <div style="  overflow-x: auto;">
                            <table class="table  table-bordered table-hover" style="width: 70%;">
                                <thead>
                                    <tr>   
                                        <th class="active" style = "color: black" >NickName</th>
                                        <th class="active" style = "color: black" >Nombre</th>
                                        <th class="active" style = "color: black" >Apellido</th>
                                        <th class="active" style = "color: black" >Monto Colab.</th>
                                        <th class="active" style = "color: black" >Fecha R.</th>
                                    </tr>
                                </thead>
                                <div style="overflow: auto">
                                    <tbody>
                                        <%
                                            List<DtConsultaPropuesta2> lista = (List<DtConsultaPropuesta2>) request.getAttribute("listaC");
                                            for (int i = 0; i < lista.size(); i++) {
                                                out.print("<tr>");
                                                out.print("<td><p>" + lista.get(i).getNickColab() + "</p></td>");
                                                out.print("<td><p>" + lista.get(i).getNombreColab() + "</p></td>");
                                                out.print("<td><p>" + lista.get(i).getApellidoColab() + "</p></td>");
                                                out.print("<td><p>" + lista.get(i).getMontoColab() + "</p></td>");
                                                out.print("<td><p>" + lista.get(i).getFechaR() + "</p></td>");
                                                out.print("</tr>");
                                            }
                                        %>
                                    </tbody>
                            </table>
                        </div>
                        <% } %>         
                        <div class="modal-footer">
                            <%if (request.getSession().getAttribute("usuario_logueado") != null) {
                                    if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickname().compareTo(propuestaSelec.getNickproponente()) == 0) {
                                        if (propuestaSelec.getExtendible()) {
                                            out.print("<form class=\"form-signin\" action=\"ServletExtenderFinanciacion\" method=\"POST\">");
                                            out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + propuestaSelec.getTitulo() + "\" readonly=\"readonly\"/>");
                                            out.print("<button type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\">Extender Financiación</button>");
                                            out.print("</form>");
                                        } else if (propuestaSelec.getCancelable()) {
                                            out.print("<form class=\"form-signin\" action=\"ServletCancelarPropuesta\" method=\"POST\">");
                                            out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + propuestaSelec.getTitulo() + "\" readonly=\"readonly\"/>");
                                            out.print("<button type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\">Cancelar Propuesta</button>");
                                            out.print("</form>");
                                        }
                                    } else {
                                        if (propuestaSelec.getComentable()) {
                                            out.print("<form class=\"form-signin\" action=\"ServletComentarPropuesta\" method=\"POST\">");
                                            out.print("<textarea name=\"texto\" placeholder=\"Escriba un Comentario...\"  required style=\"background-color: white; resize: none;width: 300px; height: 100px;\" ></textarea>");
                                            out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + propuestaSelec.getTitulo() + "\" readonly=\"readonly\"/>");
                                            out.print("<button style=\"margin-top: -17%;margin-left: 12%;\" type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\">Comentar propuesta</button>");
                                            out.print("</form>");
                                        } else if (propuestaSelec.getColaborable()) {
                                            out.print("<form class=\"form-signin\" action=\"ServletRegistroColaboracion\" method=\"POST\">");
                                            out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + propuestaSelec.getTitulo() + "\" readonly=\"readonly\"/>");
                                            out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"Estado\" value=\"" + propuestaSelec.getEstadoActual() + "\" readonly=\"readonly\"/>");
                                            out.print("<button  type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\">Colaborar en la propuesta</button>");
                                            out.print("</form>");
                                        }
                                    }
                                }%>

                            <a href="javascript:window.history.back();" class="btn btn-danger"> &laquo; Volver</a>
                        </div>
                    </div>           
                </div>
            </div>
        </div>
        <br><br><br><br>
    </body>
    <jsp:include page="/Vistas/footer.jsp" />
</html>
