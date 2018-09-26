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
        <div style="float:left">
            <h3 style="margin-left: 200px">Seguidores</h3>
            <table class="table table-bordered table-hover  formulario" style="margin-left: 200px; width: 88%; margin-top:50px;">
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
        <div style="float:right">
            <h3 style="margin-left: 200px">Seguidos</h3>
            <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">
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
        <div style="float:left;margin-top: 350px; margin-bottom: 100px;">
            <h3>Propuestas favoritas</h3>
            <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%;">
                <form action="ServletConsultarPropuesta">
                    <tr>
                        <th>Titulo</th>
                        <th>Nombre</th>
                    </tr>
                    <%List<DtinfoPropuesta> favoritas = (List<DtinfoPropuesta>) request.getAttribute("Favoritas");
                        for (DtinfoPropuesta dtp : favoritas) {%>
                    <tr>
                        <td><input name="nick" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><textarea><%=dtp.getDescripcion()%></textarea></td>
                        <td><input name="consulta" type="submit" value="Ver datos"/></td>

                    </tr>
                    <%}%>
                </form>
            </table> 
        </div>
        <% String nick = (String) request.getSession().getAttribute("usuario_logueado");%>
        <%if (dtu.Esproponente()) {%>
        <div style="float:right; margin-bottom: 100px;margin-top: 150px">
            <h3>Propuestas creadas</h3>
            <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">
                <form action="ServletConsultarPropuesta">
                    <tr>
                        <th>Titulo</th>
                        <th>Nombre</th>
                    </tr>
                    <%if (dtu.getNickName().equals(nick)) {%>
                    <%List<DtinfoPropuesta> propuestasdeproponentenoing = (List<DtinfoPropuesta>) request.getAttribute("Propuestas2");
                            for (DtinfoPropuesta dtp : propuestasdeproponentenoing) {%>
                    <tr>
                        <td><input name="nick" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><textarea><%=dtp.getDescripcion()%></textarea></td> 
                        <td><input name="consulta" type="submit" value="Ver datos"/></td>
                    </tr>
                    <%}%>
                    <%} else {%>
                    <%List<DtinfoPropuesta> propuestasdeproponente = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                        for (DtinfoPropuesta dtp : propuestasdeproponente) {%>
                    <tr>
                        <td><input name="nick" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><textarea><%=dtp.getDescripcion()%></textarea></td> 
                        <td><input name="consulta" type="submit" value="Ver datos"/></td>
                    </tr>
                    <%}%>
                    <%}%>
                </form>
            </table>

            <%} else {%>
            <div style="float:right;margin-left: 200px;margin-top: 150px;margin-bottom: 100px">
                <h3>Colaboraciones</h3>
                <table class="table table-bordered table-hover  formulario" style="margin-right: 200px; width: 88%; margin-top:50px;">
                    <form action="ServletConsultarPropuesta">
                        <tr>
                            <th>Titulo</th>
                            <th>Nombre</th>
                        </tr>
                        <%List<DtinfoPropuesta> colaboraciones = (List<DtinfoPropuesta>) request.getAttribute("Colaboraciones");
                            for (DtinfoPropuesta dtp : colaboraciones) {%>
                        <tr>
                            <td><input name="nick" type="text" value="<%=dtp.getTitulo()%>"/>&nbsp;&nbsp;&nbsp;
                            <td><textarea><%=dtp.getDescripcion()%></textarea>&nbsp;&nbsp;&nbsp;</td>
                            <%if (dtu.getNickName().equals(nick)) {
                                    Calendar calen = dtp.getFechaReal();
                                    int dia2 = calen.get(Calendar.DAY_OF_MONTH);
                                    int mes2 = calen.get(Calendar.MONTH) + 1;
                                    int anio2 = calen.get(Calendar.YEAR);
                                    out.println("<td>Fecha de colaboracion:" + dia2 + "/" + mes2 + "/" + anio2 + "</td>");
                            %>
                            <td><input name="monto" type="text" value="<%=dtp.getMonto()%>"/>&nbsp;&nbsp;&nbsp;
                                <%}%>
                            <td><input name="consulta" type="submit" value="Ver datos"/></td>
                        </tr>
                        <%}%>
                    </form>
                </table>  
            </div>
            <%}%>
        </div>

    </body>
</html>
