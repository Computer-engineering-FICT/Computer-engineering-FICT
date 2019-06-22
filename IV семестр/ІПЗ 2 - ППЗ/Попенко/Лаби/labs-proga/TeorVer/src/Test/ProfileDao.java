package Test;

import java.sql.SQLException;
import java.util.List;

import tables.Profile;

public interface ProfileDao {
	
	public void addProfile (Profile profile) throws SQLException;
	public void updateProfile (Profile profile) throws SQLException;
	public void deleteProfile (Profile profile) throws SQLException;
	public Profile getProfile (int id) throws SQLException;
	public List<Profile> getProfiles () throws SQLException;

}
