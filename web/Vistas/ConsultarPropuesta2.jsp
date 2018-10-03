<%-- 
    Document   : ConsultarPropuesta2
    Created on : 30/09/2018, 04:19:30 PM
    Author     : Martin
--%>
<%@page import="logica.Clases.DtConsultaPropuesta"%>
<%@page import="logica.Clases.DtConsultaPropuesta2"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="logica.Clases.DtinfoColaborador"%>
<%@page import="java.util.List"%>
<%@page import="logica.Clases.DtinfoPropuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Información de Propuesta</title>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script>
            $(document).ready(function ()
            {
                $("#mostrarmodal").modal("show");
            });
        </script>
    </head>
    <body>

        <%
            DtConsultaPropuesta propuestaSelec = (DtConsultaPropuesta) request.getAttribute("propuesta");

        %>

        <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 align="center">Información de la Propuesta de <% out.print(propuestaSelec.getNickproponente()); %></h3>
                    </div>
                    <div class="modal-body">
                        <div id="mostrarinfo">
                            </br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Titulo</span>
                                <input readonly  type="text" class="form-control" placeholder="<% out.print(propuestaSelec.getTitulo()); %>"/>
                            </div>
                            </br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Descripción</span>
                                <textarea readonly style="height: 76px;resize: none" class="form-control rounded-0" rows="20"><%out.print(propuestaSelec.getDescripcion());%></textarea>
                            </div>
                            </br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Tipo de espectaculo</span>
                                <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getCategoria());%>"/>
                            </div>
                            </br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Lugar</span>
                                <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getLugar());%>"/>
                            </div>
                            </br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Fecha de relizacion</span>
                                <input readonly type="text" class="form-control" placeholder=" <% out.print(propuestaSelec.getFechaR());%>">
                            </div>
                            </br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Precio de entrada</span>
                                <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getMontoE());%>"/>
                            </div>
                            </br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Monto final</span>
                                <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getMontoTot());%>"/>
                            </div>
                            </br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Monto Actual</span>
                                <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getMontoActual());%>"/>
                            </div>
                            <br>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">Tipo de retorno</span>
                                <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getTipoRetorno());%>"/>
                            </div>


                            <table class="table  table-bordered table-hover" style="margin-left: 229px;width: 70%;">
                                <thead>
                                <h3 align="center" style="position: absolute;top: 76px;left: 657px;">Colaboradores</h3>
                                <form class="navbar-form navbar-right">
                                    <br>
                                    <div class="input-group input-group-sm">
                                        <input type="text" class="form-control" placeholder="Buscar" />
                                    </div>

                                </form>

                                <tr>   
                                    <th class="active">NickName</th>
                                    <th class="active">Nombre</th>
                                    <th class="active">Apellido</th>
                                    <th class="active">Monto Colab.</th>
                                    <th class="active">Fecha R.</th>
                                </tr>
                                </thead>
                                <div style="overflow: auto">
                                    <tbody>
                                        <%
                                            List<DtConsultaPropuesta2> lista = (List<DtConsultaPropuesta2>) request.getAttribute("listaC");
                                            for (int i = 0; i < lista.size(); i++) {
                                                out.print("<tr>");
                                                out.print("<td><input style=\"border:none\" type=\"text\" class=\"form-control-plaintext\" name=\"Nick\" value=\"" + lista.get(i).getNickColab() + "\" readonly=\"readonly\"/></td>");
                                                out.print("<td><input style=\"border:none\" type=\"text\" class=\"form-control-plaintext\" name=\"Nombre\" value=\"" + lista.get(i).getNombreColab() + "\" readonly=\"readonly\"/></td>");
                                                out.print("<td><input style=\"border:none\" type=\"text\" class=\"form-control-plaintext\" name=\"Apellido\" value=\"" + lista.get(i).getApellidoColab() + "\" readonly=\"readonly\"/></td>");
                                                out.print("<td><input style=\"border:none\" type=\"text\" class=\"form-control-plaintext\" name=\"MontoC\" value=\"" + lista.get(i).getMontoColab() + "\" readonly=\"readonly\"/></td>");
                                                out.print("<td><input style=\"border:none\" type=\"text\" class=\"form-control-plaintext\" name=\"FechaR\" value=\"" + lista.get(i).getFechaR() + "\" readonly=\"readonly\"/></td>");
                                                out.print("</form>");
                                                out.print("</tr>");
                                            }
                                        %>
                                    </tbody>
                            </table>

                        </div>
                        <div class="modal-footer">
                            <a href="javascript:window.history.back();" class="btn btn-danger"> &laquo; Volver</a>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
