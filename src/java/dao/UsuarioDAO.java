/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import config.Conexion;
import modelo.Usuario;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    // INSERTAR
    public void insertar(Usuario u) {
        String sql = "INSERT INTO usuario(nombre, apellido, correo, password, telefono) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = new Conexion().conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getCorreo());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getTelefono());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error insertar: " + e.getMessage());
        }
    }

    // LISTAR
    public List<Usuario> listar() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuario";

        try (Connection con = new Conexion().conectar();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setCorreo(rs.getString("correo"));
                u.setPassword(rs.getString("password"));
                u.setTelefono(rs.getString("telefono"));
                lista.add(u);
            }

        } catch (Exception e) {
            System.out.println("Error listar: " + e.getMessage());
        }
        return lista;
    }

    // BUSCAR POR ID (EDITAR)
    public Usuario buscarPorId(int id) {
        Usuario u = null;
        String sql = "SELECT * FROM usuario WHERE id_usuario=?";

        try (Connection con = new Conexion().conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setCorreo(rs.getString("correo"));
                u.setPassword(rs.getString("password"));
                u.setTelefono(rs.getString("telefono"));
            }

        } catch (Exception e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return u;
    }

    // ACTUALIZAR
    public void actualizar(Usuario u) {
        String sql = "UPDATE usuario SET nombre=?, apellido=?, correo=?, password=?, telefono=? WHERE id_usuario=?";

        try (Connection con = new Conexion().conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getCorreo());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getTelefono());
            ps.setInt(6, u.getId());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error actualizar: " + e.getMessage());
        }
    }

    // ELIMINAR
    public void eliminar(int id) {
        String sql = "DELETE FROM usuario WHERE id_usuario=?";

        try (Connection con = new Conexion().conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error eliminar: " + e.getMessage());
        }
    }
}
