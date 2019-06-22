package Tests;

import static org.junit.Assert.*;


import java.util.LinkedList;
import java.util.List;
import org.junit.BeforeClass;
import org.junit.Test;
import application.Model.Profile;
import configuration.CompositeStructure.AppConfiguration;
import configuration.CompositeStructure.CompositeComponent;
import configuration.CompositeStructure.CompositePropery;
import dao.CRUIDRealisation;
import dao.FilterStub;

/**
 * Набір тестів для тестування {@link CRUIDRealisation}.
 * @author Коноз Андрій 
 */
public class DAOTests {
	static CRUIDRealisation dao;
	/**
	 * Встановлення з'єднання з базою даних.
	 */
	@BeforeClass
	public static void init(){
		dao = new CRUIDRealisation();
		CompositeComponent config = new CompositePropery();
		config.load("D:\\databaseClient.MainConfig.xml");
		AppConfiguration appConfig = AppConfiguration.getAppConfiguration(config);
		try{
			dao.open(appConfig);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * Перевірка з'єднання.
	 */
	@Test
	public void openTest() {
		try{
			assertFalse(dao.connection.isClosed());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	/**
	 * Перевірка методу зчитування.
	 */
	@Test
	public void readTest() {
		Profile prof = new  Profile();
		try{
		prof  = dao.read(Profile.class, 1);
		}catch(Exception e){
			e.printStackTrace();
		}
		assertEquals(prof.getId(), 1);
		assertEquals(prof.getLogin(), "oleh");
		
	}
	
	/**
	 * Перевірка методу вибору
	 */
	@Test
	public void insertTest() {
		Profile prof = new Profile(0, "test", "1111", 1, 1, 1);
		Profile inserted = new Profile();
		Profile readed = new Profile();
		try{
			inserted = dao.insert(prof);
			readed = dao.read(Profile.class, inserted.getId());
			dao.delete(prof);
		}catch(Exception e){
			e.printStackTrace();
		} 
		
		assertEquals(prof.getLogin(), inserted.getLogin());
		assertEquals(prof.getPassword(), inserted.getPassword());
		assertEquals(inserted.getId(), readed.getId());
		
		
	}
	
	/**
	 * Перевірка методу оновлення.
	 */
	@Test
	public void updateTest() {
		Profile prof = new Profile(3, "andriy", "1234", 1, 1, 3);
		Profile readed = new Profile();
		try{
			
			dao.update(prof);
			readed = dao.read(Profile.class, prof.getId());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		assertEquals(readed.getId(), prof.getId());
		assertEquals(readed.getLogin(), prof.getLogin());
		assertEquals(readed.getPassword(), prof.getPassword());
	}
	
	
	/**
	 * Перевірка методу видалення.
	 */
	@Test
	public void deleteTest() {
		Profile prof = new Profile(0, "test", "1111", 1, 1, 1);
		Profile readed = new Profile();
		try{
			
			prof = dao.insert(prof);
			dao.delete(prof);
			readed = dao.read(Profile.class, prof.getId());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		assertEquals(readed.getCategory(), 0);
		assertEquals(readed.getLogin(), null);
		
	}
	/**
	 * Перевірка методу вибірки з фільтром.
	 */
	@Test
	public void selectWithFilterTest() {
		Profile prof1 = new Profile();
		Profile prof2 = new Profile();
		Profile prof3 = new Profile();
		List<Profile> list = new LinkedList<Profile>();
		try{
			prof1 = dao.read(Profile.class, 1);
			prof2 = dao.read(Profile.class, 2);
			prof3 = dao.read(Profile.class, 3);
			
			list = dao.select(Profile.class, new FilterStub());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		for (Profile p : list){
			if(p.getId() == 1){
				assertEquals(prof1.getId(), list.get(0).getId());
				assertEquals(prof1.getLogin(), list.get(0).getLogin());
			}else if (p.getId() == 2){
				assertEquals(prof2.getId(), list.get(1).getId());
				assertEquals(prof2.getLogin(), list.get(1).getLogin());
			}else{
				assertEquals(prof3.getId(), list.get(2).getId());
				assertEquals(prof3.getLogin(), list.get(2).getLogin());
			}
		}
		
		
		
	}
	
	
	@Test
	public void test() {
		try{
			Profile prof = dao.read(Profile.class, 10);
			System.out.println(prof.getId() + " " + prof.getLogin() + " " + prof.getPassword() + " " + prof.getCategory());
		}catch(Exception e){
			e.printStackTrace();
		}
		}
	
	

}
