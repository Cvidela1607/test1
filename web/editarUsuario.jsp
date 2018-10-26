<%-- 
    Document   : editarUsuario
    Created on : 09-10-2018, 23:08:17
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
    </head>
    <body>
       <%
         Conexion cn= new Conexion();
         ArrayList<Usuarios> user=cn.VerificarUsuariosEmail();
         
        String usuario=request.getParameter("txtUsuario");
        String password=request.getParameter("txtPassword");
        String nombres=request.getParameter("txtNombres");
        String apellidos=request.getParameter("txtApellidos");
        String sexo=request.getParameter("txtSexo");
        String direccion=request.getParameter("txtDireccion");
        String email=request.getParameter("txtEmail");
        String id=request.getParameter("hdnID");
       
        cn.editarUsuario(id,usuario,password,nombres,apellidos,sexo,direccion,email);
        response.sendRedirect("editaDatosCorrecto.jsp");

               
        
        
        
        
        
                
        %>
    </body>
</html>
