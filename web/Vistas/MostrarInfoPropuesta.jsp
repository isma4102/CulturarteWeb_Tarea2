<%-- 
    Document   : newjspMostrarInfoPropuesta
    Created on : 18/09/2018, 10:40:35 PM
    Author     : Santiago.S
--%>
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
        <title>Culturarte</title>
        <link href="css/RegistrarColaboracion.css" rel="stylesheet">
        <script>
            $(document).ready(function ()
            {
                $("#mostrarmodal").modal("show");
            });
        </script>
    </head>
    <body>

        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <%
            DtinfoPropuesta propuestaSelec = (DtinfoPropuesta) request.getAttribute("Propuestaseleccionada");

        %>

  
        <div class="modal-content formulario" style="margin-top: 8%;">
                    <div class="modal-header">
                        <h3 align="center">Información de la Propuesta</h3>
                    </div>
                    <div class="modal-body">
                        <div id="mostrarinfo">
                            <div>
                                <div  style="width: 38%;margin: 0 auto">
                                    <% out.print("<img style=\"width: 139%;margin-left: -15%;\" src=\"/CulturarteWeb/ServletImagenes?TituloP=" + propuestaSelec.getTitulo() + "\" class=\"img-rounded\" alt=\"avatar\">");
                                    %>
                                </div>
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
                                        <%out.print(propuestaSelec.getTipoEspec());%>
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
                                        <h3 class="panel-title">Fecha de relización</h3>
                                    </div>
                                    <div class="panel-body" style="padding: 1%">
                                        <%         Date now = new Date();
                                            SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
                                            out.print(sf.format(propuestaSelec.getFechaReal().toGregorianCalendar().getTime()));
                                        %>
                                    </div>
                                </div>

                                <div class="panel panel-primary">
                                    <div class="panel-heading" style="padding: 1%">
                                        <h3 class="panel-title">Precio de entrada</h3>
                                    </div>
                                    <div class="panel-body" style="padding: 1%">
                                        <%out.print(propuestaSelec.getPrecio());%>
                                    </div>
                                </div>

                                <div class="panel panel-primary">
                                    <div class="panel-heading" style="padding: 1%">
                                        <h3 class="panel-title">Monto final</h3>
                                    </div>
                                    <div class="panel-body" style="padding: 1%">
                                        <%out.print(propuestaSelec.getMonto());%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="javascript:window.history.back();" class="btn btn-primary"> &laquo; Volver</a>
                    </div>
                </div>
              <jsp:include page="/Vistas/footer.jsp" /> 

    </body>
</html>
