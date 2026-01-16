<%-- 
    Document   : listar
    Created on : 14/01/2026, 5:58:09?p.?m.
    Author     : CAICEDO
--%>

<%@ page import="java.util.List" %>
<%@ page import="modelo.Usuario" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Usuarios</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            padding: 40px;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: white;
        }
        th {
            background: #8BC221;
            color: black;
            padding: 10px;
        }
        td {
            padding: 8px;
            text-align: center;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
        }
        a {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 4px;
        }
        .editar {
            background: #4CAF50;
            color: white;
        }
        .eliminar {
            background: #f44336;
            color: white;
        }
        a {
    padding: 4px 8px;
    text-decoration: none;
    border-radius: 4px;
    font-size: 13px;
    margin: 0 3px;
    display: inline-block;
}

.editar {
    background: #4CAF50;
    color: white;
}

.eliminar {
    background: #f44336;
    color: white;
}
td a {
    margin-bottom: 4px;
}
.nuevo {
    display: inline-block;
    margin-bottom: 15px;
    padding: 8px 14px;
    background-color: #8BC221;
    color: black;
    font-weight: bold;
    border-radius: 6px;
    text-decoration: none;
}

.nuevo:hover {
    background-color: #6fa61a;
}
    </style>
</head>

<body>
<a href="formulario.jsp" class="nuevo">+ Registrar otro usuario</a>
<h2 style="text-align:center;">Usuarios Registrados</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Correo</th>
        <th>Acciones</th>
    </tr>

<%
    List<Usuario> lista = (List<Usuario>) request.getAttribute("usuarios");
    if (lista != null) {
        for (Usuario u : lista) {
%>
<tr>
    <td><%= u.getId() %></td>
    <td><%= u.getNombre() %></td>
    <td><%= u.getApellido() %></td>
    <td><%= u.getCorreo() %></td>
    <td>
        <a class="editar" href="UsuarioServlet?accion=editar&id=<%= u.getId() %>">Editar</a>
        <a class="eliminar"
           href="UsuarioServlet?accion=eliminar&id=<%= u.getId() %>"
           onclick="return confirm('¿Eliminar usuario?')">Eliminar</a>
    </td>
</tr>
<%
        }
    }
%>
</table>

</body>
</html>
