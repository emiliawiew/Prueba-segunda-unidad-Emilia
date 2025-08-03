import java.sql.*;

public class InsertarCliente {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/examen?useSSL=false&serverTimezone=UTC";
        String usuario = "root";
        String clave = "";

        try (Connection conexion = DriverManager.getConnection(url, usuario, clave)) {
            System.out.println("Conexión exitosa.");

            String insert = "INSERT INTO clientes(nombre, email) VALUES(?, ?)";
            PreparedStatement ps = conexion.prepareStatement(insert);
            ps.setString(1, "Cliente JDBC");
            ps.setString(2, "clientejdbc@example.com");

            int filas = ps.executeUpdate();
            if (filas > 0) {
                System.out.println("✅ Cliente insertado correctamente.");
            } else {
                System.out.println("⚠️ No se insertó el cliente.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
