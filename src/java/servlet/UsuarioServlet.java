/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import modelo.Usuario;
import dao.UsuarioDAO;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            listar(request, response);
        } else {
            switch (accion) {
                case "editar":
                    editar(request, response);
                    break;
                case "eliminar":
                    eliminar(request, response);
                    break;
            }
        }
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    try {
        Usuario u = new Usuario();
        u.setNombre(request.getParameter("nombre"));
        u.setApellido(request.getParameter("apellido"));
        u.setCorreo(request.getParameter("correo"));
        u.setPassword(request.getParameter("password"));
        u.setTelefono(request.getParameter("telefono"));

        dao.insertar(u);

        // Mensaje de éxito
        response.sendRedirect("formulario.jsp?ok=1");

    } catch (Exception e) {
        // Mensaje de error
        response.sendRedirect("formulario.jsp?error=1");
    }
}

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("usuarios", dao.listar());
        request.getRequestDispatcher("listar.jsp").forward(request, response);
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Usuario u = new Usuario();
        u.setNombre(request.getParameter("nombre"));
        u.setApellido(request.getParameter("apellido"));
        u.setCorreo(request.getParameter("correo"));
        u.setPassword(request.getParameter("password"));
        u.setTelefono(request.getParameter("telefono"));

        dao.insertar(u);
        response.sendRedirect("UsuarioServlet");
    }

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("usuario", dao.buscarPorId(id));
        request.getRequestDispatcher("editar.jsp").forward(request, response);
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Usuario u = new Usuario();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setNombre(request.getParameter("nombre"));
        u.setApellido(request.getParameter("apellido"));
        u.setCorreo(request.getParameter("correo"));
        u.setPassword(request.getParameter("password"));
        u.setTelefono(request.getParameter("telefono"));

        dao.actualizar(u);
        response.sendRedirect("UsuarioServlet");
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        dao.eliminar(id);
        response.sendRedirect("UsuarioServlet");
    }
}
