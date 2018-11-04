<%@page import="java.util.List"%>
<%@page import=" servicios.DtPropuestaWeb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/RegistrarColaboracion.css" rel="stylesheet">
            
        <link href="css/Tabs_diseño.css" rel="stylesheet">
    </head>
    <body> 
        </br></br></br></br>
        <div style="font-size: 52%;margin-left: -56%;width: 212%;" class="container_tabs">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#publicadas" role="tab" data-toggle="tab">Propuestas Publicadas</a></li>
                <li><a href="#en_financiacion" role="tab" data-toggle="tab">Propuestas en Financiación</a></li>
                <li><a href="#financiadas" role="tab" data-toggle="tab">Propuestas Financiadas</a></li>
                <li><a href="#no_financiadas" role="tab" data-toggle="tab">Propuestas NO Financiadas</a></li>
                <li><a href="#canceladas" role="tab" data-toggle="tab">Propuestas Canceladas</a></li>

            </ul>
      

        <!-- Tab panes -->
        <div class="tab-content">
            <div  style = 'color: black' class='tab-pane active' id = 'publicadas'>
                <div class="wrapper">
                    <div class="scroller" style="overflow-y: scroll;">
                        <div class="contenedor-tabla">
                            <div class="contenedor-fila">
                                <div class="container" style="padding-top: 1em;">
                                    <div class="row" >
                                        <%
                                            List<DtPropuestaWeb> listP = (List<DtPropuestaWeb>) request.getAttribute("Publicada");
                                            for (int i = 0; i < listP.size(); i++) {
                                                out.print("<div style=\"margin-left: 30px;\" class=\"contenedor-columna\">");
                                                out.print("<div  class=\"thumbnail\">");
                                                out.print("<div style=\"margin-left: 16%;\">");
                                                out.print("<img width=\"100\" height=\"100\" src=\"/CulturarteWeb/ServletImagenes?TituloP=" + listP.get(i).getTituloP() + "\" >");
                                                out.print("</div>");
                                                out.print("<div class=\"caption\">");
                                                out.print("<h3 style=\"width: 135%;\">" + listP.get(i).getTituloP() + "</h3>");
                                                out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listP.get(i).getDescrip() + "</textarea>");
                                                out.print("<p>");
                                                out.print("<p> Recaudacion: " + listP.get(i).getRecaudacion() + " </p>");
                                                //arranca barrita
                                                out.print("<div class='progress progress-striped'>");
                                                out.print("<div class='progress-bar progress-bar-info' role='progressbar'");
                                                out.print("aria-valuenow='" + listP.get(i).getPorcentaje() + "' aria-valuemin='0' aria-valuemax='100'");
                                                out.print("style='width: " + listP.get(i).getPorcentaje() + "%'>");
                                                out.print("<span class='sr-only'>20% completado</span>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                //termina barrita
                                                out.print("<p> Tiempo:" + listP.get(i).getTiempoR() + " </p>");
                                                out.print("<p> Cantidad Colab: " + listP.get(i).getColaboradores() + " </p>");
                                                out.print("</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="color: black" class="tab-pane" id="en_financiacion">
                <div class="wrapper">
                    <div class="scroller" style="overflow-y: scroll;">
                        <div class="contenedor-tabla">
                            <div class="contenedor-fila">
                                <div class="container" style="padding-top: 1em;">
                                    <div class="row">
                                        <% List<DtPropuestaWeb> listEnF = (List<DtPropuestaWeb>) request.getAttribute("enFinanciacion");
                                            for (int i = 0; i < listEnF.size(); i++) {
                                                out.print("<div class=\"contenedor-columna\">");
                                                out.print("<div  class=\"thumbnail\">");
                                                out.print("<div style=\"margin-left: 25%;\">");
                                                out.print("<img width=\"100\" height=\"100\" src=\"/CulturarteWeb/ServletImagenes?TituloP=" + listEnF.get(i).getTituloP() + "\" >");
                                                out.print("</div>");
                                                out.print("<div class=\"caption\">");
                                                out.print("<h3 style=\"width: 135%;\">" + listEnF.get(i).getTituloP() + "</h3>");
                                                out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listEnF.get(i).getDescrip() + "</textarea>");
                                                out.print("<p>");
                                                out.print("<p> Recaudacion: " + listEnF.get(i).getRecaudacion() + " </p>");
                                                //arranca barrita
                                                out.print("<div class='progress progress-striped'>");
                                                out.print("<div class='progress-bar progress-bar-info' role='progressbar'");
                                                out.print("aria-valuenow='" + listEnF.get(i).getPorcentaje() + "' aria-valuemin='0' aria-valuemax='100'");
                                                out.print("style='width: " + listEnF.get(i).getPorcentaje() + "%'>");
                                                out.print("<span class='sr-only'>20% completado</span>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                //termina barrita
                                                out.print("<p> Tiempo:" + listEnF.get(i).getTiempoR() + " </p>");
                                                out.print("<p> Cantidad Colab: " + listEnF.get(i).getColaboradores() + " </p>");
                                                out.print("</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="color: black" class="tab-pane" id="financiadas">
                <div class="wrapper">
                    <div class="scroller" style="overflow-y: scroll;">
                        <div class="contenedor-tabla">
                            <div class="contenedor-fila">
                                <div class="container" style="padding-top: 1em;">

                                    <div class="row">

                                        <% List<DtPropuestaWeb> listF = (List<DtPropuestaWeb>) request.getAttribute("Financiada");
                                            for (int i = 0; i < listF.size(); i++) {
                                                out.print("<div class=\"contenedor-columna\">");
                                                out.print("<div class=\"thumbnail\">");
                                                out.print("<div style=\"margin-left: 16%;\">");
                                                out.print("<img width=\"100\" height=\"100\" src=\"/CulturarteWeb/ServletImagenes?TituloP=" + listF.get(i).getTituloP() + "\" >");
                                                out.print("</div>");
                                                out.print("<div class=\"caption\">");
                                                out.print("<h3 style=\"width: 135%;\">" + listF.get(i).getTituloP() + "</h3>");
                                                out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listF.get(i).getDescrip() + "</textarea>");
                                                out.print("<p>");
                                                out.print("<p> Recaudacion: " + listF.get(i).getRecaudacion() + " </p>");
                                                //arranca barrita
                                                out.print("<div class='progress progress-striped'>");
                                                out.print("<div class='progress-bar progress-bar-info' role='progressbar'");
                                                out.print("aria-valuenow='" + listF.get(i).getPorcentaje() + "' aria-valuemin='0' aria-valuemax='100'");
                                                out.print("style='width: " + listF.get(i).getPorcentaje() + "%'>");
                                                out.print("<span class='sr-only'>20% completado</span>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                //termina barrita
                                                out.print("<p> Tiempo:" + listF.get(i).getTiempoR() + " </p>");
                                                out.print("<p> Cantidad Colab: " + listF.get(i).getColaboradores() + " </p>");
                                                out.print("</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="color: black" class="tab-pane" id="no_financiadas">
                <div class="wrapper">
                    <div class="scroller" style="overflow-y: scroll;">
                        <div class="contenedor-tabla">
                            <div class="contenedor-fila">
                                <div class="container" style="padding-top: 1em;">
                                    <div class="row">
                                        <% List<DtPropuestaWeb> listNoF = (List<DtPropuestaWeb>) request.getAttribute("noFinanciada");
                                            for (int i = 0; i < listNoF.size(); i++) {
                                                out.print("<div style=\"padding-left: 30px;\" flex-direction: row class=\"contenedor-columna\">");
                                                out.print("<div  class=\"thumbnail\">");
                                                out.print("<div style=\"margin-left: 16%;\">");
                                                out.print("<img width=\"100\" height=\"100\" src=\"/CulturarteWeb/ServletImagenes?TituloP=" + listNoF.get(i).getTituloP() + "\" >");
                                                out.print("</div>");
                                                out.print("<div class=\"caption\">");
                                                out.print("<h3 style=\"width: 135%;\">" + listNoF.get(i).getTituloP() + "</h3>");
                                                out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listNoF.get(i).getDescrip() + "</textarea>");
                                                out.print("<p>");
                                                out.print("<p> Recaudacion: " + listNoF.get(i).getRecaudacion() + " </p>");
                                                //arranca barrita
                                                out.print("<div class='progress progress-striped'>");
                                                out.print("<div class='progress-bar progress-bar-info' role='progressbar'");
                                                out.print("aria-valuenow='" + listNoF.get(i).getPorcentaje() + "' aria-valuemin='0' aria-valuemax='100'");
                                                out.print("style='width: " + listNoF.get(i).getPorcentaje() + "%'>");
                                                out.print("<span class='sr-only'>20% completado</span>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                //termina barrita
                                                out.print("<p> Tiempo:" + listNoF.get(i).getTiempoR() + " </p>");
                                                out.print("<p> Cantidad Colab: " + listNoF.get(i).getColaboradores() + " </p>");
                                                out.print("</p>");
                                                out.print("</div>");
                                                out.print("</div>");
                                                out.print("</div>");
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="color: black" class="tab-pane" id="canceladas">
                <div class="wrapper">
                    <div class="scroller" style="overflow-y: scroll;">
                        <div class="container" style="padding-top: 1em;">
                            <div class="row">
                                <% List<DtPropuestaWeb> listC = (List<DtPropuestaWeb>) request.getAttribute("Cancelada");
                                    for (int i = 0; i < listC.size(); i++) {
                                        out.print("<div class=\"contenedor-columna\">");
                                        out.print("<div  class=\"thumbnail\">");
                                        out.print("<div style=\"margin-left: 16%;\">");
                                        out.print("<img width=\"100\" height=\"100\" src=\"/CulturarteWeb/ServletImagenes?TituloP=" + listC.get(i).getTituloP() + "\" >");
                                        out.print("</div>");
                                        out.print("<div class=\"caption\">");
                                        out.print("<h3 style=\"width: 135%;\">" + listC.get(i).getTituloP() + "</h3>");
                                        out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listC.get(i).getDescrip() + "</textarea>");
                                        out.print("<p>");
                                        out.print("<p> Recaudacion: " + listC.get(i).getRecaudacion() + " </p>");
                                        //arranca barrita
                                        out.print("<div class='progress progress-striped'>");
                                        out.print("<div class='progress-bar progress-bar-info' role='progressbar'");
                                        out.print("aria-valuenow='" + listC.get(i).getPorcentaje() + "' aria-valuemin='0' aria-valuemax='100'");
                                        out.print("style='width: " + listC.get(i).getPorcentaje() + "%'>");
                                        out.print("<span class='sr-only'>20% completado</span>");
                                        out.print("</div>");
                                        out.print("</div>");
                                        //termina barrita
                                        out.print("<p> Tiempo:" + listC.get(i).getTiempoR() + " </p>");
                                        out.print("<p> Cantidad Colab: " + listC.get(i).getColaboradores() + " </p>");
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
