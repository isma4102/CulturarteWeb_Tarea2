<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crea tu cuenta</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">`
        <script src="script/altaUserJS.js"></script>
        <link  rel="stylesheet" type="text/css" href="css/AltaUsuarioCSS.css">
        <link  rel="stylesheet" type="text/css" href="css/RegistrarColaboracion.css">
        <link type="text/css" href="css/bootstrap.min.css">
        <link id="bootstrap-css" type="text/css" href="/CulturarteWeb/css/bootstrap.css">


    </script>
    <%
        String contraseniasDiferentes = (String) request.getAttribute("malPass");
        if (contraseniasDiferentes != null) {%>
    <script type="text/javascript">
        window.alert("<%=contraseniasDiferentes%>");
    </script>
    <% }%>

    <%
        String mensaje = (String) request.getAttribute("mensaje");
        if (mensaje != null) {%>
    <script type="text/javascript">
        window.alert("<%= mensaje%>");
        location.href = "/CulturarteWeb/ServletInicio";
    </script>
    <%  }
    %>
   

</head>
<body>
    <jsp:include page="/Vistas/Barra_menu.jsp" />
    <br>
    <br>
    <br>
    <br>
    <br>
    <div id="formR" class="formulario">
        <h1>Registrarte</h1>
        <form action="altaUsuarioServlet" method="post" enctype="multipart/form-data">
            <div>
                <label for="name">Nombre de usuario:</label>
                <input name="nick" class="form-control"placeholder="Escribe tu nombre de usuario" type="text" required/>
            </div>
            <br>
            <div>
                <label for="name">Nombre:</label>
                <input name="nombre" class="form-control"placeholder="Escribe tu nombre de usuario" type="text" required/>
            </div>
            <br>
            <div>
                <label for="name">Apellido:</label>
                <input name="apellido" class="form-control"placeholder="Escribe apellido" type="text" required/>
            </div>
            <br>
            <div>
                <label for="mail">E-mail:</label>
                <input name="correo" class="form-control" placeholder="Escribe tu correo electrónico" type="email" required/>
            </div>
            <br>
            <div>
                <label for="contrasenia">Contraseña:</label>
                <input name="pass" class="form-control" placeholder="Escribe una contraseña" type="password" required/>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <label for="contrasenia">Confirmar contraseña:</label>
                <input name="pass2" class="form-control" placeholder="Vuelve a escribir tu contraseña" type="password" required/>
            </div>
            <br>
            <div>
                <label for="fechaN">Fecha de nacimiento</label>
                <input name="fecha" class="form-control" type="date" required>
            </div>
            <br>
            <div>
                <label>Tipo de persona</label><br>
                <input onclick="document.getElementById('otros').style.display = 'none'" name="tipoP"  type="radio"  value="colaborador" checked>Soy un colaborador &nbsp;&nbsp;&nbsp;
                <input onclick="document.getElementById('otros').style.display = 'block'" name="tipoP"  type="radio"  value="proponente">Soy un proponente<br>
            </div>
            <br>
            <div class="btn btn-default image-preview-input">
                <span>Selecciona imagen para tu perfil</span>
                <input type="file" accept="image/png, image/jpeg" id="imagen" name="imagen"/> <!-- rename it -->
            </div>
            <br>
            <div id="otros" style="display: none">
                <div>
                    <label for="direccion">Direccion</label>
                    <input class="form-control" name="direccion" type="text" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <label for="sitio">Sitio web</label>
                    <input class="form-control"  name="sitio" type="text" />
                </div><br>

                <p>Biografia:
                    <textarea class="form-control" name="biografia"></textarea>
                </p>
            </div>
            <div>
                <input class="btn btn-primary btn-block" type="submit" value="Crear cuenta"/>
            </div>
        </form>
    </div>     
</body>
</html>
