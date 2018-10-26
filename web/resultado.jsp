<%-- 
    Document   : resultado
    Created on : 08-10-2018, 13:28:17
    Author     : Claudio-PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clases.Usuarios"%>
<%@page import="clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/estilo2.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Conexion cn = new Conexion(); 
          String usuario=request.getParameter("txtUsuario"); 
          String password=request.getParameter("txtPassword");
          
          ArrayList<Usuarios> user=cn.VerificarUsuarioPassword();
         
          
          String u="u";
          String p="p";
          
          if(user==null || user.isEmpty() ){
              out.print ("<div class=\"encabezado\">");   
                    out.print("<h2>No existen usuarios, debe registrarse </h2>");
                    out.print("<br/>");
                   out.print("<a style=\"color:white\" href=\".\\index.jsp\">Volver</a>");
                out.print("</div>"); 
              
              
          }else{
              for (int i = 0; i < user.size(); i++) {//comprobar si en la BD estan los datos
                     if(usuario.equals(user.get(i).getUsuario()) && password.equals(user.get(i).getPassword())){
                         u=user.get(i).getUsuario();
                         p=user.get(i).getPassword();
                     } 
                  }  
              
              if(usuario.equals(u) && password.equals(p)){    
                HttpSession misesion=request.getSession(true); //crea una sesion
                misesion.setAttribute("username", usuario); //crea una variable de sesion (atributo y valor) usuario
                misesion.setAttribute("password", password); //password de la variable de sesion
                
                String usuarioSesion=(String)misesion.getAttribute("username");  //(parseo a string)
                out.print(usuarioSesion);
                out.print("<br>");
                response.sendRedirect("listaUsuario.jsp");
                }else{
                  //si no encuentra password o usuario 
                      out.print ("<div class=\"encabezado\">"); 
                            out.print("<h2>Usuario o Password incorrecto</h2>");
                            out.print("<br>");
                            out.print("<a style=\"color:white\" href=\".\\index.jsp\">Volver</a>"); 
                        out.print("</div>");   
                  
                        
                 /* if(usuario.equals(u) && !password.equals(p)){ //Revisar para ver si solo es diferente la contraseña 
                        out.print ("<div class=\"encabezado\">"); 
                            out.print("<h2>Contraseña incorrecta</h2>");
                            out.print("<br>");
                            out.print("<a style=\"color:white\" href=\".\\index.jsp\">Volver</a>"); 
                        out.print("</div>");    
                    }else{
                       out.print ("<div class=\"encabezado\">");  
                            out.print("<h2>Usuario no existe, debe registrarse</h2>");
                            out.print("<br>");
                            out.print("<a style=\"color:white\" href=\".\\index.jsp\">Volver</a>");
                         out.print("</div>");
                        
                    }*/
                    
                }   
          }
      // || (usuario.equals(p) && !password.equals(p))
        %>
    </body>
</html>
