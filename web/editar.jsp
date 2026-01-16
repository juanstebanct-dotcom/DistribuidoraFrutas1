<%-- 
    Document   : editar
    Created on : 15/01/2026, 6:21:59?p.?m.
    Author     : CAICEDO
--%>

<%@ page import="modelo.Usuario" %>
<%
    Usuario u = (Usuario) request.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuario</title>
    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            padding-top: 40px;
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
            margin-bottom: 12px;
        }
        button {
            width: 100%;
            background: #8BC221;
            border: none;
            padding: 10px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="form-container">
    <h2>Editar Usuario</h2>

    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="id" value="<%= u.getId() %>">

        <input type="text" name="nombre" value="<%= u.getNombre() %>" required>
        <input type="text" name="apellido" value="<%= u.getApellido() %>" required>
        <input type="email" name="correo" value="<%= u.getCorreo() %>" required>
        <input type="text" name="telefono" value="<%= u.getTelefono() %>" required>

        <button type="submit">Actualizar</button>
    </form>
</div>

</body>
</html>
