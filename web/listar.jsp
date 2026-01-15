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
</head>
<body>

<h2>Usuarios Registrados</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Correo</th>
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
    </tr>
<%
        }
    }
%>
</table>

</body>
</html>
