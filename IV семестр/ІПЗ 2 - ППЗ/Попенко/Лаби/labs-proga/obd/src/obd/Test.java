package obd;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Time;

/**
 * @author Group 4
 *
 * @version
 */
public class Test {
	public static void main(String[] args) {
		Connection connection = null;
		Statement statement = null;
		Statement statement2 = null;
		Statement statement3 = null;
		String query = "select*from competition";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost/compDB", "root", "1111");
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			printCompetitions(rs);
			query = "insert into `compDB`.`profile`(`profileID`, `name`, `photo`, `eMail`, `contacts`, `usersCategID`) VALUES ('5','Korchak Myhailo','','','05055555555','3')";
			statement = connection.createStatement();
			statement.executeUpdate(query);
			query = "select*from profile";
			rs = statement.executeQuery(query);
			printProfile(rs);
			statement3 = connection.createStatement();
			query = "delete from `compDB`.`profile`" + "where `profileID`=5";
			statement3.executeUpdate(query);
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void printProfile(ResultSet rs) throws SQLException {
		int ProfileID, UsersCategID;
		String name, photo, eMail, contacts;
		while (rs.next()) {
			ProfileID = rs.getInt(1);
			name = rs.getString(2);
			photo = rs.getString(3);
			eMail = rs.getString(4);
			contacts = rs.getString(5);
			UsersCategID = rs.getInt(6);
			System.out.println("--------------------------");
			System.out.println("ProfileID= " + ProfileID);
			System.out.println("name: " + name);
			System.out.println("photo: " + photo);
			System.out.println("e-mail: " + eMail);
			System.out.println("contacts: " + contacts);
			System.out.println("UsersCategID= " + UsersCategID);
			System.out.println("-----------------------------");

		}

	}

	private static void printCompetitions(ResultSet rs) throws SQLException {
		int competitionID;
		String place, description, rewarding;
		Date date;
		Time time;
		while (rs.next()) {
			competitionID = rs.getInt(1);
			place = rs.getString(2);
			date = rs.getDate(3);
			time = rs.getTime(3);
			description = "";
			rewarding = "";
			System.out.println("-----------------------------");
			System.out.println("CompetitionID= " + competitionID);
			System.out.println("Place: " + place);
			System.out.println("Date: " + date + " " + time);
			System.out.println("Description: " + description);
			System.out.println("Rewarding: " + rewarding);
			System.out.println("------------------------------");

		}
	}

}
