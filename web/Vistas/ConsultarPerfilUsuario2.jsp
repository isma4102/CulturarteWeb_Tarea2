<%-- 
    Document   : ConsultarPerfilUsuario2
    Created on : 19/09/2018, 11:22:12 AM
    Author     : gabri
--%>



<%@page import="servicios.DtColaboraciones"%>
<%@page import="servicios.DtinfoColaborador"%>
<%@page import="servicios.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="servicios.DtUsuario"%>
<%@page import="servicios.DtPago"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            DtUsuario dtu = (DtUsuario) request.getAttribute("Usuario");
            DtUsuario nick = (DtUsuario) request.getSession().getAttribute("usuario_logueado");
            String solicitudseguir = (String) request.getAttribute("solicitudseguir");
            if (solicitudseguir != null) {%>
        <script type="text/javascript">

            window.onload = function () {
                alert("<%= solicitudseguir%>");
            }

        </script>
        <%
            }
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Culturarte</title>

    </head>
    <body class="profile-page sidebar-collapse">
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -44px;z-index: -100;"></div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div style="margin-bottom: 16%;" class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile">
                                <div class="avatar">
                                    <img style="background-color: gray;width: 23%;" src="/CulturarteWeb/ServletImagenes?nickname=<%= dtu.getNickname()%>" class="rounded-circle "/>
                                </div>
                                <br>
                                <div class="name">
                                    <h1 class="title"><%=dtu.getNickname()%></h1>
                                    <h3>  <%
                                        if (dtu.isEsproponente()) {
                                            out.println("Proponente");
                                        } else {
                                            out.println("Colaborador");
                                        }%></h3>

                                    <a><img style="width: 5%;" src="Imagenes/Web.png"><% out.print(dtu.getCorreo()); %></a>
                                </div>
                            </div>
                            <div class="follow">
                                <%  if (nick != null)
                                        if (nick.getSeguidos().contains(dtu.getNickname())) {%>
                                <form action="SeguirUsuario" method="post">
                                    <input type="hidden" name="seguido" value="<%=dtu.getNickname()%>" />
                                    <input type="hidden" name="accion" value="dejarseguir" />
                                    <input type="button" class="btn btn-fab btn-primary btn-round" rel="tooltip" title="Dejar de Seguir a este usuario" value="-" onclick="submit()"/>
                                </form>                                 
                                <%} else {%>
                                <form action="SeguirUsuario" method="post">
                                    <input type="hidden" name="seguido" value="<%=dtu.getNickname()%>" />
                                    <input type="hidden" name="accion" value="seguir" />
                                    <input type="button" class="btn btn-fab btn-primary btn-round" rel="tooltip" title="Seguir a este usuario" value="+" onclick="submit()"/>
                                </form>          
                                <%}%>
                            </div>
                        </div>
                    </div>
                    <div style="color: black" class="description text-center">
                        <p> <%if (dtu.getBiografia() != null) {
                                out.println(dtu.getBiografia());
                            }%></p>
                    </div>
                </div>
                <div style="font-size: 80%;" class="container_tabs">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active"><a data-toggle="tab" href="#Informacion">Información</a></li>
                        <li><a  data-toggle="tab" href="#Seguidores">Seguidores</a></li>
                        <li><a  data-toggle="tab" href="#Seguidos">Seguidos</a></li>
                        <li><a  data-toggle="tab" href="#PFavoritas">Propuestas favoritas</a></li>
                            <%if (dtu.isEsproponente()) {%>
                        <li><a data-toggle = "tab" href = "#PCreadas" > Propuestas creadas</a></li>
                            <%if (nick != null && nick.isEsproponente() && dtu.getNickname().compareTo(nick.getNickname()) == 0) {%>
                        <li><a data-toggle="tab" href="#DesactivarP">Desactivar Cuenta</a></li>
                            <%}
                            } else {%>
                        <li><a data-toggle = "tab" href = "#PCreadas" > Colaboraciones</a></li>
                            <%}%>
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
                                                    class="panel-title">NickName</h3
                                                > </div> 
                                            <div  class="panel-body" style = "padding: 1%"> 
                                                <%out.print(dtu.getNickname());%>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" style="background-color: #637390;padding: 1%">
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
                                            <div class="panel-heading" style="background-color: #637390;padding: 1%">
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
                                            <div class="panel-heading" style="background-color: #637390;padding: 1%">
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
                                            <div class="panel-heading" style="background-color: #637390;padding: 1%">
                                                <h3 class="panel-title">Fecha de Nacimiento</h3>
                                            </div>
                                            <div class="panel-body" style="padding: 1%">
                                                <%Calendar cal = dtu.getFechaN().toGregorianCalendar();
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
                                            <div class="panel-heading" style="background-color: #637390;padding: 1%">
                                                <h3 class="panel-title">Tipo de usuario</h3>
                                            </div>
                                            <div class="panel-body" style="padding: 1%">
                                                <%
                                                    if (dtu.isEsproponente()) {
                                                        out.println("Proponente");
                                                    } else {
                                                        out.println("Colaborador");
                                                    }%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%if (dtu.isEsproponente()) {%>       


                                <div class="form-group">
                                    <div class="col-xs-6">

                                        <div class="panel panel-primary">
                                            <div class="panel-heading" style="background-color: #637390;padding: 1%">
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
                                            <div class="panel-heading" style="background-color: #637390;padding: 1%">
                                                <h3 class="panel-title">Sitio</h3>
                                            </div>
                                            <div class="panel-body" style="padding: 1%">
                                                <%out.println(dtu.getSitioweb());%>
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
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Proponente/Colaborador</th>
                                        </tr>

                                        <%for (DtUsuario dtusu : seguidores) {%>
                                        <tr>
                                            <td><p><%=dtusu.getNombre()%></p></td>&nbsp;&nbsp;&nbsp;
                                            <td><p><%=dtusu.getApellido()%></p></td>&nbsp;&nbsp;&nbsp;
                                            <%if (dtusu.isEsproponente()) {%>
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
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Proponente/Colaborador</th>
                                        </tr>

                                        <%for (DtUsuario dtusu : seguidos) {%>
                                        <tr>
                                            <td><p><%=dtusu.getNombre()%></p></td>&nbsp;&nbsp;&nbsp;
                                            <td><p><%=dtusu.getApellido()%></p></td>&nbsp;&nbsp;&nbsp;
                                            <%if (dtusu.isEsproponente()) {%>
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

                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Accion</th>
                                        </tr>

                                        <%for (DtinfoPropuesta dtp : favoritas) {%>
                                        <form action="ServletConsultarPropuesta" method="POST">
                                            <tr>
                                            <input readonly style="border:none" name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                                            <td><p><%=dtp.getTitulo()%></p></td>    
                                            <td style="width: 35%"><p ><%=dtp.getDescripcion()%></p></td>
                                            <td><p><%=dtp.getEstado()%></p></td>
                                            <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" name="consulta" type="submit" class="btn btn-primary"></button></td>

                                            </tr>
                                        </form>
                                        <%}%>

                                    </table>
                                    <% } else {%>
                                    <h3>No posee propuestas favoritas</h3>

                                    <% }%> 
                                </div>
                            </div><!--/tab-pane-->
                            <div style="color:black" class="tab-pane" id="PCreadas">
                                <%if (dtu.isEsproponente()) {%>
                                <%if (nick != null) {%>
                                <%if (dtu.getNickname().equals(nick.getNickname())) {%>
                                <%List<DtinfoPropuesta> propuestasdeproponentenoing = (List<DtinfoPropuesta>) request.getAttribute("Propuestas2");
                                    if (propuestasdeproponentenoing.size() > 0) {%>
                                <div class="usuario" style="margin-bottom: 2%">
                                    <h3>Propuestas creadas</h3>
                                    <table class="table table-bordered table-hover  formulario" >

                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Accion</th>
                                        </tr>

                                        <%for (DtinfoPropuesta dtp : propuestasdeproponentenoing) {%>
                                        <form action="ServletConsultarPropuesta" method="POST">
                                            <tr>
                                            <input readonly style="border:none" name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                                            <td><p>Titulo de Prueba</p></td>
                                            <td style="width: 35%"><p ><%=dtp.getDescripcion()%></p></td>
                                            <td><p><%=dtp.getEstado()%></p></td>
                                            <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" name="consulta" type="submit" class="btn btn-primary"></button></td>
                                            </tr>
                                        </form>
                                        <%}%>     

                                    </table>
                                </div>
                                <% } else {%>
                                <h3>No posee propuestas creadas</h3>

                                <% }%> 

                                <%} else {%>
                                <div class="usuario" style="margin-bottom: 2%">
                                    <h3>Propuestas creadas</h3>
                                    <%List<DtinfoPropuesta> propuestasdeproponente = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                                        if (propuestasdeproponente.size() > 0) {%>
                                    <table class="table table-bordered table-hover  formulario" >

                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Accion</th>
                                        </tr>

                                        <% for (DtinfoPropuesta dtp : propuestasdeproponente) {%>
                                        <form action="ServletConsultarPropuesta" method="POST">
                                            <tr>
                                            <input readonly style="border:none" name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                                            <td><p>Titulo de Prueba</p></td>
                                            <td style="width: 35%"><p ><%=dtp.getDescripcion()%></p></td>
                                            <td><p><%=dtp.getEstado()%></p></td>
                                            <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" name="consulta" type="submit" class="btn btn-primary"></button></td>

                                            </tr>
                                        </form>
                                        <%}%>     

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
                                    <table class="table table-bordered table-hover  formulario" >

                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Accion</th>
                                        </tr>

                                        <%for (DtinfoPropuesta dtp : propuestasdeproponentenoing) {%>
                                        <form action="ServletConsultarPropuesta" method="POST">
                                            <tr>
                                            <input readonly style="border:none" name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                                            <td><p>Titulo de Prueba</p></td>    
                                            <td style="width: 35%"><p ><%=dtp.getDescripcion()%></p></td>
                                            <td><%=dtp.getEstado()%></td>
                                            <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" name="consulta" type="submit" class="btn btn-primary"></button></td>
                                            </tr>
                                        </form>
                                        <%}%>   
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
                                        if (colaboraciones.size() > 0) {
                                            List<DtColaboraciones> dtc = (List<DtColaboraciones>) request.getAttribute("Colaborador"); %>
                                    <table class="table table-bordered table-hover  formulario" >

                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción:</th>
                                                <%if (dtu.getNickname().equals(nick.getNickname())) {%>
                                            <th>Fecha de colaboracion:</th>
                                            <th>Monto</th>  
                                            <th>Pagos</th>
                                                <% }%>
                                        </tr>

                                        <% for (DtColaboraciones dtp : dtc) {%>
                                        <tr>
                                            <td><p><%=dtp.getPropuesta()%></p></td>&nbsp;&nbsp;&nbsp;     
                                            <td><p><%=dtp.getDesc()%></p></td>&nbsp;&nbsp;&nbsp;       
                                            <%if (dtu.getNickname().equals(nick.getNickname())) {
                                                    Calendar calen = dtp.getFechaRealiz().toGregorianCalendar();
                                                    int dia2 = calen.get(Calendar.DAY_OF_MONTH);
                                                    int mes2 = calen.get(Calendar.MONTH) + 1;
                                                    int anio2 = calen.get(Calendar.YEAR);
                                                    out.println("<td>" + dia2 + "/" + mes2 + "/" + anio2 + "</td>");
                                                    Float monto = dtp.getMontoC();
                                            %>
                                            <td><p><%=monto%></p></td>&nbsp;&nbsp;&nbsp;
                                            <td>     
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Pagos">
                                                    Ver
                                                </button>
                                            </td>
                                            <%}%>
                                        </tr>
                                        <div class="modal fade" id="Pagos" tabindex="-1" role="dialog" aria-labelledby="Pagos" aria-hidden="true">
                                            <div style="margin-bottom: -45%;" class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h2 style="text-align: center" class="modal-title" id="exampleModalLongTitle">Información</h2>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <% if (dtp.getPago() != null && dtp.getPago().getTipo().equals("tarjeta")) {%>
                                                        Numero de tarjeta: <%= dtp.getPago().getTarjetaBANCO()%>  <br>
                                                        Numero de cuenta: <%= dtp.getPago().getNumeroCUENTA()%>  <br>
                                                        CVC: <%= String.valueOf(dtp.getPago().getCvc())%>  <br>
                                                        Fecha de vencimiento: <%= dtp.getPago().getFechaV()%>  <br>
                                                        Titular: <%= dtp.getPago().getTitular()%>  <br>
                                                        <% } else if (dtp.getPago() != null && dtp.getPago().getTipo().equals("paypal")) {%>
                                                        Numero de cuenta: <%= dtp.getPago().getNumeroCUENTA()%>  <br>
                                                        Titular: <%= dtp.getPago().getTitular()%>  <br>

                                                        <% } else if(dtp.getPago() != null){%>
                                                        Banco: <%= dtp.getPago().getTarjetaBANCO()%><br>  
                                                        Nombre de cuenta: <%= dtp.getPago().getNumeroCUENTA()%>  <br>
                                                        Titular: <%= dtp.getPago().getTitular()%>  <br>
                                                        <% }%>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
                                    <table class="table table-bordered table-hover  formulario" >

                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>     
                                        </tr>

                                        <% for (DtinfoPropuesta dtp : colaboraciones) {%>
                                        <tr>
                                            <td><p><%=dtp.getTitulo()%></p></td>&nbsp;&nbsp;&nbsp;
                                            <td style="width: 80%;"><p ><%=dtp.getDescripcion()%></p></td>
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
                            <div style="color:black" class="tab-pane" id="DesactivarP">
                                <form action="ServletDesactivarUsuario" method="POST">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading" style="background-color: #3e6293;">
                                            <h3 class="panel-title">Advertecia</h3>
                                            <br>
                                            <br>
                                        </div>
                                        <div class="panel-body" style="padding: 1% ;background-color: #637390;">
                                            <span>
                                                Al desactivar su cuenta perdera toda su información (datos básicos, imagenes,propuestas y colaboraciones a estas), los restantes usuarios
                                                que tengan algun vinculo con sus propuestas o su perfil no podran visualizarlo.
                                            </span>
                                        </div>
                                        <br>
                                        <br>
                                        <div>
                                            <input class="btn btn-primary btn-block form-control" type="submit" value="Desactivar Perfil" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                            </ul>
                        </div>
                        <div style="text-align: center">
                            <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
                            <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
                        </div>
                    </div>

                </div>

            </div>

        </div>   

    </div>  






    <jsp:include page="/Vistas/footer.jsp" />
</body>
</html>
