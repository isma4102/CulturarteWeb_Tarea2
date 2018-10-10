<%-- 
    Document   : ConsultarPerfilUsuario2
    Created on : 19/09/2018, 11:22:12 AM
    Author     : gabri
--%>



<%@page import="logica.Controladores.configuraciones"%>
<%@page import="logica.Clases.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Clases.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>Datos del Usuario</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />

        <hr>
        <div class="container bootstrap snippet" style="margin-top: 7%;">
            <div class="row">


            </div>
            <div class="row">
                <div class="col-sm-3"><!--left col-->
                    <%DtUsuario dtu = (DtUsuario) request.getAttribute("Usuario");
                        DtUsuario nick = (DtUsuario) request.getSession().getAttribute("usuario_logueado");%>
                        
                    <%configuraciones conf = new configuraciones();
                        String ruta = conf.getCarpetaImagenes() + "\\fPerfiles\\" + dtu.getCorreo() + "\\" + dtu.getImagen();
                    %>
                    <img src="Imagenes/nadie.png" class="avatar img-circle img-thumbnail" alt="avatar">
                    <br>




                </div><!--/col-3-->
                <div class="col-sm-9">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#Informacion">Información</a></li>
                        <li><a data-toggle="tab" href="#Seguidores">Seguidores</a></li>
                        <li><a data-toggle="tab" href="#Seguidos">Seguidos</a></li>
                        <li><a data-toggle="tab" href="#PFavoritas">Propuestas favoritas</a></li>
                            <%if (dtu.Esproponente()) {%>
                        <li><a data-toggle = "tab" href = "#PCreadas" > Propuestas creadas</a></li></ul>
                            <%} else {%>
                    <li><a data-toggle = "tab" href = "#PCreadas" > Colaboraciones</a></li></ul>
                        <%}%>
                    <div class="tab-content">
                        <div style = "color:black" class="tab-pane active" id = "Informacion"> 
                            <hr>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style = "padding: 1%"
                                             > <h3 
                                                class="panel-title">NickName</h3
                                            > </div> 
                                        <div  class="panel-body" style = "padding: 1%"> 
                                            <%out.print(dtu.getNickName());%>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-xs-6">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="padding: 1%">
                                            <h3 class="panel-title">Nombre</h3>
                                        </div>
                                        <div class="panel-body" style="padding: 1%">
                                            <% out.print(dtu.getNombre()); %>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="padding: 1%">
                                            <h3 class="panel-title">Apellido</h3>
                                        </div>
                                        <div class="panel-body" style="padding: 1%">
                                            <% out.print(dtu.getApellido()); %>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="padding: 1%">
                                            <h3 class="panel-title">Correo</h3>
                                        </div>
                                        <div class="panel-body" style="padding: 1%">
                                            <% out.print(dtu.getCorreo()); %>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="padding: 1%">
                                            <h3 class="panel-title">Fecha de Nacimiento</h3>
                                        </div>
                                        <div class="panel-body" style="padding: 1%">
                                            <%Calendar cal = dtu.getFechaN();
                                                int dia = cal.get(Calendar.DAY_OF_MONTH);
                                                int mes = cal.get(Calendar.MONTH) + 1;
                                                int anio = cal.get(Calendar.YEAR);
                                                out.print("" + dia + "/" + mes + "/" + anio + "");%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">

                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="padding: 1%">
                                            <h3 class="panel-title">Tipo de usuario</h3>
                                        </div>
                                        <div class="panel-body" style="padding: 1%">
                                            <%
                                                if (dtu.Esproponente()) {
                                                    out.println("Proponente");
                                                } else {
                                                    out.println("Colaborador");
                                                }%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%if (dtu.Esproponente()) {%>       
                            <div class="form-group">
                                <div class="col-xs-6">

                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="padding: 1%">
                                            <h3 class="panel-title">Biografia</h3>
                                        </div>
                                        <div class="panel-body" style="padding: 1%">
                                            <%out.println(dtu.getBiografia());%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">

                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="padding: 1%">
                                            <h3 class="panel-title">Direccion</h3>
                                        </div>
                                        <div class="panel-body" style="padding: 1%">
                                            <%out.println(dtu.getDireccion());%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                        <div class="form-group">
                                <div class="col-xs-6">

                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="padding: 1%">
                                            <h3 class="panel-title">Sitio</h3>
                                        </div>
                                        <div class="panel-body" style="padding: 1%">
                                            <%out.println(dtu.getSitio());%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <hr>

                        </div><!--/tab-pane-->
                        <div style="color:black"  style="color: black"  class="tab-pane" id="Seguidores">
                            <div class="seguidores">
                                <h3>Seguidores</h3>
                                <%List<DtUsuario> seguidores = (List<DtUsuario>) request.getAttribute("Seguidores");
                                        if (seguidores.size() > 0) {%>
                                <table class="table table-bordered table-hover  formulario">
                                    <tr>
                                        <th>Nickname</th>
                                        <th>Proponente/Colaborador</th>
                                    </tr>

                                    <%for (DtUsuario dtusu : seguidores) {%>
                                    <tr>
                                        <td><p><%=dtusu.getNickName()%></p></td>&nbsp;&nbsp;&nbsp;
                                        <%if (dtusu.Esproponente()) {%>
                                        <td><p>Proponente</p></td>&nbsp;&nbsp;&nbsp;
                                        <%} else {%>
                                        <td><p>Colaborador</p></td>&nbsp;&nbsp;&nbsp;
                                        <% }%>
                                    </tr>
                                    <% }%>  
                                </table>


                                <% } else {%>
                                <h3>No posee seguidores</h3>

                                <% }%> 
                            </div>
                        </div><!--/tab-pane-->
                        <div style="color:black" class="tab-pane" id="Seguidos">

                            <div class="seguidos">
                                <h3>Seguidos</h3>
                                <%List<DtUsuario> seguidos = (List<DtUsuario>) request.getAttribute("Seguidos");
                                        if (seguidos.size() > 0) {%>
                                <table class="table table-bordered table-hover  formulario">
                                    <tr>
                                        <th>Nickname</th>
                                        <th>Proponente/Colaborador</th>
                                    </tr>

                                    <%for (DtUsuario dtusu : seguidos) {%>
                                    <tr>
                                        <td><p><%=dtusu.getNickName()%></p></td>&nbsp;&nbsp;&nbsp;
                                        <%if (dtusu.Esproponente()) {%>
                                        <td><p>Proponente</p></td>&nbsp;&nbsp;&nbsp;
                                        <%} else {%>
                                        <td><p>Colaborador</p></td>&nbsp;&nbsp;&nbsp;
                                        <% }%>
                                    </tr>
                                    <% }%>
                                </table>
                                <% } else {%>
                                <h3>No posee seguidos</h3>

                                <% }%> 
                            </div>
                        </div><!--/tab-pane-->
                        <div style="color:black" class="tab-pane" id="PFavoritas">

                            <div class="favoritas" style="margin-bottom: 2%">
                                <h3>Propuestas favoritas</h3>
                                <%List<DtinfoPropuesta> favoritas = (List<DtinfoPropuesta>) request.getAttribute("Favoritas");
                                        if (favoritas.size() > 0) {%>
                                <table class="table table-bordered table-hover  formulario">
                                    <form action="ServletConsultarPropuesta" method="POST">
                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Accion</th>
                                        </tr>

                                        <%for (DtinfoPropuesta dtp : favoritas) {%>
                                        <tr>
                                        <input readonly style="border:none" name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                                        <td><p><%=dtp.getTitulo()%></p></td>    
                                        <td><textarea readonly style="background-color: white; resize: none;width: 300px; height: 100px;" ><%=dtp.getDescripcion()%></textarea></td>
                                        <td><p><%=dtp.getEstado()%></p></td>
                                        <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" name="consulta" type="submit" class="btn btn-primary"></button></td>

                                        </tr>
                                        <%}%>
                                    </form>
                                </table>
                                <% } else {%>
                                <h3>No posee propuestas favoritas</h3>

                                <% }%> 
                            </div>
                        </div><!--/tab-pane-->
                        <div style="color:black" class="tab-pane" id="PCreadas">



                            <%if (dtu.Esproponente()) {%>
                            <%if (nick != null) {%>
                            <%if (dtu.getNickName().equals(nick.getNickName())) {%>
                            <%List<DtinfoPropuesta> propuestasdeproponentenoing = (List<DtinfoPropuesta>) request.getAttribute("Propuestas2");
                                    if (propuestasdeproponentenoing.size() > 0) {%>
                            <div class="usuario" style="margin-bottom: 2%">
                                <h3>Propuestas creadas</h3>
                                <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">
                                    <form action="ServletConsultarPropuesta" method="POST">
                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Accion</th>
                                        </tr>

                                        <%for (DtinfoPropuesta dtp : propuestasdeproponentenoing) {%>
                                        <tr>
                                        <input readonly style="border:none" name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                                        <td><p><%=dtp.getTitulo()%></p></td>
                                        <td><textarea readonly style="background-color: white; resize: none;width: 300px; height: 100px;"><%=dtp.getDescripcion()%></textarea></td> 
                                        <td><p><%=dtp.getEstado()%></p></td>
                                        <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" name="consulta" type="submit" class="btn btn-primary"></button></td>
                                        </tr>
                                        <%}%>     
                                    </form>
                                </table>
                                <% } else {%>
                                <h3>No posee propuestas creadas</h3>

                                <% }%> 
                            </div>
                            <%} else {%>
                            <div class="usuario" style="margin-bottom: 2%">
                                <h3>Propuestas creadas</h3>
                                <%List<DtinfoPropuesta> propuestasdeproponente = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                                        if (propuestasdeproponente.size() > 0) {%>
                                <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">
                                    <form action="ServletConsultarPropuesta" method="POST">
                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Accion</th>
                                        </tr>

                                        <% for (DtinfoPropuesta dtp : propuestasdeproponente) {%>
                                        <tr>
                                        <input readonly style="border:none" name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                                        <td><p><%=dtp.getTitulo()%></p></td>
                                        <td><textarea readonly style="background-color: white; resize: none;width: 300px; height: 100px;"><%=dtp.getDescripcion()%></textarea></td>
                                        <td><p><%=dtp.getEstado()%></p></td>
                                        <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" name="consulta" type="submit" class="btn btn-primary"></button></td>

                                        </tr>
                                        <%}%>     
                                    </form>
                                </table>
                                <% } else {%>
                                <h3>No posee propuestas creadas</h3>

                                <% }%> 
                            </div>
                            <%}%> 
                            <%} else {%>
                            <div class="usuario" style="margin-bottom: 2%">
                                <h3>Propuestas creadas</h3>
                                <%List<DtinfoPropuesta> propuestasdeproponentenoing = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                                        if (propuestasdeproponentenoing.size() > 0) {%>
                                <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">
                                    <form action="ServletConsultarPropuesta" method="POST">
                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Accion</th>
                                        </tr>

                                        <%for (DtinfoPropuesta dtp : propuestasdeproponentenoing) {%>
                                        <tr>
                                        <input readonly style="border:none" name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                                        <td><p><%=dtp.getTitulo()%></p></td>    
                                        <td><textarea readonly style="background-color: white; resize: none;width: 300px; height: 100px;"><%=dtp.getDescripcion()%></textarea></td>
                                        <td><%=dtp.getEstado()%></td>
                                        <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" name="consulta" type="submit" class="btn btn-primary"></button></td>
                                        </tr>
                                        <%}%>   
                                    </form>
                                </table>
                                <% } else {%>
                                <h3>No posee propuestas creadas</h3>

                                <% }%> 
                            </div>
                            <%}%>
                            <%} else {%>
                            <%if (nick != null) {%>
                            <div class="usuario" style="margin-bottom: 2%">
                                <h3>Colaboraciones</h3>
                                <%List<DtinfoPropuesta> colaboraciones = (List<DtinfoPropuesta>) request.getAttribute("Colaboraciones");
                                        if (colaboraciones.size() > 0) {%>
                                <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">

                                    <tr>
                                        <th>Titulo</th>
                                        <th>Descripción</th>
                                            <%if (dtu.getNickName().equals(nick.getNickName())) {%>
                                        <th>Fecha de colaboracion:</th>
                                        <th>Monto</th>  
                                            <% }%>
                                    </tr>

                                    <% for (DtinfoPropuesta dtp : colaboraciones) {%>
                                    <tr>
                                        <td><p><%=dtp.getTitulo()%></p></td>&nbsp;&nbsp;&nbsp;
                                        <td><textarea readonly style="background-color: white; resize: none;width: 300px; height: 100px; overflow-y: scroll;"><%=dtp.getDescripcion()%></textarea>&nbsp;&nbsp;&nbsp;</td>
                                        <%if (dtu.getNickName().equals(nick.getNickName())) {
                                                Calendar calen = dtp.getFechaReal();
                                                int dia2 = calen.get(Calendar.DAY_OF_MONTH);
                                                int mes2 = calen.get(Calendar.MONTH) + 1;
                                                int anio2 = calen.get(Calendar.YEAR);
                                                out.println("<td>" + dia2 + "/" + mes2 + "/" + anio2 + "</td>");
                                        %>
                                        <td><p><%=dtp.getMonto()%></p></td>&nbsp;&nbsp;&nbsp;
                                        <%}%>

                                    </tr>
                                    <%}%>

                                </table>
                                <% } else {%>
                                <h3>No posee colaboraciones</h3>

                                <% }%>
                            </div>
                            <%} else {%>
                            <div class="usuario" style="margin-bottom: 2%">
                                <h3>Colaboraciones</h3>
                                <%List<DtinfoPropuesta> colaboraciones = (List<DtinfoPropuesta>) request.getAttribute("Colaboraciones");
                                        if (colaboraciones.size() > 0) {%>
                                <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">

                                    <tr>
                                        <th>Titulo</th>
                                        <th>Descripción</th>     
                                    </tr>

                                    <% for (DtinfoPropuesta dtp : colaboraciones) {%>
                                    <tr>
                                        <td><p><%=dtp.getTitulo()%></p></td>&nbsp;&nbsp;&nbsp;
                                        <td><textarea readonly style="background-color: white; resize: none; width: 300px; height: 100px; overflow-y: scroll;"><%=dtp.getDescripcion()%></textarea>&nbsp;&nbsp;&nbsp;</td>
                                    </tr>
                                    <%}%>


                                </table>  
                            </div>
                            <% } else {%>
                            <h3>No posee colaboraciones</h3>

                            <% }%>
                            <%}%>
                            <%}%>
                        </div>
                    </div><!--/tab-pane-->
                </div><!--/tab-content-->

            </div><!--/col-9-->
        </div><!--/row-->






        <div style="text-align: center;margin-left: -21%;">

            <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
            <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
        </div>




    </body>
</html>
