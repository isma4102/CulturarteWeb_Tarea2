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
       
    </head>
    <body>
                <jsp:include page="/Vistas/Barra_menu.jsp" />

               <div class="modal-content formulario" style="margin-top: 8%;width: 32%;margin-left: 34%;">

                    <div class="modal-header">
                        <h5 align="center" class="modal-title" id="exampleModalLabel">Mensaje</h5>

                    </div>
                    <div class="modal-body">
                        <%out.print(request.getAttribute("mensaje"));%>
                    </div>
                    <div class="modal-footer">
                        <a href="javascript:window.history.back();" class="btn btn-primary"> &laquo; Volver</a>
                       <a style="color:#FFFFFF" class="btn btn-primary" href="/CulturarteWeb/ServletInicio">Salir al Inicio</a> </button>

                    </div>
               </div>
                    <div style="margin-top: 26%;">
    <jsp:include page="/Vistas/footer.jsp" /> 
                    </div>

    </body>
</html>
