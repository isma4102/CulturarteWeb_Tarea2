<%@page import="servicios.DtUsuario"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/Menu_lateral.css" rel="stylesheet">

    </head>
    <body> 
        <div id="wrapper" >
            <div style="margin-top: -42px;" id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <div class="sidenav">
                        <button  class="dropdown-btn"> <img style="margin-right: 4%;" src="Imagenes/Usuarios.png">Usuario
                            <i class="fa fa-caret-down"></i>
                            <img src="Imagenes/desplegar.png">
                        </button>
                        <div style="color: white" class="dropdown-container">
                            <% if ((DtUsuario) request.getSession().getAttribute("usuario_logueado") != null) {
                                    out.print("<a  style = \"color: white\" href = \"/CulturarteWeb/SeguirUsuario\" > Seguir usuario</a >");
                                    out.print("<a style=\"color: white\" href=\"/CulturarteWeb/RankingUsuarios\" >Ranking de Usuarios</a>");
                                } else {
                                    out.print("<a style=\"color: white\" href=\"/CulturarteWeb/altaUsuarioServlet\" >Alta Usuario</a>");
                                    out.print("<a style=\"color: white\" href=\"/CulturarteWeb/RankingUsuarios\" >Ranking de Usuarios</a>");
                                }
                            %>
                            <a style="color: white" href="/CulturarteWeb/ServletConsultarUsuario">Consultar Perfiles</a>
                        </div>

                        <button class="dropdown-btn"> <img style="margin-right: 4%;" src="Imagenes/Propuestas.png">Propuestas
                            <i class="fa fa-caret-down"></i>
                            <img src="Imagenes/desplegar.png">
                        </button>
                        <div class="dropdown-container">
                            <% if ((DtUsuario) request.getSession().getAttribute("usuario_logueado") != null) {
                                    if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).isEsproponente() != false) {
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletAltaPropuesta\" >Alta Propuestas</a>");
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletExtenderFinanciacion\">Extender financiación</a>");
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletCancelarPropuesta\">Cancelar Propuesta</a>");
                                    } else {
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletComentarPropuesta\">Agregar comentario a propuesta</a>");
                                    }
                                    out.print("<a style=\"color: white\" href=\"ServletMarcarFavorita\">Marcar propuestas como favoritas</a>");
                                }%>
                            <a style="color: white" href="/CulturarteWeb/ServletConsultarPropuesta">Consultar propuestas</a>
                            <a style="color: white" href="/CulturarteWeb/ServletPropuestaCategoria">Consultar propuestas por categoria</a>
                        </div>                          
                        <button class="dropdown-btn"><img style="margin-right: 4%;" src="Imagenes/Colaboracion.png">Colaboraciones
                            <i class="fa fa-caret-down"></i>
                            <img style="margin-left: -5%;" src="Imagenes/desplegar.png">
                        </button>
                        <div class="dropdown-container">
                            <% if ((DtUsuario) request.getSession().getAttribute("usuario_logueado") != null) {
                                    if (((DtUsuario) request.getSession().getAttribute("usuario_logueado")).isEsproponente() == false) {
                                        out.print("<a style=\"color: white\" href=\"/CulturarteWeb/ServletRegistroColaboracion\">Registrar Colaboración a propuesta</a>");
                                    }
                                }
                            %>
                        </div>
                    </div>
                </ul>
            </div>


        </div>
         <li class="nav-item">
                      <a style="z-index: 1;position: relative" href="#menu-toggle" id="menu-toggle" class="nav-link"><img src="Imagenes/menu-icono.png" alt="" class="menu-bar"></a>
                    </li>
                        
        <a style="z-index: 1;margin-right: 22%;" href="/CulturarteWeb/ServletInicio">
            <img src="Imagenes/logo.png">
        </a>
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


    </body>
</html>
