<%-- 
    Document   : newjspMostrarInfoPropuesta
    Created on : 18/09/2018, 10:40:35 PM
    Author     : Santiago.S
--%>
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
        <title>Registrar Colaboración</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
        <script>
            $(document).ready(function ()
            {
                $("#mostrarmodal").modal("show");
            });
        </script>
    </head>
    <body>

        <%
            DtinfoPropuesta propuestaSelec = (DtinfoPropuesta) request.getAttribute("Propuestaseleccionada");
        
        %>

        <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 align="center">Informacion de la Propuesta</h3>
                    </div>
                    <div class="modal-body">
                        <div id="mostrarinfo">
                            <div>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon">Imagen</span>
                                    <img src="" class="img-rounded">
                                </div>
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
                                    <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getTipoEspec());%>"/>
                                </div>
                                </br>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon">Lugar</span>
                                    <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getLugar());%>"/>
                                </div>
                                </br>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon">Fecha de relizacion</span>
                                    <%         Date now = new Date();
                                        SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
                                         out.print("<input readonly type=\"text\" class=\"form-control\" placeholder=\""+ sf.format(propuestaSelec.getFechaReal().getTime()) + "\"/>");
                                       %>
                                </div>
                                </br>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon">Precio de entrada</span>
                                    <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getPrecio());%>"/>
                                </div>
                                </br>
                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon">Monto final</span>
                                    <input readonly type="text" class="form-control" placeholder="<%out.print(propuestaSelec.getMonto());%>"/>
                                </div>
                                </br>
                            </div>
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
