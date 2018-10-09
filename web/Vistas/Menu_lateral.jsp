<%@page import="logica.Clases.DtUsuario"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/Menu_lateral.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript">
            function getConfirmation() {
            <% if (request.getSession().getAttribute("usuario_logueado") != null) { %>
                alert("Cierre sesion antes de Cargar los datos de prueba");
            <% } else {%>
                var retVal = confirm("¿Desea continuar? todos los datos se perderan");
                if (retVal == true) {
                    var var2 = document.getElementById('contenedor_carga');
                    var2.style.display = "block";
                        location.href = "/CulturarteWeb/ServletDatosdePrueba";
                } else {
                    alert("Operación Cancelada");
                }
            <% } %>
            }

        </script>
    </head>
    <body> 
        <div id="wrapper" >

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                    </li>
                    <div class="sidenav">
                        <button class="dropdown-btn">Usuario
                            <i class="fa fa-caret-down"></i>
                            <img src="Imagenes/desplegar.png">
                        </button>
                        <div style="color: white" class="dropdown-container">
                            <% if ((DtUsuario) request.getSession().getAttribute("usuario_logueado") != null) {
                                    out.print("<a  style = \"color: white\" href = \"/CulturarteWeb/SeguirUsuario\" > Seguir usuario</a >");
                                } else {
                                    out.print("<a style=\"color: white\" href=\"/CulturarteWeb/altaUsuarioServlet\" >Alta Usuario</a>");
                                }
                            %>
                            <a style="color: white" href="/CulturarteWeb/ServletConsultarUsuario">Consultar Perfiles</a>
                        </div>

                        <button class="dropdown-btn">Propuestas
                            <i class="fa fa-caret-down"></i>
                            <img src="Imagenes/desplegar.png">
                        </button>
                        <div class="dropdown-container">
                            <% if ((DtUsuario) request.getSession().getAttribute("usuario_logueado") != null) {
                                    if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).Esproponente() != false) {
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletAltaPropuesta\" >Alta Propuestas</a>");
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletExtenderFinanciacion\">Extender financiación</a>");
                                        out.print("<a style=\"color: white\" href=\"#\">Cancelar Propuesta</a>");
                                    } else {
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletComentarPropuesta\">Agregar comentario a propuesta</a>");
                                    }
                                    out.print("<a style=\"color: white\" href=\"ServletMarcarFavorita\">Marcar propuestas como favoritas</a>");
                                }%>
                            <a style="color: white" href="/CulturarteWeb/ServletConsultarPropuesta">Consultar propuestas</a>
                            <a style="color: white" href="/CulturarteWeb/ServletPropuestaCategoria">Consultar propuestas por categoria</a>


                        </div>                          
                        <button class="dropdown-btn">Colaboraciones
                            <i class="fa fa-caret-down"></i>
                            <img src="Imagenes/desplegar.png">
                        </button>
                        <div class="dropdown-container">
                            <% if ((DtUsuario) request.getSession().getAttribute("usuario_logueado") != null) {
                                    if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).Esproponente() == false) {
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletRegistroColaboracion\">Registrar Colaboración a propuesta</a>");
                                    }
                                }
                            %>
                        </div>
                        <button class="dropdown-btn">Otros
                            <i class="fa fa-caret-down"></i>
                            <img src="Imagenes/desplegar.png">
                        </button>
                        <div class="dropdown-container">
                            <a style="color: white;"  onclick="getConfirmation('/CulturarteWeb/SeguirUsuario');" >Cargar datos de prueba</a>
                        </div>
                    </div>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">  <img src="Imagenes/menu-icono.png" alt="" class="menu-bar"></a>
            <a href="/CulturarteWeb/ServletInicio">
                <img src="Imagenes/logo.png" style="width: 38%">
            </a>
        </div>
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });

            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;

            for (i = 0; i < dropdown.length; i++) {
                dropdown[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var dropdownContent = this.nextElementSibling;
                    if (dropdownContent.style.display === "block") {
                        dropdownContent.style.display = "none";
                    } else {
                        dropdownContent.style.display = "block";
                    }
                });
            }
        </script>
        <div id="contenedor_carga" style="position: relative; display: none;">
            <div style="position: absolute;bottom: -704px;right: -742px;">
                <div class="alert alert-warning"><strong>¡Por Favor!</strong> Espere un momento...                 </div> 
            </div>
        </div>

    </body>
</html>
