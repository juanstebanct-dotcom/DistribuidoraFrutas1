<%-- 
    Document   : formulario
    Created on : 14/01/2026, 5:53:32 p. m.
    Author     : CAICEDO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario Usuario</title>
</head>
<body>

<h2>Registro de Usuario</h2>

<form action="UsuarioServlet" method="post">
    <label>Nombre:</label><br>
    <input type="text" name="nombre"><br><br>

    <label>Apellido:</label><br>
    <input type="text" name="apellido"><br><br>

    <label>Correo:</label><br>
    <input type="email" name="correo"><br><br>

    <label>Contraseña:</label><br>
    <input type="password" name="contraseña"><br><br>

    <label>Teléfono:</label><br>
    <input type="text" name="telefono"><br><br>

    <input type="submit" value="Guardar Usuario">
</form>

</body>
</html>
