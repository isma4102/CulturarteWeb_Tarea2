<%-- 
    Document   : passIncorrecto
    Created on : 01/10/2018, 09:55:09 AM
    Author     : PabloDesk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="/CulturarteWeb/css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
        <title>Iniciar Sesion:: CulturarteWeb</title>
    </head>
    <body>
        <div id="login-overlay" class="modal-dialog">
            <div class="modal-content" style="    margin-top: 18%;">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Ingrese sus datos</h4>
                </div>
                <div class="alert alert-danger" role="alert">
  		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  		<span class="sr-only">Error:</span>
  		Contraseña incorrecta
		</div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="well">
                                <form id="loginForm" action="iniciar-sesion" method="post">
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
                                        <!--
                                        <label1>
                                            <input type="checkbox" name="checkRecordar" value="">Recordarme
                                        </label1>
                                        -->
                                    </div>
                                    <button style="background-color: #016699; color : white"  class="btn btn-block" onclick="submit()">Iniciar Sesión</button>
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
                            <p><a style="background-color: #1867F0; color : white" href="/CulturarteWeb/altaUsuarioServlet" class="btn btn-info btn-block">Registrarse</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>	


    </body>
</html>
