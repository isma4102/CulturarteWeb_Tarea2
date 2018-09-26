<!DOCTYPE html>
<html>
    <head>
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/Menu_lateral.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.js"></script>
    </head>
    <body> 
        <div id="wrapper" >

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="/CulturarteWeb/ServletInicio">
                            Culturarte
                        </a>
                    </li>
                    <div class="sidenav">
                        <button class="dropdown-btn">Alta Usuario
                            <i class="fa fa-caret-down"></i>
                              <img src="Imagenes/desplegar.png">
                        </button>
                        <div style="color: white" class="dropdown-container">
                            <a style="color: white" href="/CulturarteWeb/altaUsuarioServlet" >Alta Usuario</a>
                            <a style="color: white" href="/CulturarteWeb/SeguirUsuario" >Seguir usuario</a>
                            <a style="color: white" href="/CulturarteWeb/ServletConsultarUsuario">Ver usuarios</a>
                            <a style="color: white" href="#">Ver seguidores</a>
                        </div>

                        <button class="dropdown-btn">Propuestas
                            <i class="fa fa-caret-down"></i>
                            <img src="Imagenes/desplegar.png">
                        </button>
                        <div class="dropdown-container">
                            <a style="color: white" href="/CulturarteWeb/ServletAltaPropuesta" >Alta Propuestas</a>
                            <a style="color: white" href="#">Consultar propuestas</a>
                            <a style="color: white" href="#">Modificar propuestas</a>
                        </div>
                        <button class="dropdown-btn">Colaboraciones
                            <i class="fa fa-caret-down"></i>
                              <img src="Imagenes/desplegar.png">
                        </button>
                        <div class="dropdown-container">
                            <a style="color: white" href="ServletRegistroColaboracion">Registrar Colaboración</a>
                            <a style="color: white" href="/CulturarteWeb/ServletConsultarPropuesta">Consultar colaboracion</a>
                            <a style="color: white" href="#">Cancelar colaboración</a>
                        </div>
                        <button class="dropdown-btn">Otros
                            <i class="fa fa-caret-down"></i>
                              <img src="Imagenes/desplegar.png">
                        </button>
                        <div class="dropdown-container">
                            <a style="color: white;" href="#">Cargar datos de prueba</a>
                            <a style="color: white" href="#">Opciones del administrador</a>
                        </div>
                    </div>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">  <img src="Imagenes/menu-icono.png" alt="" class="menu-bar"></a>

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

    </body>
</html>