<%@page import="java.util.Iterator"%>
<%@page import="servicios.DtUsuario"%>
<%@page import="java.util.List"%>



<!DOCTYPE html>
<html>
    <head> 
        <%
            String solicitudseguir = (String) request.getAttribute("solicitudseguir");
            if (solicitudseguir != null) {%>
        <script type="text/javascript">

            window.onload = function () {
                alert("<%= solicitudseguir%>");
            }

        </script>
        <%
            }
        %>
        <script type="text/javascript" src="script/FiltrarTabla.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Culturarte</title>

    </head>
    <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <div class="page-header header-filter" data-parallax="true" style="background-color: #337ab7;margin-top: -20px;"></div>
        <div style="margin-left: 2%;" class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto" >
                            <div class="profile" >
                                <h2 align="center" >Seguir usuario</h2>

                                <input id="buscar" style=" display: block;margin-right: auto;margin-left: auto;width: 216px" type="text" name="Buscar" class="form-control" placeholder="Buscar" onkeyup="FiltrarTabla()" />


                                <table style="font-size: 69%;" id="tabla" class="table table-bordered table-hover  formulario">

                                    <thead>

                                    <th bgcolor="white"> Nick del Usuario</th>
                                    <th bgcolor="white"> Nombre del Usuario</th>
                                    <th bgcolor="white"> Apellido del Usuario</th>
                                    <th bgcolor="white" style="text-align:center"> Seguir</th>
                                    <th bgcolor="white" style="text-align:center"> Dejar de Seguir</th>

                                    </thead>


                                    <tbody>
                                        <%
                                            List<DtUsuario> lista = (List<DtUsuario>) request.getAttribute("usuarios");
                                            for (int i = 0; i < lista.size(); i++) {
                                                out.print("<tr>");
                                                out.print("<label for=\"" + i + "\"></label></td>");
                                                out.print("<td>" + lista.get(i).getNickname() + "</td>");
                                                out.print("<td>" + lista.get(i).getNombre() + "</td>");
                                                out.print("<td>" + lista.get(i).getApellido() + "</td>");

                                        %>  
                                    <td align="center">   
                                        <form action="SeguirUsuario" method="post">
                                            <input type="hidden" name="seguido" value="<%= lista.get(i).getNickname()%>" />
                                            <input type="hidden" name="accion" value="seguir" />
                                            <input type="button" class="btn btn-primary" value="Seguir" onclick="submit()"/>
                                        </form>
                                    </td>
                                    <td align="center"> 
                                        <form action="SeguirUsuario" method="post">
                                            <input type="hidden" name="seguido" value="<%= lista.get(i).getNickname()%>" />
                                            <input type="hidden" name="accion" value="dejarseguir" />
                                            <input type="button" class="btn btn-primary" value="Dejar de Seguir" onclick="submit()"/>
                                        </form>   
                                    </td>       
                                    <%

                                            out.print("</tr>");

                                        }
                                    %>
                                    </tbody> 
                                </table>

                                <div style=" text-align: center;">
                                    <a href="javascript:window.history.back();" class="btn btn-primary" > &laquo; Volver</a>
                                    <a href="ServletInicio" class="btn btn-primary" > &laquo; Volver a inicio</a>
                                </div>
                                    <br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <jsp:include page="/Vistas/footer.jsp" />

    </body>

</html>

