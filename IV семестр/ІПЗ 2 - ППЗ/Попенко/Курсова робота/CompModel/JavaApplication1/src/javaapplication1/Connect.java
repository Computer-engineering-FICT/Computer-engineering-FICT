package javaapplication1;


import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
/**
 *
 * @author Rus
 */
public class Connect {
    private Connection connection = null;
    private Statement statement;
     public Connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(
	            "jdbc:mysql://localhost/compDB", "root", "1111");                 
        
    } catch(Exception e){
        JOptionPane.showMessageDialog(null, "Помилка з'єднання");
    }        
    }
    public void update (String query){
        try {
            statement = null;
            statement = connection.createStatement();
            statement.executeUpdate(query);
            
        } catch (SQLException ex) {
             JOptionPane.showMessageDialog(null, "Не вдалося");
        }
        
    }
    
    
    
}
