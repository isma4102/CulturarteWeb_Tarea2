
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="/CulturarteWeb/script/jquery.js"></script>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/CulturarteWeb/css/AltaProp.css" />
        <link rel="stylesheet" type="text/css" href="/CulturarteWeb/css/bootstrap.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Propuesta</title>

        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {%>
        <script type="text/javascript">
            window.alert("<%= mensaje%>");
            location.href = "/CulturarteWeb/ServletInicio";
        </script>
        <%  }
        %>

    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div style="margin-top: 7%;" class="formulario">
            <h1>Informacion de la propuesta:</h1>
            <form action="ServletAltaPropuesta" method="post" onsubmit="return validarPropuesta()" enctype="multipart/form-data">

                <div >
                    <label for="Categoria">Categoria </label>
                    <select class="form-control" id="Categoria" name="Categoria">
                        <%
                            List<String> listCat = (List<String>) request.getAttribute("listCat");
                            for (int i = 0; i < listCat.size(); i++) {
                                out.print("<option value =" + listCat.get(i) + ">" + listCat.get(i) + "</option>");
                            };
                        %>
                    </select>
                </div>
                <br>
                <div>
                    <label for="TituloP">Titulo: </label>
                    <input  class="form-control" id="TituloP" name="TituloP" type="text"/>
                    <span id="error_TituloP" class="error" >Ingrese 4 caracteres o mas.</span>
                </div>
                <br>
                <div>
                    <label for="lugar">Lugar:</label>
                    <input class="form-control" id="LugarP" name="LugarP" type="text"  maxlength="30"/>
                    <span id="error_LugarP" class="error">Ingrese 4 caracteres o mas.</span>
                </div>
                <br>
                <div>
                    <label for="descripcion">Descripcion:</label>
                    <input class="form-control" id="Descripcion" name="Descripcion" type="text" size="15" maxlength="1000"/>
                </div>
                <br>
                <div>
                    <label for="montoTot">Monto total:</label>
                    <input class="form-control" id="MontoT" name="MontoT" type="number" size="15" maxlength="12"/>
                    <span id="error_MontoT" class="error">Debes ingresar un monto valido</span>
                </div>
                <br>
                <div>
                    <label for="montoE">Monto entrada:</label>
                    <input class="form-control" id="MontoE" name="MontoE" type="number" size="15" maxlength="10"/>
                    <span id="error_MontoE" class="error">Debes ingresar un monto por Entrada valido</span>
                </div>
                <br>
                <div>
                    <label for="fechaR">Fecha de realizacion:</label>
                    <input class="form-control" id="FechaR" name="FechaR" type="date" size="15" maxlength="30" required/>
                    <span id="error_FechaR" class="error">Debes ingresar una fecha superior a la fecha actual</span>
                </div>
                <br>
                <div class="btn btn-default image-preview-input">
                    <span >Selecciona imagen para tu perfil</span>
                    <input class="form-control" type="file" accept="image/png, image/jpeg" id="imagen" name="imagen"/> <!-- rename it -->
                </div>
                <br>
                <div>

                    <input class="btn btn-primary btn-block form-control" type="submit" value="Crear Propuesta" />
                </div>

            </form>
            <script type="text/javascript" src="/CulturarteWeb/AltaPropuesta.js"></script>
        </div>
    </body>
</html>
