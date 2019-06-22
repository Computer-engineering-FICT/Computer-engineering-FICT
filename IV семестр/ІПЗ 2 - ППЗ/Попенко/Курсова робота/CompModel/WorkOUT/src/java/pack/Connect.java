package pack;


import com.mysql.jdbc.Connection;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import static java.lang.System.out;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
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
    public ResultSet getRS(String query){
        try {
            statement = null;
            statement = connection.createStatement();
            return statement.executeQuery(query);
            
        } catch (SQLException ex) {
             JOptionPane.showMessageDialog(null, "Не вдалося");
        }
        return null;
    }
    
    
    
}
