<%-- 
    Document   : registro
    Created on : 08-10-2018, 13:07:49
    Author     : Claudio-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="css/estilo2.css"/>
    </head>
    <body>
    
        <div class="contenedor">
            <div class="encabezado">
                <h1>Registro</h1>
            </div>

            <div class="formulario">
                <form method="POST" action="guardarUsuario.jsp">
                    <div class="campo"> 
                        <label for="usuario">Nombre Usuario</label>
                        <input <input type="text" name="txtUsuario" placeholder="usuario" required>
                    </div>

                    <div class="campo">
                        <div class="en-linea izquierdo">
                            <label for="contrasena1">Contraseña:</label>
                            <input type="password" name="txtPassword" placeholder="contraseña" required>
                        </div>
                        <div class="en-linea">
                            <label for="contrasena2">Repetir contraseña:</label>
                            <input type="password" name="txtPasswordRepetida" placeholder="repita contraseña" required>
                        </div>
                    </div>

                    <div class="campo">
                        <div class="en-linea izquierdo">
                            <label for="nombres">Nombres</label>
                            <input type="text" name="txtNombres" placeholder="nombres" required>
                        </div>
                        <div class="en-linea">
                            <label for="apellidos">Apellidos</label>
                            <input type="text" name="txtApellidos" placeholder="apellidos" required>
                        </div>
                    </div>

                    <div class="campo"> 
                        <label for="sexo">Sexo</label>
                        <input type="radio" name="txtSexo" value="Masculino" required>Masculino
                        <input type="radio" name="txtSexo" value="Femenino" required>Femenino
                        <input type="radio" name="txtSexo" value="Otro" required>Otro
                    </div>

                    <div class="campo">
                        <div class="en-linea izquierdo">
                            <label for="direccion">Dirección</label>
                            <input type="text" name="txtDireccion" placeholder="dirección">
                        </div>

                        <div class="en-linea">
                            <label for="email">Email</label>
                            <input type="email" name="txtEmail" placeholder="ejemplo@dominio.com" required>
                        </div>
                    </div>

                    <div class="botones">
                        <input type="submit" name="submit" value="Guardar">
                    </div>
                    <br/>
                    <center>
                        <a href=".\\index.jsp">Volver</a>
                    </center> 
                    <br/>
                </form>
            </div>
        
                
        
    </div>    
    
    </body>
</html>
