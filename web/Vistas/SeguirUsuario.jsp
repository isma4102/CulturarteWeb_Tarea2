<%@page import="java.util.Iterator"%>
<%@page import="logica.Clases.DtUsuario"%>
<%@page import="java.util.List"%>



<!DOCTYPE html>
<html>
    <head> 
            <%
            String solicitudseguir = (String) request.getAttribute("solicitudseguir");
            if (solicitudseguir != null) 
    {%>
        <script type="text/javascript">
            
    window.onload = function(){
      alert("<%= solicitudseguir%>");
    }
          
        </script>
        <%
            }
        %>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Culturarte:: Seguir Usuario</title>
   
    </head>
        <body>
        <jsp:include page="/Vistas/Barra_menu.jsp" />
        <br>
        <br>
        <br>
        <br> 
        <h3 align="center" >Usuarios de Culturarte</h3>
        <form class="navbar-form navbar-right" action="SeguirUsuario" method="POST">
                Nickname: <input style="margin-right: 600px;" type="text" name="BuscarUsu" class="form-control" placeholder="Buscar..." />
        </form>
        
        <table class="table table-bordered table-hover  formulario" style="margin-left: 192px; width: 88%;">
           
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
                    out.print("<td>" + lista.get(i).getNickName() + "</td>");  
                    out.print("<td>" + lista.get(i).getNombre() + "</td>");
                    out.print("<td>" + lista.get(i).getApellido() + "</td>");
                                        
                    %>  
                    <td align="center">   
                        <form action="SeguirUsuario" method="post">
                            <input type="hidden" name="seguido" value="<%= lista.get(i).getNickName() %>" />
                            <input type="hidden" name="accion" value="seguir" />
                            <input type="button" class="btn btn-primary" value="Seguir" onclick="submit()"/>
                        </form>
                   </td>
                   <td align="center"> 
                        <form action="SeguirUsuario" method="post">
                            <input type="hidden" name="seguido" value="<%= lista.get(i).getNickName() %>" />
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
    </form>
  
    </body>
     
</html>

