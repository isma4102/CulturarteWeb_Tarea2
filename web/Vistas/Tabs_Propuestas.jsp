<%@page import="java.util.List"%>
<%@page import="logica.Clases.DtPropuestaWeb"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="/CulturarteWeb/js/jquery.js"></script>
        <link href="css/RegistrarColaboracion.css" rel="stylesheet">
        <link href="css/Tabs_diseño.css" rel="stylesheet">
    </head>
    <body> 
        </br></br></br></br>
        <div class="container formulario_tabs">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#hometab" role="tab" data-toggle="tab">Propuestas Publicadas</a></li>
                <li><a href="#javatab" role="tab" data-toggle="tab">Propuestas en Financiación</a></li>
                <li><a href="#csharptab" role="tab" data-toggle="tab">Propuestas Financiadas</a></li>
                <li><a href="#mysqltab" role="tab" data-toggle="tab">Propuestas NO Financiadas</a></li>
                <li><a href="#jquerytab" role="tab" data-toggle="tab">Propuestas Canceladas</a></li>

            </ul>
        </li>

        <!-- Tab panes -->
        <div class="tab-content">
            <div  style = 'color: black' class='tab-pane active' id = 'hometab'>
                <div class="wrapper">
                    <div class="scroller">
                        <div class="container" style="padding-top: 1em;">
                            <div class="row">
                                <%
                                    List<DtPropuestaWeb> listP = (List<DtPropuestaWeb>) request.getAttribute("Publicada");
                                    for (int i = 0; i < listP.size(); i++) {
                                        out.print("<div class=\"col-sm-6 col-md-3\">");
                                        out.print("<div  class=\"thumbnail\">");
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
            <div style="color: black" class="tab-pane" id="javatab">
                <div class="wrapper">
                    <div class="scroller">
                        <div class="container" style="padding-top: 1em;">
                            <div class="row">
                                <% List<DtPropuestaWeb> listEnF = (List<DtPropuestaWeb>) request.getAttribute("enFinanciacion");
                                    for (int i = 0; i < listEnF.size(); i++) {
                                        out.print("<div class=\"col-sm-6 col-md-3\">");
                                        out.print("<div  class=\"thumbnail\">");
                                        out.print("<div class=\"caption\">");
                                        out.print("<h3 style=\"width: 135%;\">" + listEnF.get(i).getTituloP() + "</h3>");
                                        //out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listP.get(i).getTituloP() + "</textarea>");
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
            <div style="color: black" class="tab-pane" id="csharptab">
                <div class="wrapper">
                    <div class="scroller">
                        <div class="container" style="padding-top: 1em;">
                            <div class="row">
                                <% List<DtPropuestaWeb> listF = (List<DtPropuestaWeb>) request.getAttribute("Financiada");
                                    for (int i = 0; i < listF.size(); i++) {
                                        out.print("<div class=\"col-sm-6 col-md-3\">");
                                        out.print("<div  class=\"thumbnail\">");
                                        out.print("<div class=\"caption\">");
                                        out.print("<h3 style=\"width: 135%;\">" + listF.get(i).getTituloP() + "</h3>");
                                        //out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listP.get(i).getTituloP() + "</textarea>");
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
            <div style="color: black" class="tab-pane" id="mysqltab">
                <div class="wrapper">
                    <div class="scroller">
                        <div class="container" style="padding-top: 1em;">
                            <div class="row">
                                <% List<DtPropuestaWeb> listNoF = (List<DtPropuestaWeb>) request.getAttribute("noFinanciada");
                                    for (int i = 0; i < listNoF.size(); i++) {
                                        out.print("<div class=\"col-xs-6 col-md-3\">");
                                        out.print("<div  class=\"thumbnail\">");
                                        out.print("<div class=\"caption\">");
                                        out.print("<h3 style=\"width: 135%;\">" + listNoF.get(i).getTituloP() + "</h3>");
                                        //out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listP.get(i).getTituloP() + "</textarea>");
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
            <div style="color: black" class="tab-pane" id="jquerytab">
                <div class="wrapper">
                    <div class="scroller">
                        <div class="container" style="padding-top: 1em;">
                            <div class="row">
                                <% List<DtPropuestaWeb> listC = (List<DtPropuestaWeb>) request.getAttribute("Cancelada");
                                    for (int i = 0; i < listC.size(); i++) {
                                        out.print("<div class=\"col-sm-6 col-md-3\">");
                                        out.print("<div  class=\"thumbnail\">");
                                        out.print("<div class=\"caption\">");
                                        out.print("<h3 style=\"width: 135%;\">" + listC.get(i).getTituloP() + "</h3>");
                                        //out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listP.get(i).getTituloP() + "</textarea>");
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
</body>
</html>