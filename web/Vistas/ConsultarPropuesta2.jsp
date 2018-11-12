<%-- 
    Document   : ConsultarPropuesta2
    Created on : 30/09/2018, 04:19:30 PM
    Author     : Martin
--%>
<%@page import="servicios.DtComentarios"%>
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
       <meta charset="UTF-8"/>
        <title>Culturarte</title>


    </head>
    <body class="hidden-sn grey-skin"> 
        <jsp:include page="/Vistas/Barra_menu.jsp" />

        <%
            List<DtComentarios> comentarios = (List<DtComentarios>) request.getAttribute("comentarios");
            DtConsultaPropuesta propuestaSelec = (DtConsultaPropuesta) request.getAttribute("propuesta");

        %>
        <div class="page-header header-filter" data-parallax="true" style="margin-top: -20px;background-color: #337ab7;"></div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="container bootstrap snippet" style="margin-top: 7%;">
                                <div class="row">
                                    <div class="col-sm-3"><!--left col-->
                                        <div style="width: 328%;margin-left: -361%;" class="card card-blog">
                                            <div class="card-header card-header-image">
                                                <a >
                                                    <img style="width: 314px;;height: 319px;" class="img" src="/CulturarteWeb/ServletImagenes?TituloP=<%=propuestaSelec.getTitulo()%>">
                                                    <div class="card-title">

                                                    </div>
                                                </a>
                                            </div>
                                            <div class="card-body">
                                                <h2 align="center" class="card-category text-info"><% out.print(propuestaSelec.getTitulo()); %></h2>
                                                <p style="height: 176px;" class="card-description">
                                                    <%out.print(propuestaSelec.getDescripcion());%>
                                                </p>
                                            </div>
                                        </div>
                                        <br>
                                    </div><!--/col-3-->
                                    <div style="font-size: 80%;margin-left: -29%;width: 103%;" class="container_tabs">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="active"><a href="#Informacion" role="tab" data-toggle="tab">Información</a></li>
                                            <li><a href="#Colaboradores" role="tab" data-toggle="tab">Colaboradores</a></li>
                                            <li><a href="#Comentarios" role="tab" data-toggle="tab">Comentarios</a></li>

                                        </ul>
                                        <div class="card-body ">
                                            <div class="tab-content text-center">
                                                <div style = "color:black" class="tab-pane active" id = "Informacion"> 
                                                    <hr>
                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Nombre</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getTitulo());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Autor</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getNickproponente());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Tipo de espectaculo</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getCategoria());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Lugar</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getLugar());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Estado Actual</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%if (propuestaSelec.getEstadoActual() == TipoE.EN_FINANCIACION.value().toString()) {
                                                                            out.print("En Financiacion");
                                                                        } else if (propuestaSelec.getEstadoActual() == TipoE.NO_FINANCIADA.value().toString()) {
                                                                            out.print("No Financiada");
                                                                        } else {
                                                                            out.print(propuestaSelec.getEstadoActual());
                                                                        }
                                                                    %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Fecha de relizacion</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getFechaR());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Precio de entrada</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getMontoE());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Monto final</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getMontoTot());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Monto actual</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getMontoActual());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-6">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading" style = "background-color: #637390;padding: 1%"
                                                                     > <h3 
                                                                        class="panel-title">Tipo de retorno</h3
                                                                    > </div> 
                                                                <div  class="panel-body" style = "padding: 1%"> 
                                                                    <%out.print(propuestaSelec.getTipoRet());%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div><!--/tab-pane-->

                                                <div style="color:black;color: black"  class="tab-pane" id="Colaboradores">


                                                    <hr>
                                                    <h2 align="center" class="modal-title" id="classModalLabel">
                                                        Colaboradores
                                                    </h2>
                                                    <% if (((List<DtConsultaPropuesta2>) (List<DtConsultaPropuesta2>) request.getAttribute("listaC")).isEmpty()) {
                                                            out.print("<h3 align=\"center\" class=\"panel-title\">No existen Colaboradores</h3>");
                                                        } else {%>

                                                    <div style="  overflow-x: auto;">
                                                        <table class="table  table-bordered table-hover" >
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
                                                                    if (propuestaSelec.isEsExtendible()) {
                                                                        out.print("<form class=\"form-signin\" action=\"ServletExtenderFinanciacion\" method=\"POST\">");
                                                                        out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + propuestaSelec.getTitulo() + "\" readonly=\"readonly\"/>");
                                                                        out.print("<button type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\">Extender Financiación</button>");
                                                                        out.print("</form>");
                                                                    } else if (propuestaSelec.isEsCancelable()) {
                                                                        out.print("<form class=\"form-signin\" action=\"ServletCancelarPropuesta\" method=\"POST\">");
                                                                        out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + propuestaSelec.getTitulo() + "\" readonly=\"readonly\"/>");
                                                                        out.print("<button type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\">Cancelar Propuesta</button>");
                                                                        out.print("</form>");
                                                                    }
                                                                } else {
                                                                    if (propuestaSelec.isEsColaborable()) {
                                                                        out.print("<form class=\"form-signin\" action=\"ServletRegistroColaboracion\" method=\"POST\">");
                                                                        out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + propuestaSelec.getTitulo() + "\" readonly=\"readonly\"/>");
                                                                        out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"Estado\" value=\"" + propuestaSelec.getEstadoActual() + "\" readonly=\"readonly\"/>");
                                                                        out.print("<button  type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\">Colaborar en la propuesta</button>");
                                                                        out.print("</form>");
                                                                    }
                                                                }
                                                                out.print("<hr>");
                                                            }%>
                                                    </div>
                                                </div>

                                                <div style="color:black"  style="color: black"  class="tab-pane" id="Comentarios">
                                                    <% if (!comentarios.isEmpty()) {
                                                            for (int i = 0; i < comentarios.size(); i++) {%>
                                                    <div class="row">
                                                        <div class="col-sm-1">
                                                            <div style="width: 249%;" class="thumbnail">
                                                                <img class="img-responsive user-photo" src="/CulturarteWeb/ServletImagenes?nickname=<%= comentarios.get(i).getColaborador()%>">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <div style="width: 240%;" class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <strong><%= comentarios.get(i).getColaborador()%></strong> <span class="text-muted">comentó esta propuesta</span>
                                                                </div>
                                                                <div class="panel-body">
                                                                    <%= comentarios.get(i).getComentario()%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <% }
                                                    } else {%>

                                                    <p> No hay comentarios en esta propuesta </p>
                                                    <hr>
                                                    <%  }%>

                                                    <%
                                                        if (request.getSession().getAttribute("usuario_logueado") != null) {
                                                            if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickname().compareTo(propuestaSelec.getNickproponente()) != 0) {
                                                                if (propuestaSelec.isEsComentable()) {
                                                                    out.print("<form class=\"form-signin\" action=\"ServletComentarPropuesta\" method=\"POST\">");
                                                                    out.print("<input type=\"hidden\" name=\"TituloP\" value=\"" + propuestaSelec.getTitulo() + "\">");
                                                                    out.print("<textarea name=\"texto\" placeholder=\"Escriba un Comentario...\"  required style=\"background-color: white; resize: none;width: 300px; height: 100px;\" ></textarea>");
                                                                    out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"texto\" value=\"" + propuestaSelec.getTitulo() + "\" readonly=\"readonly\"/>");
                                                                    out.print("<button style=\"margin-top: -9%;margin-left: 1%;\" name=\"Comentar\" type=\"submit\" class=\"btn btn-primary\"><i class=\"fa fa-share\"></i>Comentar</button>");
                                                                    out.print("</form>");
                                                                } else {
                                                                    out.print(" <hr>");
                                                                    out.print("<a>Usted no puede comentar esta propuesta</a>");
                                                                }
                                                            }
                                                        } else {
                                                            out.print("Inicie sesion para comentar");
                                                        }
                                                    %>
                                                    <br>
                                                </div>
                                            </div>
                                            <div style="text-align: center">
                                                <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
                                                <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
                                            </div >
                                        </div>
                                    </div><!--/tab-pane-->

                                </div><!--/tab-content-->

                            </div><!--/row-->

                        </div>
                    </div>
                </div>     
            </div>

        </div>

        <br><br>
        <jsp:include page="/Vistas/footer.jsp" />                          
    </body>

</html>
