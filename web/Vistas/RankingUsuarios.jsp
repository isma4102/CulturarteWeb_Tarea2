<%-- 
    Document   : RankingUsuarios
    Created on : 24/10/2018, 01:36:02 PM
    Author     : PabloDesk
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="servicios.DtUsuario"%>
<%@page import="java.util.List"%>

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
                        <div class="col-md-6 ml-auto mr-auto" >
                            <div class="profile" style="width: 116%;margin-left: -5%;">
                                <div style="margin-top: 7%;">
                                    <%List<DtUsuario> usu = (List<DtUsuario>) request.getAttribute("UsuariosRanking");
                                        if (usu.size() != 0) {%>
                                        <table style="font-size: 78%;" id="tabla" class="formulario table table-bordered table-hover">
                                        <thead>
                                        <h2 style="text-align: center">Ranking de Usuarios de Culturarte</h2>
                                        <input id="buscar" style="width: 24%;margin-left: 38%;" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />
                                        
                                        <tr>
                                            <th >Nickname</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Prop/Colab</th>
                                            <th>Cantidad Seguidores</th>
                                            <th>Ver Perfil</th>
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
                                            <td><%=dtusu.getSeguidores().size()%></td>
                                            <td><button style="background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;
                                                        background-repeat:no-repeat;width:70px; height:25px" type="input" name="Ver" class="btn btn-primary"></button></td>
                                            </tr>
                                        </form>
                                        <% }%>
                                    </table>


                                    <% } else {%>
                                    <h1>No hay usuarios en el sistema</h1>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="text-align: center">
                <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
                <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
            </div>
                                <br><br>
        </div>

        <br><br><br><br><br>        
        <jsp:include page="/Vistas/footer.jsp"/>
    </body>
</html>

