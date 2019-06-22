import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import tables.AppForParticip;
import tables.Category;
import tables.Competition;
import tables.Profile;
import dao.AppForParticipDao;
import dao.CategoryDao;
import dao.CompetitionDao;
import dao.ProfileDao;


public class Project {

	public static void main(String[] args) throws SQLException {
		Factory factory = Factory.getInstance();
		ProfileDao profileDao = factory.getProfileDao();
		CategoryDao categoryDao=factory.getCategoryDao();
		CompetitionDao competitionDao=factory.getCompetitionDao();
		AppForParticipDao appForParticipDao=factory.getAppForParticipDao();
		
		
		AppForParticip ap=new AppForParticip();
		ap.setCategory(categoryDao.getCategory(3));
		ap.setCompetition(competitionDao.getCompetition(1));
		ap.setDate(Timestamp.valueOf("2007-09-23 10:10:10.0"));
		ap.setProfile(profileDao.getProfile(1));
		ap.setResult(true);
		
		//appForParticipDao.addAppForParticip(ap);
		List<AppForParticip> list =appForParticipDao.getAppForParticips();
		System.out.println(list.get(0)+" "+list.get(1));
		
		
		/*Category cat=categoryDao.getCategory(1);
		prof.setCategory(cat);
		prof.seteMail("vefewfef");
		prof.setContacts("ffqwffwq");
		prof.setName("fwefwf");
		prof.setPhoto("fewfwf");
		profileDao.addProfile(prof);*/
		
		/*Competition comp=competitionDao.getCompetition(1);
		AppForParticip ap=new AppForParticip();
		ap.setCategory(cat);
		ap.setResult("Registrate");
		ap.setProfile(Rus);
		ap.setCompetition(comp);
		Timestamp timestamp = Timestamp.valueOf("2007-09-23 10:10:10.0");
		ap.setDate(timestamp);
		
		List<Category> lis=categoryDao.getCategorys();
		
		for (int i=0; i<4;i++ ) {
			System.out.println(lis.get(i).getId()+" "+lis.get(i).getCateg());
			
		}
		
		List<Profile> lis=profileDao.getProfiles();*/
		
		
		

	}

}
