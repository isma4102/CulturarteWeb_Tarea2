<%@page import="servicios.DtUsuario"%>
<!DOCTYPE html>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/material-kit.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse navbar-expand-lg bg-dark" role="navigation-demo">
    <jsp:include page="/Vistas/Menu_lateral.jsp" />
    <div class="container">
       
        <div class="collapse navbar-collapse">
            <ul style="float: right;float: left" class="navbar-nav ml-auto">
                <li class="nav-item" style="margin-left: -8%;">
                <form style="margin-top: 16px;" action="servletBuscador" method="GET" class="navbar-form navbar-right">
                    <input name="busqueda" type="text" class="form-control" placeholder="Titulo, descripcion, lugar..." required/>
                    <input style="margin-left: 59%;margin-top: -56px;" class="btn btn-default" id="btnBuscar" type="submit" value="Buscar"/>
                </form>
                </li>
                <li class="nav-item">
                    <a href="/CulturarteWeb/ServletAltaPropuesta" class="nav-link">
                        Tengo una propuesta
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/CulturarteWeb/ServletConsultarPropuesta" class="nav-link">
                        Quiero ver Propuestas
                    </a>
                </li>
                <% if ((DtUsuario) request.getSession().getAttribute("usuario_logueado") != null) {%>
                <li class="nav-item">
                    <a class="nav-link">
                        <%=((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickname()%>
                    </a>
                </li>
                <li class="dropdown nav-item">
                    <a href="#" class="profile-photo dropdown-toggle nav-link" data-toggle="dropdown">
                        <div class="profile-photo-small">
                            <img style="width: 100%;" src="/CulturarteWeb/ServletImagenes?nickname=<%= ((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickname() %>" class="img-circle">
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <form  action="${pageContext.request.contextPath}/ServletConsultarUsuario" method="POST">
                            <input style="border:none;background-color:#222222;color:white" class="form-control-plaintext" readonly name="nick" type="hidden" value="<%= ((DtUsuario) request.getSession().getAttribute("usuario_logueado")).getNickname()%>"/>
                            <button style="width: 96%;font-size: 100%;" type="submit"  class="dropdown-item">Perfil</button>
                        </form>
                        <a style="font-size: 100%;" type="button" href="/CulturarteWeb/CerrarSesion" class="dropdown-item">Cerrar Sesión</a>
                    </div>
                </li>
                <% } else {%>
                <li class="nav-item">
                    <a  href="/CulturarteWeb/iniciar-sesion" class="nav-link">
                        Iniciar sesión
                    </a>
                </li>
                <li class="nav-item">
                    <a  href="/CulturarteWeb/altaUsuarioServlet" class="nav-link">
                        Registrarse
                    </a>
                </li>
                <% }%>
            </ul>
        </div>
    </div>
</nav>
