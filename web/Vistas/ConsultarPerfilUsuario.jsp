
<%@page import="servicios.DtinfoColaborador"%>
<%@page import="servicios.DtUsuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="script/FiltrarTabla.js"></script>
        <link rel="stylesheet" type="text/css" href="css/RegistrarColaboracion.css"/>

        <title>Culturarte</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"></div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile" style="width: 157%;margin-left: -27%;">
                                <%List<DtUsuario> usu = (List<DtUsuario>) request.getAttribute("Usuarios");
                if (usu.size() != 0) {%>

                                <table id="tabla" class="table table-bordered table-hover formulario" style="font-size: 78%;">
                                    <thead>
                                    <h2 style="text-align: center">Elije un Usuario</h2>
                                    <input id="buscar" style="width: 24%;margin-left: 38%;" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />

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
                                        <input style="border:none" class="form-control-plaintext" readonly="" name="nick" type="hidden" value="<%=dtusu.getNickname()%>"/>&nbsp;&nbsp;&nbsp;
                                        <td><%=dtusu.getNickname()%></td>
                                        <td><%=dtusu.getNombre()%>&nbsp;&nbsp;&nbsp;</td>
                                        <td><%=dtusu.getApellido()%>&nbsp;&nbsp;&nbsp;</td>
                                        <%if (dtusu.isEsproponente() == false) { %>
                                        <td>Colaborador&nbsp;&nbsp;&nbsp;<br/></td>
                                            <%} else {%>
                                        <td>Proponente&nbsp;&nbsp;&nbsp;<br/></td>
                                            <%}%>
                                        <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px" type="input" name="Ver" class="btn btn-primary"></button></td>
                                        </tr>
                                    </form>
                                    <% }%>
                                </table>
                                <div style="text-align: center">
                                    <a href="javascript:window.history.back();" class="btn btn-primary"> &laquo; Volver</a>
                                     <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
                                </div>
                                <br>
                                <% } else {%>
                                <h1>No hay usuarios en el sistema</h1>
                                <%}%>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br><br>
        <jsp:include page="/Vistas/footer.jsp"/>
    </body>
</html>
