<%-- 
    Document   : ConsultarPerfilUsuario2
    Created on : 19/09/2018, 11:22:12 AM
    Author     : gabri
--%>



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
        <link rel="stylesheet" type="text/css" href="css/ConsultarUsuario.css"/>
        <title>Datos del usuario</title>
    </head>
    <body>
        <div style="text-align: center">
            <%DtUsuario dtu = (DtUsuario) request.getAttribute("Usuario");
                out.println("<h1>Datos del usuario</h1>");
                out.println("<h3>Nickname:" + dtu.getNickName() + "</h3>");
                out.println("<h3>Nombre: " + dtu.getNombre() + "</h3>");
                out.println("<h3>Apellido:" + dtu.getApellido() + "</h3>");
                out.println("<h3>Correo:" + dtu.getCorreo() + "</h3>");
                Calendar cal = dtu.getFechaN();
                int dia = cal.get(Calendar.DAY_OF_MONTH);
                int mes = cal.get(Calendar.MONTH) + 1;
                int anio = cal.get(Calendar.YEAR);
                out.println("<h3>Fecha de nacimiento:" + dia + "/" + mes + "/" + anio + "</h3>");

                if (dtu.Esproponente()) {
                    out.println("<h3>Es proponente</h3>");
                } else {
                    out.println("<h3>Es colaborador</h3>");
                }%>
        </div>
        <div class="seguidores">
            <h3>Seguidores</h3>
            <table class="table table-bordered table-hover  formulario">
                <tr>
                    <th>Nickname</th>
                    <th>Proponente/Colaborador</th>
                </tr>
                <%List<DtUsuario> seguidores = (List<DtUsuario>) request.getAttribute("Seguidores");%>
                <%for (DtUsuario dtusu : seguidores) {%>
                <tr>
                    <td><input name="nick" type="text" value="<%=dtusu.getNickName()%>"/>&nbsp;&nbsp;&nbsp;
                        <%if (dtusu.Esproponente()) {%>
                    <td><input name="nick" type="text" value="Proponente"/>&nbsp;&nbsp;&nbsp;
                        <%} else {%>
                    <td><input name="nick" type="text" value="Colaborador"/>&nbsp;&nbsp;&nbsp;
                        <% }%>
                </tr>
                <% }%>
            </table>
        </div>
        <div class="seguidos">
            <h3>Seguidos</h3>
            <table class="table table-bordered table-hover  formulario">
                <tr>
                    <th>Nickname</th>
                    <th>Proponente/Colaborador</th>
                </tr>
                <%List<DtUsuario> seguidos = (List<DtUsuario>) request.getAttribute("Seguidos");%>
                <%for (DtUsuario dtusu : seguidos) {%>
                <tr>
                    <td><input name="nick" type="text" value="<%=dtusu.getNickName()%>"/>&nbsp;&nbsp;&nbsp;
                        <%if (dtusu.Esproponente()) {%>
                    <td><input name="nick" type="text" value="Proponente"/>&nbsp;&nbsp;&nbsp;
                        <%} else {%>
                    <td><input name="nick" type="text" value="Colaborador"/>&nbsp;&nbsp;&nbsp;
                        <% }%>
                </tr>
                <% }%>
            </table>
        </div>
        <div class="favoritas" style="margin-bottom: 2%">
            <h3>Propuestas favoritas</h3>
            <table class="table table-bordered table-hover  formulario">
                <form action="ServletConsultarPropuesta" method="POST">
                    <tr>
                        <th>Titulo</th>
                        <th>Nombre</th>
                    </tr>
                    <%List<DtinfoPropuesta> favoritas = (List<DtinfoPropuesta>) request.getAttribute("Favoritas");
                        for (DtinfoPropuesta dtp : favoritas) {%>
                    <tr>
                        <td><input name="TituloP" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><textarea style="width: 300px; height: 100px;"><%=dtp.getDescripcion()%></textarea></td>
                        <td><input name="consulta" type="submit" value="Ver datos"/></td>

                    </tr>
                    <%}%>
                </form>
            </table> 
        </div>
        <% DtUsuario nick = (DtUsuario) request.getSession().getAttribute("usuario_logueado");%>
        <%if (dtu.Esproponente()) {%>
        <%if (nick != null) {%>
        <%if (dtu.getNickName().equals(nick.getNickName())) {%>
        <div class="usuario" style="margin-bottom: 2%">
            <h3>Propuestas creadas</h3>
            <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">
                <form action="ServletConsultarPropuesta" method="POST">
                    <tr>
                        <th>Titulo</th>
                        <th>Nombre</th>
                    </tr>
                    <%if (dtu.getNickName().equals(nick.getNickName())) {%>
                    <%List<DtinfoPropuesta> propuestasdeproponentenoing = (List<DtinfoPropuesta>) request.getAttribute("Propuestas2");
                        for (DtinfoPropuesta dtp : propuestasdeproponentenoing) {%>
                    <tr>
                        <td><input name="TituloP" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><textarea style="width: 300px; height: 100px;"><%=dtp.getDescripcion()%></textarea></td> 
                        <td><input name="consulta" type="submit" value="Ver datos"/></td>
                    </tr>
                    <%}%>
                    <%}%>
                </form>

            </table>
            <%}%>
            <%}%>
            <%} else {%>
            <%if (nick != null) {%>
            <div class="usuario" style="margin-bottom: 2%">
                <h3>Colaboraciones</h3>
                <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">

                    <tr>
                        <th>Titulo</th>
                        <th>Nombre</th>
                            <%if (dtu.getNickName().equals(nick.getNickName())) {%>
                        <th>Fecha de colaboracion:</th>
                        <th>Monto</th>  
                            <% }%>
                    </tr>
                    <%List<DtinfoPropuesta> colaboraciones = (List<DtinfoPropuesta>) request.getAttribute("Colaboraciones");
                        for (DtinfoPropuesta dtp : colaboraciones) {%>
                    <tr>
                        <td><input name="nick" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><textarea style="width: 300px; height: 100px; overflow-y: scroll;"><%=dtp.getDescripcion()%></textarea>&nbsp;&nbsp;&nbsp;</td>
                        <%if (dtu.getNickName().equals(nick.getNickName())) {
                                Calendar calen = dtp.getFechaReal();
                                int dia2 = calen.get(Calendar.DAY_OF_MONTH);
                                int mes2 = calen.get(Calendar.MONTH) + 1;
                                int anio2 = calen.get(Calendar.YEAR);
                                out.println("<td>" + dia2 + "/" + mes2 + "/" + anio2 + "</td>");
                        %>
                        <td><input name="monto" type="text" value="<%=dtp.getMonto()%>"/>&nbsp;&nbsp;&nbsp;
                            <%}%>

                    </tr>
                    <%}%>

                </table>  
            </div>
            <%} else {%>
            <div class="usuario" style="margin-bottom: 2%">
                <h3>Colaboraciones</h3>
                <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">

                    <tr>
                        <th>Titulo</th>
                        <th>Nombre</th>     
                    </tr>
                    <%List<DtinfoPropuesta> colaboraciones = (List<DtinfoPropuesta>) request.getAttribute("Colaboraciones");
                        for (DtinfoPropuesta dtp : colaboraciones) {%>
                    <tr>
                        <td><input name="nick" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><textarea style="width: 300px; height: 100px; overflow-y: scroll;"><%=dtp.getDescripcion()%></textarea>&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    <%}%>


                </table>  
            </div>
            <%}%>
            <%}%>
        </div>

    </body>
</html>
