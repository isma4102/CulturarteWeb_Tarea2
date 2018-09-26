<%-- 
    Document   : ConsultarPropuesta
    Created on : 16/09/2018, 11:20:12 PM
    Author     : Martin
--%>

<%@page import="logica.Clases.DtNickTitProp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="../jquery.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Propuesta</title>
    </head>
    <body>        
        <jsp:include page="/ServletConsultarPropuesta"/> 
        <form action="ServletConsultarPropuesta" method="get">
            <div >
                <table name ="tbPropuestas" style="border: 1">
                    <thead>
                        <tr>
                            <th class="active">Titulo de Propuesta</th>
                            <th class="active">Categoria</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>

                            <%
                                List<DtNickTitProp> lista = (List<DtNickTitProp>) request.getAttribute("listaPropuestas");
                                for (int i = 0; i < lista.size(); i++) {
                                    out.print("<tr>");
                                    out.print("<label for=\"" + i + "\"></label></td>");
                                    out.print("<td > " + lista.get(i).getTituloP() + "\")\">" + lista.get(i).getTituloP() + "</td>");
                                    out.print("<td>" + lista.get(i).getProponente() + "</td>");
                                    out.print("</tr>");
                                }

                            %>
                    <script type="text/javascript"></script>
                    <div>
                        <label >texto </labe>
                            <input name ="txtNombre" type="text"/> 
                    </div>
                    <script>
                        $('#tbPropuestas tr').on('click', function () {
                            var dato = $(this).find('td:first').html();
                            $('#txtNombre').val(dato);
                        });
                    </script>
                    </tbody>
                </table>
            </div>

        </form>

    </body>
</html>
