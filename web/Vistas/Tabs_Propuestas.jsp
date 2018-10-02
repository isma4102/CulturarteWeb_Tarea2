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
                <li class="active"><a href="#hometab" role="tab" data-toggle="tab">Propuestas Creadas</a></li>
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
                                    int j = 0, k = 0;
                                    List<DtPropuestaWeb> listP = (List<DtPropuestaWeb>) request.getAttribute("enFinanciacion");
                                    for (int i = 0; i < listP.size(); i++) {
                                        out.print("<div class=\"col-sm-6 col-md-3\">");
                                        out.print("<div  class=\"thumbnail\">");
                                        out.print("<div class=\"caption\">");
                                        out.print("<h3 style=\"width: 135%;\">" + listP.get(i).getTituloP() + "</h3>");
                                        out.print("<textarea readonly style=\"height: 160px;resize: none\" class=\"form-control rounded-0\" rows=\"20\">" + listP.get(i).getDescrip() +"</textarea>");
                                        out.print("<p>");
                                        out.print("<p>" + listP.get(i).getRecaudacion() + " </p>");
                                        //arranca barrita
                                        out.print("<div class='progress progress-striped'>");
                                        out.print("<div class='progress-bar progress-bar-info' role='progressbar'");
                                        out.print("aria-valuenow='" + listP.get(i).getPorcentaje() + "' aria-valuemin='0' aria-valuemax='100'");
                                        out.print("style='width: " + listP.get(i).getPorcentaje() + "%'>");
                                        out.print("<span class='sr-only'>20% completado</span>");
                                        out.print("</div>");
                                        out.print("</div>");
                                        //termina barrita
                                        out.print("<p> " + listP.get(i).getTiempoR() + " </p>");
                                        out.print("<p> " + listP.get(i).getColaboradores() + " </p>");
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
            <div style="color: black" class="tab-pane" id="javatab">The Java is an object-oriented programming language <br /> that was developed by James Gosling from the Sun Microsystems in 1995.</div>
            <div style="color: black" class="tab-pane" id="csharptab">C# is also a programming language</div>
            <div style="color: black" class="tab-pane" id="mysqltab">MySQL is a databased mostly used for web applications.</div>
            <div style="color: black" class="tab-pane" id="jquerytab">jQuery content here</div>

        </div>
</body>
</html>