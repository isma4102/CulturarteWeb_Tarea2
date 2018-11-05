<%-- 
    Document   : ConsultarPropuesta
    Created on : 16/09/2018, 11:20:12 PM
    Author     : Martin
--%>

<%@page import="servicios.DtNickTitProp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="css/RegistrarColaboracion.css" rel="stylesheet">
        <script type="text/javascript" src="script/FiltrarTabla.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Culturarte</title>
    </head>
    <body >
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"></div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile" style="width: 157%;margin-left: -27%;">
                                <table id="tabla" class="table table-bordered table-hover formulario">
                                    <thead>
                                    <h2  style=" text-align: center;top: 76px;">Consulta de propuesta</h2>
                                    <div style="text-align: center">
                                        <input id="buscar" style=" display: block;margin-right: auto;margin-left: auto;width: 216px" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />
                                    </div>

                                    <tr>
                                        <th style="color:black" class="active">Titulo</th>
                                        <th style="color:black" class="active">Categoria</th>
                                        <th style="color:black" class="active">Ver informacion</th>
                                    </tr>
                                    </thead>
                                    <div style="overflow: auto">
                                        <tbody>
                                            <%
                                                List<DtNickTitProp> lista = (List<DtNickTitProp>) request.getAttribute("listaPropuestas");
                                                for (int i = 0; i < lista.size(); i++) {
                                                    out.print("<tr>");
                                                    out.print("<form class=\"form-signin\" action=\"ServletConsultarPropuesta\" method=\"POST\"> ");
                                                    out.print("<input style=\"border:none\" type=\"hidden\" class=\"form-control-plaintext\" name=\"TituloP\" value=\"" + lista.get(i).getTitulo() + "\" readonly=\"readonly\"/>");
                                                    out.print("<td><p>" + lista.get(i).getTitulo() + " </p></td>");
                                                    out.print("<td><p>" + lista.get(i).getProponente() + "</p></td>");
                                                    out.print("<td><button style=\"background:url('/CulturarteWeb/Imagenes/ver.png');background-position:center center;background-repeat:no-repeat;width:70px; height:25px\" type=\"input\" name=\"Ver\" class=\"btn btn-primary\"></button></td>");
                                                    out.print("</form>");
                                                    out.print("</tr>");
                                                }
                                            %>
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                            <div style="text-align: center  ">
                                            <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
                                            <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
                                        </div>
                                        <br><br>
        </div>
        <br><br><br><br>
        <jsp:include page="/Vistas/footer.jsp" />
    </body>
</html>
