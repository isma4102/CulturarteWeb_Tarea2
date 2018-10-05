
<%@page import="logica.Clases.DtinfoColaborador"%>
<%@page import="logica.Clases.DtUsuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/RegistrarColaboracion.css"/>
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Consultar perfil de usuario</title>
    </head>
    <body>
                <jsp:include page="/Vistas/Barra_menu.jsp" />
                <div class="formulario_ver_propuesta" style="margin-top: 7%;">
            <%List<DtUsuario> usu = (List<DtUsuario>) request.getAttribute("Usuarios");
                if (usu.size() != 0) {%>

            <table class="table table-bordered table-hover" style="width: 70%;">
                <thead>
                <h3 style="text-align: center">Elija un usuario</h3>

                <tr>
                    <th >Nickname</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Prononente/Colaborador</th>
                    <th >Ver Datos</th>
                </tr>
                </thead>
                <%for (DtUsuario dtusu : usu) {%>
                <form  action="${pageContext.request.contextPath}/ServletConsultarUsuario" method="POST">
                    <tr>
                        <td><input style="border:none" class="form-control-plaintext" readonly="" name="nick" type="text" value="<%=dtusu.getNickName()%>"/>&nbsp;&nbsp;&nbsp;
                        <td><%=dtusu.getNombre()%>&nbsp;&nbsp;&nbsp;</td>
                        <td><%=dtusu.getApellido()%>&nbsp;&nbsp;&nbsp;</td>
                        <%if (dtusu.Esproponente() == false) { %>
                        <td>Colaborador&nbsp;&nbsp;&nbsp;<br/></td>
                            <%} else {%>
                        <td>Proponente&nbsp;&nbsp;&nbsp;<br/></td>
                            <%}%>
                        <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" type="input" name="Ver" class="btn btn-primary"></button></td>
                    </tr>
                </form>
                <% }%>
            </table>
            <a href="javascript:window.history.back();" class="btn btn-primary"> &laquo; Volver</a>

            <% } else {%>
            <h1>No hay usuarios en el sistema</h1>
            <%}%>
        </div>
        
    </body>

</html>
