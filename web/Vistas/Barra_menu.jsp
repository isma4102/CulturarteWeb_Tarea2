<%@page import="logica.Clases.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Culturarte</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" >
        <link rel="icon" href="culturarte.ico" type="image/x-icon" >
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="/CulturarteWeb/js/jquery.js"></script>
        <style>
            .dev-page{visibility: hidden; }            
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" onclick="toggleSidebarEsconder()">
                        <img src="Imagenes/menu-icono.png" alt="" class="menu-bar">

                    </button>
                    <jsp:include page="/Vistas/Menu_lateral.jsp"/>
                </div>
                <div class="navbar-collapse collapse" id="navbar">
                    <ul class="nav navbar-nav navbar-right">
                        <% if ((DtUsuario) request.getSession().getAttribute("usuario_logueado") != null) {
                                out.print("<img style=\"margin-top: 7px\" src=\"Imagenes/nadie.png\" class=\"img-circle\" width=\" 40\" height=\"40\">");
                                out.print("<a style=\"color: white;margin-left: 8%;\" href=\"#\">" + ((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickName() + "</a>");
                                out.print("<div>");
                                out.print("<a style=\"color: white\" href=\"\"> Perfil </a>");
                                out.print("<a style=\"color: white\">  |  </a>");
                                out.print("<a style=\"color: white\" href=\"/CulturarteWeb/CerrarSesion\"> Cerrar Sesion</a>");
                                out.print("</div>");
                            } else {
                                out.print("<div style=\"margin-top: 13%;\">");
                                out.print("<a style=\"color: white\" href=\"Vistas/iniciarSesion.jsp\"> Iniciar </a>");
                                out.print("<a style=\"color: white\">  |  </a>");
                                out.print("<a style=\"color: white\" href=\"/CulturarteWeb/altaUsuarioServlet\"> Registrarse </a>");
                                out.print("</div>");

                            }
                        %>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li style="margin-top: 1px; color:white "><a href="#">Tengo una propuesta</a></li>
                        <li style="margin-top: 1px; color:white "><a href="#">Quiero ver Propuestas</a></li>
                    </ul>
                    <form action="servletBuscador" method="GET" class="navbar-form navbar-right">
                        <div style="position: relative;margin-right: 26%;">
                            <input name="busqueda" type="text" class="form-control" placeholder="Titulo, descripcion, lugar..." required/>
                            <input style="margin-left: 101%;margin-top: -54px;" class="btn btn-default"  id="btnBuscar" type="submit" value="Buscar"/>
                        </div>
                    </form>

                </div>
            </div>
        </nav>

    </body>
</html>