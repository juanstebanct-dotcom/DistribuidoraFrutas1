<%-- 
    Document   : index
    Created on : 14/01/2026, 7:23:39 p. m.
    Author     : CAICEDO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Distribuidora de Frutas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding-top: 50px;
        }
        .container {
            background: white;
            width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        a {
            display: block;
            margin: 15px 0;
            padding: 10px;
            background-color: #8BC221;
            color: black;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
        }
        a:hover {
            background-color: #6fa61a;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>FRUTIAGRO S.A.S</h1>
    <p>Gestión de usuarios</p>

    <a href="formulario.jsp">Registrar Usuario</a>
    <a href="UsuarioServlet">Listar Usuarios</a>
</div>

</body>
</html>