<%-- 
    Document   : iniciarSesion
    Created on : 11/09/2018, 11:06:29 PM
    Author     : PabloDesk
--%>

<%@page import="clases.EstadoSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/CulturarteWeb/css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
        <title>Iniciar Sesion:: CulturarteWeb</title>

    </head>
    <body>
        <font face=""
              <jsp:include page="/Vistas/Barra_menu.jsp" />
              <div style="margin-top: 11%;margin-left: -15%;" >
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                        <div style="width: 166%;font-size: 119%;" class="card card-login">
                            <div class="card-header card-header-primary text-center">
                                <h2 class="card-title">Iniciar sesión</h2>

                            </div>
                            <div id="Error_login" style="display: none;" class="alert alert-danger" role="alert">
                                <span class="sr-only">Error:</span>
                                <% if (request.getAttribute("errorContrasenia") != null) {%>
                                Contraseña Incorrecta.
                                <%} else {%>                  
                                Usuario Incorrecto, reintente o Registrese si aun no tiene una cuenta.                  
                                <%}%>  
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="well">
                                            <form id="loginForm" action="${pageContext.request.contextPath}/iniciar-sesion" method="POST">
                                                <div class="form-group">
                                                    <label for="username" class="control-label">Nickname o Email:</label>
                                                    <input type="text" name="login" id="inputEmail" class="form-control" placeholder="Nickname o Email..." required autofocus>
                                                    <span class="help-block"></span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password" class="control-label">Contraseña:</label>
                                                    <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Contraseña..." required>
                                                    <span class="help-block"></span>
                                                </div>
                                                <div class="checkbox">
                                                </div>
                                                <button  class="btn btn-block" onclick="submit()">Iniciar Sesión</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <p class="lead">Registrate en <span class="text-success">Culturarte</span></p>
                                        <ul class="list-unstyled" style="line-height: 2">
                                            <li><span class="fa fa-check text-success"></span>- Crear Propuestas</li>
                                            <li><span class="fa fa-check text-success"></span>- Seguir usuarios</li>
                                            <li><span class="fa fa-check text-success"></span>- Colaborar en propuestas</li>
                                            <li><span class="fa fa-check text-success"></span>- Ver propuestas y usuarios</li>
                                        </ul>
                                        <p><a style="margin-top: 3rem;width: 82%;" href="/CulturarteWeb/altaUsuarioServlet" class="btn btn-block">Registrarse</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>	
        <script type="text/javascript">
            <% if (request.getSession().getAttribute("estado_sesion") == EstadoSesion.LOGIN_INCORRECTO
                        || request.getSession().getAttribute("estado_sesion") == EstadoSesion.CONTRASENIA_INCORRECTA) { %>
            var var2 = document.getElementById('Error_login');
            var2.style.display = "block";
            <% }%>
        </script>        
        <br><br><br>
        <jsp:include page="/Vistas/footer.jsp" />
    </body>
</html>
