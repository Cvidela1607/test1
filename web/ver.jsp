<%-- 
    Document   : ver
    Created on : 09-10-2018, 4:27:28
    Author     : Claudio-PC
--%>

<%@page import="clases.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/estilo2.css"
    </head>
    <body>
        <%
        HttpSession misesion=request.getSession(true); //crea una sesion
        String usuarioSesion=(String)misesion.getAttribute("username"); //trae la variable de sesion
        
        if(usuarioSesion==null){
            out.print ("<div class=\"encabezado\">"); 
                out.print("<h2>Error, acceso denegado</h2>");
                out.print(" <a style=\"color:white\" href=\"index.jsp\">Inicio</a>");
            out.print("</div>"); 
        }else{
         out.print ("<div class=\"encabezado\">");   
            out.print("<h2>Usuario: "+usuarioSesion+"</h2>");
            out.print(" <a style=\"color:white\" href=\".\\cerrar.jsp\">Cerrar sesión</a>");
        out.print("</div>");
        
        out.print("<div class=\"contenedor\">"); 
            out.print("<center>");
                out.print("<h2>Datos del Usuario</h2>");
            out.print("</center>");
       
            
            
       String id=request.getParameter("id");
       
       Conexion cn = new Conexion();    
       ArrayList<Usuarios> user=cn.verUsuarioById(id);
        out.print ("<div class=\"formulario\">");
            out.print("<form method='POST' action='listaUsuario.jsp'>");
                out.print("<div class=\"campo\">");
                    out.print("<div class=\"en-linea izquierdo\">");
                        out.print("<label>Nombre Usuario</label>");
                        out.print("<input type=\"text\" name=\"txtUsuario\" value='"+user.get(0).getUsuario()+"' readonly> <br/>");
                    out.print("</div>");
                    out.print("<div class=\"en-linea\">");
                        out.print("<label>Email</label>");
                        out.print("<input type=\"text\" name=\"txtEmail\" value='"+user.get(0).getEmail()+"' readonly><br/>");
                    out.print("</div>");
                out.print("</div>");
                
                out.print("<div class=\"campo\">");
                    out.print("<div class=\"en-linea izquierdo\">");
                        out.print("<label>Nombres</label>");
                        out.print("<input type=\"text\" name=\"txtNombres\" value='"+user.get(0).getNombres()+"' readonly><br/>");
                    out.print("</div>");
                    out.print("<div class=\"en-linea\">");
                        out.print("<label>Apellidos</label>");
                        out.print("<input type=\"text\" name=\"txtApellidos\" value='"+user.get(0).getApellidos()+"' readonly><br/>");
                    out.print("</div>");
                 out.print("</div>"); 
                 
                  out.print("<div class=\"campo\">");
                    out.print("<div class=\"en-linea izquierdo\">");
                        out.print("<label>Sexo</label>");
                        out.print("<input type=\"text\" name=\"txtSexo\" value='"+user.get(0).getSexo()+"' readonly><br/>");
                    out.print("</div>");
                    out.print("<div class=\"en-linea\">");
                        out.print("<label>Dirección</label>");
                        out.print("<input type=\"text\" name=\"txtDireccion\" value='"+user.get(0).getDireccion()+"' readonly><br/>");
                    out.print("</div>");
                 out.print("</div>"); 
                 
                 out.print("<div class=\"botones\">");
                    out.print("<input type=\"submit\" name=\"btnVolver\" value=\"Volver atrás\">");
                 out.print("</div>"); 
                 
                out.print("</div>");
           out.print("</form>"); 
       out.print("</div>"); 
                
                
            
            
            /*out.print("Usuario:<input type=\"text\" name=\"txtUsuario\" value='"+user.get(0).getUsuario()+"' readonly> <br/>");
            out.print("Nombres:<input type=\"text\" name=\"txtNombres\" value='"+user.get(0).getNombres()+"' readonly><br/>");
            out.print("Apellidos:<input type=\"text\" name=\"txtApellidos\" value='"+user.get(0).getApellidos()+"' readonly><br/>");
            out.print("Sexo:<input type=\"text\" name=\"txtSexo\" value='"+user.get(0).getSexo()+"' readonly><br/>");
            out.print("Direccion:<input type=\"text\" name=\"txtDireccion\" value='"+user.get(0).getDireccion()+"' readonly><br/>");
            out.print("Email:<input type=\"text\" name=\"txtEmail\" value='"+user.get(0).getEmail()+"' readonly><br/>");
            out.print("<input type=\"hidden\" name=\"hdnID\" value='"+user.get(0).getId()+"' readonly> <br/>"); //trae la id
            out.print("<input type=\"submit\" name=\"btnVolver\" value=\"Volver atrás\">");
            out.print("</form>"); 
            */
              
        }
        
          
      %> 
        
        
       
    </body>
</html>
