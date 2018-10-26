<%-- 
    Document   : guardarUsuario
    Created on : 08-10-2018, 15:41:47
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/estilo2.css"/>
    </head>
    <body>
        <%
        Conexion cn= new Conexion();
        ArrayList<Usuarios> user=cn.VerificarUsuariosEmail();
        
        
        String usuario=request.getParameter("txtUsuario");
        String password=request.getParameter("txtPassword");
        String password2=request.getParameter("txtPasswordRepetida");
        String nombres=request.getParameter("txtNombres");
        String apellidos=request.getParameter("txtApellidos");
        String sexo=request.getParameter("txtSexo");
        String direccion=request.getParameter("txtDireccion");
        String email=request.getParameter("txtEmail");
        
        boolean estado = false; // para ver si esta repetido el usuario o email
            if (password.equals(password2)) {

                for (int i = 0; i < user.size(); i++) {//comprobar si en la BD estan los datos
                    if (usuario.equals(user.get(i).getUsuario()) || email.equals(user.get(i).getEmail())) {
                        estado = true;
                    }
                }

                if (estado == true) {
                    out.print ("<div class=\"encabezado\">");   
                        out.print("<h2>Usuario o Email ya existen</h2>");
                        out.print("<br/>");
                        out.print("<a style=\"color:white\" href=\".\\registro.jsp\">Volver</a>");
                    out.print("</div>");
                    
                } else {

                    cn.nuevoUsuario(usuario, password, nombres, apellidos, sexo, direccion, email);
                    response.sendRedirect("registroOK.jsp");

                }
            } else {
                out.print ("<div class=\"encabezado\">"); 
                    out.print("<h2>Las contraseñas no coinciden</h2>");
                    out.print("<br/>");
                    out.print("<a style=\"color:white\" href=\".\\registro.jsp\">Volver</a>");
                out.print("</div>"); 
            }   
           
            
        
        
        
        
        
        %>
    </body>
</html>
