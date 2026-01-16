<%-- 
    Document   : formulario
    Created on : 14/01/2026, 5:53:32 p. m.
    Author     : CAICEDO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro de Usuario</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
        }
        .form-container {
            width: 400px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }
        input:invalid {
            border: 2px solid red;
        }
        input:valid {
            border: 2px solid green;
        }
        button {
            background-color: #8BC221;
            border: none;
            padding: 10px;
            width: 100%;
            font-weight: bold;
            cursor: pointer;
        }
        .mensaje {
            color: green;
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .error {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<div class="form-container">

<%-- MENSAJE DE ÉXITO --%>
<% if (request.getParameter("ok") != null) { %>
    <div class="mensaje">✔ Usuario registrado correctamente</div>
<% } %>

<%-- MENSAJE DE ERROR --%>
<% if (request.getParameter("error") != null) { %>
    <div class="error">❌ Error al registrar usuario</div>
<% } %>

<h2>Registro de Usuario</h2>

<form action="UsuarioServlet" method="post">

    <input type="text" name="nombre" placeholder="Nombre"
           required minlength="3">

    <input type="text" name="apellido" placeholder="Apellido"
           required minlength="3">

    <input type="email" name="correo" placeholder="Correo"
           required>

    <input type="password" name="password" placeholder="Contraseña"
           required minlength="6">

    <input type="text" name="telefono" placeholder="Teléfono"
           required pattern="[0-9]{7,10}"
           title="Solo números (7 a 10 dígitos)">

    <button type="submit">Guardar Usuario</button>
</form>

<br>
<a href="UsuarioServlet">Ver usuarios registrados</a>

</div>

</body>
</html>