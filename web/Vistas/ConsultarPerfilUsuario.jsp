
<%@page import="logica.Clases.DtinfoColaborador"%>
<%@page import="logica.Clases.DtUsuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Consultar perfil de usuario</title>
    </head>
    <body>
        <%List<DtUsuario> usu = (List<DtUsuario>) request.getAttribute("Usuarios");
            if (usu.size() != 0) {%>
        <div style="float:left">
            <table class="table table-bordered table-hover  formulario" style="margin-left: 300px; width: 88%; margin-top:100px;">

                <h3 style=" position: absolute; top:50px;left: 650px;">Elija un usuario</h3>

                <tr>
                    <th class="active">Nickname</th>
                    <th class="active">Nombre</th>
                    <th class="active">Apellido</th>
                    <th class="active">Prononente/Colaborador</th>
                    <th class="active">Acciones</th>
                </tr>
                <%for (DtUsuario dtusu : usu) {%>
                <form  action="${pageContext.request.contextPath}/ServletConsultarUsuario" method="POST">
                    <tr>
                        <td><input name="nick" type="text" value="<%=dtusu.getNickName()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><%=dtusu.getNombre()%>&nbsp;&nbsp;&nbsp;</td>
                        <td><%=dtusu.getApellido()%>&nbsp;&nbsp;&nbsp;</td>
                        <%if (dtusu.Esproponente() == false) { %>
                        <td>Colaborador&nbsp;&nbsp;&nbsp;<br/></td>
                            <%} else { %>
                        <td>Proponente&nbsp;&nbsp;&nbsp;<br/></td>
                            <%}%>
                        <td><input type="submit" value="Ver datos" /></td>
                    </tr>
                </form>
                <% }%>
            </table>
        </div>
        <% }%>
    </form>
</body>

</html>
