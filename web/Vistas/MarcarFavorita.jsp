<%-- 
    Document   : MarcarFavorita
    Created on : 3/10/2018, 01:04:32 AM
    Author     : gabri
--%>

<%@page import="servicios.DtinfoPropuesta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="script/FiltrarTabla.js"></script>
        <%
            String favorito = (String) request.getAttribute("favorito");
            if (favorito != null) {%>
        <script type="text/javascript">

            window.onload = function () {
                alert("<%= favorito%>");
            }

        </script>
        <%
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <link rel="stylesheet" type="text/css" href="css/RegistrarColaboracion.css"/>
        <title>Culturarte</title>
    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"> </div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile">
                                <div class="" style="margin-top: 7%">
                                    <h2 align="center">Propuestas</h2>
                                    <div style="text-align: center;">
                                        <input style="margin-right: auto;margin-left: auto;width: 216px;" id="buscar" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />
                                </div>
                                    <table id="tabla" class="table table-bordered table-hover formulario_ver_propuesta" style="font-size: 78%;;width: 206%;margin-left: -53%;">

                                        <tr>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                        </tr>
                                        <%List<DtinfoPropuesta> propuestas = (List<DtinfoPropuesta>) request.getAttribute("Propuestas");
                    for (DtinfoPropuesta dtp : propuestas) {%>
                                        <tr>

                                            <td><p><%=dtp.getTitulo()%></p></td>&nbsp;&nbsp;&nbsp;
                                            <td><text style="background-color: white; resize: none;width: 300px; height: 100px;"><%=dtp.getDescripcion()%></text></td> 
                                            <td>
                                                <form action="ServletMarcarFavorita" method="POST">
                                                    <input  name="TituloP" type="hidden" value="<%=dtp.getTitulo()%>"/>
                                                    <input class="btn btn-primary"  onclick="submit()" type="button" value="Marcar como favorita"/>
                                                </form>
                                            </td>

                                        </tr>
                                        <%}%>

                                    </table>
                                    <div style="align:center">
                                        <a href="javascript:window.history.back();" class="btn btn-primary"> &laquo; Volver</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br><br><br><br><br>        
        <jsp:include page="/Vistas/footer.jsp" />
    </body>
</html>
