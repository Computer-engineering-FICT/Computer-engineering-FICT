package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ObjectDao {
	public static String url = "jdbc:mysql://127.0.0.1:3306/mydb";
	public static String name = "root";
	public static String password = "1234";
	public static Connection con = ConnectToDB(url, name, password);

	public static Object create(Object o) throws SQLException {
		String sql = "INSERT INTO object (idObject,Name,Adress) VALUES (?,?,?);";
		try (PreparedStatement stm = con.prepareStatement(sql)) {
			stm.setInt(1, 4);
			stm.setString(2, "Wall");
			stm.setString(3, "Ytes 4");

			stm.executeUpdate();

			o.SetID(4);
			o.SetName("Wall");
			o.SetAdress("Ytes 4");
		}
		return o;
	}

	public static Object Read(Object o, int ID) throws SQLException {
		String sql = "SELECT * FROM object WHERE idObject = ?;";
		try (PreparedStatement stm = con.prepareStatement(sql)) {
			stm.setInt(1, ID);

			ResultSet rs = stm.executeQuery();
			rs.next();
			o.SetID(rs.getInt("idObject"));
			o.SetName(rs.getString("Name"));
			o.SetAdress(rs.getString("Adress"));
		}
		System.out.println("ID Объекта: " + o.GetID());
		System.out.println("Название: " + o.GetName());
		System.out.println("Адрес: " + o.GetAdress());
		System.out.println();
		return o;

	}

	public static List<Object> readAll(Object o) throws SQLException {
		String sql = "SELECT * FROM mydb.object;";
		List<Object> list = new ArrayList<Object>();
		try (PreparedStatement stm = con.prepareStatement(sql)) {
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				o.SetID(rs.getInt("idObject"));
				o.SetName(rs.getString("Name"));
				o.SetAdress(rs.getString("Adress"));
				list.add(o);

				System.out.println("ID Объекта: " + o.GetID());
				System.out.println("Название: " + o.GetName());
				System.out.println("Адрес: " + o.GetAdress());
				System.out.println("-------------------------------------");
			}
		}
		return list;
	}

	public static void update(Object o, int ID) throws SQLException {
		String sql = "UPDATE object SET Name = ?, Adress = ? WHERE idObject = ?;";
		try (PreparedStatement stm = con.prepareStatement(sql)) {
			stm.setString(1, "АТБ");
			stm.setString(2, "Вишгородская 45");
			stm.setInt(3, 3);
			stm.executeUpdate();

			o.SetName("АТБ");
			o.SetAdress("Вишгородская 45");
		}
		return;
	}

	public static void delete(Object o) throws SQLException {
		String sql = "DELETE FROM object WHERE idObject = ?;";
		try (PreparedStatement stm = con.prepareStatement(sql)) {
			stm.setInt(1, 4);
			stm.executeUpdate();

			o.SetID(0);
			o.SetName(null);
			o.SetAdress(null);

		}
		return;
	}

	public static Connection ConnectToDB(String url, String name,
			String password) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, name, password);
			System.out.println("Connected.");
			return con;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void End() throws SQLException {
		con.close();
	}
}
