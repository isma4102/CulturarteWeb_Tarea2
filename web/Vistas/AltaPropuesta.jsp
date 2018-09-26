
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="/CulturarteWeb/script/jquery.js"></script>
        <link rel="stylesheet" type="text/css" href="/CulturarteWeb/css/AltaProp.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Propuesta</title>
    </head>
    <body>

        <h1>Informacion de la propuesta:</h1>
        <form action="ServletAltaPropuesta" method="post" onsubmit="return validarPropuesta()">
            <div>
                <label for="Categoria">Categoria </label>
                <select id="Categoria" name="Categoria">
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
                <input  id="TituloP" name="TituloP" type="text" size="15" maxlength="30"/>
                <span id="error_TituloP" class="error" >Ingrese 4 caracteres o mas.</span>
            </div>
            <br>
            <div>
                <label for="lugar">Lugar:</label>
                <input id="LugarP" name="LugarP" type="text" size="15" maxlength="30"/>
                <span id="error_LugarP" class="error">Ingrese 4 caracteres o mas.</span>
            </div>
            <br>
            <div>
                <label for="descripcion">Descripcion:</label>
                <input id="Descripcion" name="Descripcion" type="text" size="15" maxlength="1000"/>
            </div>
            <br>
            <div>
                <label for="montoTot">Monto total:</label>
                <input id="MontoT" name="MontoT" type="number" size="15" maxlength="12"/>
                <span id="error_MontoT" class="error">Debes ingresar un monto valido</span>
            </div>
            <br>
            <div>
                <label for="montoE">Monto entrada:</label>
                <input id="MontoE" name="MontoE" type="number" size="15" maxlength="10"/>
                <span id="error_MontoE" class="error">Debes ingresar un monto por Entrada valido</span>
            </div>
            <br>
            <div>
                <label for="fechaR">Fecha de realizacion:</label>
                <input id="FechaR" name="FechaR" type="date" size="15" maxlength="30" required/>
                <span id="error_FechaR" class="error">Debes ingresar una fecha superior a la fecha actual</span>
            </div>
            <br>
            <div>

                <input type="submit" value="Crear Propuesta" />
            </div>
        </form>
                <script type="text/javascript" src="/CulturarteWeb/AltaPropuesta.js"></script>
    </body>
</html>
