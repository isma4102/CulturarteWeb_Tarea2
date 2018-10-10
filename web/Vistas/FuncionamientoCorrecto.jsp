<%-- 
    Document   : FuncionamientoCorrecto
    Created on : 17/09/2018, 04:47:25 PM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
                        <h5 align="center" class="modal-title" id="exampleModalLabel">Resultado de la operacion realizada</h5>

                    </div>
                    <div class="modal-body">
                        <%out.print(request.getAttribute("mensaje"));%>
                    </div>
                    <div class="modal-footer">
                        <a href="/CulturarteWeb/ServletAltaPropuesta" class="btn btn-primary"> &laquo; Generar una nueva propuesta</a>
                       <a style="color:#FFFFFF" class="btn btn-primary" href="/CulturarteWeb/ServletInicio">Regresar al Inicio</a> </button>

                    </div>
                </div>
            </div>
        </div>
       
                
                
    </body>
</html>
