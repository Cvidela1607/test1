<%-- 
    Document   : index
    Created on : 08-10-2018, 13:05:02
    Author     : Claudio-PC

            Usuario: <input type="text" name="txtUsuario" required><br/> <br/> 
            Password: <input type="password" name="txtPassword" required><br/><br/>
            <input type="submit" name="submit" value="Enviar"><br/><br/>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="css/estilo2.css"/>
    </head>
    <body>
        <div class="contenedor">
            <div class="encabezado">
                <h1>Inicio sesión</h1>
            </div>
            
            <div class="formulario">
                <center>
                    <form method="POST" action="resultado.jsp" id="formulario">
                        <div class="campo"> 
                            <label for="usuario">Usuario</label>
                            <input type="text" name="txtUsuario" placeholder="usuario" required>
                        </div>
                        <div class="campo"> 
                            <label for="password">Password</label>
                            <input type="password" name="txtPassword" placeholder="contraseña" required>
                        </div>
                </center>
                
                <div class="botones">
                    <input type="submit" name="submit" value="Entrar">
                </div>  
                <br/>
                <center>
                    <a href=".\\registro.jsp">Registrarse</a>
                </center> 
                <br/>
                </form>
            </div> 
        </div>   
    </body>
</html>
