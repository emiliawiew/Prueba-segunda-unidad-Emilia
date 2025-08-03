import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConsultaLibros {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/examen?useSSL=false&serverTimezone=UTC";
        String usuario = "root"; 
        String clave = ""; 

        Connection conexion = null;
        Statement stat1 = null;
        ResultSet resultado1 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, clave);
            stat1 = conexion.createStatement();
            String sql = "SELECT titulo, autor FROM libros";
            resultado1 = stat1.executeQuery(sql);

            while (resultado1.next()) {
                String titulo = resultado1.getString("titulo");
                String autor = resultado1.getString("autor");
                System.out.println("Título: " + titulo + " | Autor: " + autor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (resultado1 != null) resultado1.close(); } catch (Exception e) {}
            try { if (stat1 != null) stat1.close(); } catch (Exception e) {}
            try { if (conexion != null) conexion.close(); } catch (Exception e) {}
        }
    }
}
