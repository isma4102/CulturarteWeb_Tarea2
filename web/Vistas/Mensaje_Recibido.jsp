<%-- 
    Document   : Mensaje_Recibido
    Created on : 23/09/2018, 04:18:12 PM
    Author     : Santiago.S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensaje Recibido</title>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script>
            $(document).ready(function ()
            {
                $("#mostrarmodal").modal("show");
            });
        </script>
    </head>
    <body>
        <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 align="center" class="modal-title" id="exampleModalLabel">Mensaje</h5>

                    </div>
                    <div class="modal-body">
                        <%out.print(request.getAttribute("mensaje"));%>
                    </div>
                    <div class="modal-footer">
                        <a href="javascript:window.history.back();" class="btn btn-danger"> &laquo; Volver</a>
                        <button type="button" class="btn btn-primary"> <a style="color:#FFFFFF" href="/CulturarteWeb/ServletInicio">Salir al Inicio</a> </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
