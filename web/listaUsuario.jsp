<%-- 
    Document   : listaUsuario
    Created on : 08-10-2018, 16:45:38
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
        <title>Lista de usuarios</title>
        <link rel="stylesheet" href="css/estilo2.css"/>
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
            out.print("<h2>Lista de usuarios</h2>");
            out.print("</center>");
        out.print("</div>"); 
        
        Conexion cn = new Conexion(); 
        ArrayList<Usuarios> user=cn.verUsuarios();
        out.print("<div class=\"division-tabla\">"); 
        out.print("<center>");
        out.print("<table border=1>");
            out.print("<tr>");
                out.print("<th>");
                    out.print("Nombre Usuario");
                out.print("</th>");
                out.print("<th>");
                    out.print("Nombres");
                out.print("</th>");
                out.print("<th>");
                    out.print("Apellidos");
                out.print("</th>");
                out.print("<th>");
                    out.print("Sexo");
                out.print("</th>");
                out.print("<th>");
                    out.print("Acciones");
                out.print("</th>");
            out.print("</tr>");
             for (int i = 0; i < user.size(); i++) {
                 out.print("<tr>");
                    out.print("<td>");
                        out.print(user.get(i).getUsuario());
                    out.print("</td>");
                    out.print("<td>");
                        out.print(user.get(i).getNombres());
                    out.print("</td>");
                    out.print("<td>");
                        out.print(user.get(i).getApellidos());
                    out.print("</td>");
                    out.print("<td>");
                        out.print(user.get(i).getSexo());
                    out.print("</td>");
                    out.print("<td>");
                        out.print("<a href=\"ver.jsp?id="+user.get(i).getId()+"\">Ver</a>");  //arreglar
                    out.print("</td>");
                 out.print("</tr>");
            }
             
         out.print("</table>");
         out.print("</center>");
         out.print("</div>");
        
        //Para traer la id del usuario logeado
        int id=0;
        for (int i = 0; i < user.size(); i++) {
            if(user.get(i).getUsuario().equals(usuarioSesion)){
                id=user.get(i).getId();
            }
            
                
            }
         
        out.print("<br/><br/>");
        out.print("<center>");
        out.print("<a style=\"color:blue\" href=\"editar.jsp?id="+id+"\">Ver detalles de tus datos y Editar</a>");
        out.print("</center>");
        //out.print("<a href=\".\\editar.jsp\">Ver detalles de tus datos y Editar</a>");
        
        }
        
        %>
        
    </body>
</html>
