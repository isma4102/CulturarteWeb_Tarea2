
<%@page import="logica.Clases.DtinfoColaborador"%>
<%@page import="logica.Clases.DtUsuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/ConsultarUsuario.css"/>
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Consultar perfil de usuario</title>
    </head>
    <body>
        <%List<DtUsuario> usu = (List<DtUsuario>) request.getAttribute("Usuarios");
            if (usu.size() != 0) {%>
        <div style="float:left">
            <table>

                <h3 style="text-align: center">Elija un usuario</h3>

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
        <% }else{%>
        <h1>No hay usuarios en el sistema</h1>
        <%}%>
</body>

</html>
