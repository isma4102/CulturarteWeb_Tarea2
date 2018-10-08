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
                                    <%out.print(propuestaSelec.getTipoRetorno());%>
                                </div>
                            </div>
                           
                            <h4 align="center" class="modal-title" id="classModalLabel">
                                Colaboradores
                            </h4>
                            <div style="  overflow-x: auto;">
                                <table class="table  table-bordered table-hover" style="width: 70%;">
                                    <thead>
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

                        </div>
                        <div class="modal-footer">
                            <a href="javascript:window.history.back();" class="btn btn-danger"> &laquo; Volver</a>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
