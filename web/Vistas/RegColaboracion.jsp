<%-- 
    Document   : RegColaboracion
    Created on : 18/09/2018, 07:14:01 PM
    Author     : Santiago.S
--%>

<%@page import="servicios.DtListaPropuestasR"%>
<%@page import="servicios.DtinfoPropuesta"%>
<%@page import="servicios.DtinfoColaborador"%>
<%@page import="servicios.DtNickTitProp"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       

        <link href="css/RegistrarColaboracion.css" rel="stylesheet">
        <script type="text/javascript" src="script/FiltrarTabla.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
                            <div class="profile" >
                                <table style="font-size: 76%;" id="tabla" class="table table-bordered table-hover formulario">
                                    <thead>
                                    <h2 style="text-align: center">Registro de colaboración a propuesta</h2>

                                    <input id="buscar" style=" display: block;margin-right: auto;margin-left: auto;width: 216px" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />


                                    <tr>
                                        <th style="color:black" class="active">Registrar</th>
                                        <th style="color:black" class="active">Titulo de Propuesta</th>
                                        <th style="color:black" class="active">Nombre del Proponente</th>
                                        <th style="color:black" class="active">Estado de la propuesta</th>
                                        <th style="color:black" class="active">Ver</th>
                                    </tr>
                                    </thead>
                                    <div style="overflow: auto">
                                        <tbody>
                                            <%
                                                List<DtListaPropuestasR> lista = (List<DtListaPropuestasR>) request.getAttribute("lista_propuestas");
                                                for (int i = 0; i < lista.size(); i++) {
                                                    out.print("<tr>");
                                                    out.print("<form class=\"form-signin\" action=\"ServletConsultarPropuesta\" method=\"POST\"> ");
                                                    out.print("<td><button style=\"background:url('/CulturarteWeb/Imagenes/selecc.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px\"  type=\"input\" name=\"seleccionar\" class=\"btn btn-primary\"></button></td>");
                                                    out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + lista.get(i).getTitulo() + "\" readonly=\"readonly\"/>");
                                                    out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"Estado\" value=\"" + lista.get(i).getEstado().toString() + "\" readonly=\"readonly\"/>");
                                                    out.print("<td><p> " + lista.get(i).getTitulo() + "</p></td>");
                                                    out.print("<input type=\"hidden\" class=\"form-control-plaintext\" name=\"Proponente\" value=\"" + lista.get(i).getProponente() + "\" readonly=\"readonly\"/>");
                                                    out.print("<td><p> " + lista.get(i).getProponente() + "</p></td>");
                                                    out.print("<td><p> " + lista.get(i).getEstado().toString() + "</p></td>");
                                                    out.print("<td><button style=\"background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center;background-repeat:no-repeat;width:70px; height:25px\" type=\"input\" name=\"Ver\" class=\"btn btn-primary\"></button></td>");
                                                    out.print("</form>");
                                                    out.print("</tr>");
                                                }
                                            %>
                                        </tbody>
                                </table>
                                        <br><br>
                                <div style=" text-align: center;">
                                    <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
                                    <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
                                </div>
                                        <br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                        <br><br>
        <jsp:include page="/Vistas/footer.jsp" /> 

    </body>
</html>
