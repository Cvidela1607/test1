<%-- 
    Document   : cerrar
    Created on : 08-10-2018, 16:36:05
    Author     : Claudio-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/estilo2.css">
    </head>
    <body>
        <%
            HttpSession misesion=request.getSession(true); //crea una sesion
                       
            String usuarioSesion=(String)misesion.getAttribute("username"); //trae la variable de sesion
            
            if(misesion!=null){
                misesion.invalidate();
                out.print ("<div class=\"encabezado\">");   
                    out.print("<h2>Sesión cerrada para: "+ usuarioSesion+"</h2>");
                    out.print("<br/>");
                    out.print(" <a style=\"color:white\" href=\".\\index.jsp\">Volver a Inicio</a>");
                out.print("</div>");    
                usuarioSesion=null;
            }else{
                out.print("Sesión cerrada");
            }
         %>
    </body>
</html>
