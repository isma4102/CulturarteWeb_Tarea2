<%-- 
    Document   : FuncionamientoCorrecto
    Created on : 17/09/2018, 04:47:25 PM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"></div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="profile" style="width: 157%;margin-left: -27%;">
                                <div class="modal-content formulario" style="margin-top: 8%;width: 42%;margin-left: 29%;">
                                    <div class="modal-header">
                                        <h3 align="center" class="modal-title" id="exampleModalLabel">Resultado de la operacion realizada</h3>
                                    </div>
                                    <div class="modal-body">
                                        <h3 style="text-align: center;"><%out.print(request.getAttribute("mensaje"));%></h3>
                                    </div>
                                </div>
                                    <br><br>
                                <div style="text-align: center">
                                    <a href="/CulturarteWeb/ServletAltaPropuesta" class="btn btn-primary"> &laquo; Generar una nueva propuesta</a>
                                    <a style="color:#FFFFFF" class="btn btn-primary" href="/CulturarteWeb/ServletInicio">Regresar al Inicio</a>
                                </div>
                                    <br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 25%;" >
            <jsp:include page="/Vistas/footer.jsp" /> 
        </div>

    </body>
</html>
