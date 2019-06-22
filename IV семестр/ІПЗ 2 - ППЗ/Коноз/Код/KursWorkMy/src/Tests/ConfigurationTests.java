package Tests;

import static org.junit.Assert.*;

import org.junit.Test;

import configuration.CompositeStructure.CompositeComponent;
import configuration.CompositeStructure.CompositePropery;
import configuration.CompositeStructure.LeafProperty;

/**
 * Даний тестовий клас проводить тестування пакету класів, які призначені
 * для конфігурування програми.
 * @author Коноз Андрій 
 */
public class ConfigurationTests {

	/**
	 * Даний тест перевіряє механізми запису і зчитування простих файлів
	 * конфігурації.
	 */
	@Test
	public void writeReadLeafTest() {
		LeafProperty lfp1 = new LeafProperty("D:\\leaf.xml", "Test");
		lfp1.put("1", "1");
		lfp1.put("2", "2");
		lfp1.save();
		LeafProperty lfp2 = new LeafProperty();
		lfp2.load("D:\\leaf.xml");
		assertEquals(lfp1.getName(), lfp2.getName());
		assertEquals(lfp1.getProperty("1"), lfp2.getProperty("1"));
		assertEquals(lfp1.getProperty("2"), lfp2.getProperty("2"));
	}
	/**
	 * Тест перевіряє запис і відтворення складних композитних структур
	 * конфігураційних файлів, а також методи для роботи з цими структурами.
	 */
	@Test
	public void writeReadCompositeTest() {
		CompositeComponent lfp1 = new LeafProperty("D:\\leaf111.xml", "Test");
		lfp1.put("1", "1");
		lfp1.put("2", "2");
		CompositeComponent lfp2 = new LeafProperty("D:\\leaf2.xml", "Test2");
		lfp2.put("11", "11");
		lfp2.put("22", "22");
		CompositeComponent cmpp1 = new CompositePropery("D:\\cmpp1.xml", "CompTest1");
		CompositeComponent cmpp2 = new CompositePropery("D:\\cmpp2.xml", "CompTest2");
		
		cmpp1.addComponent(lfp1);
		cmpp2.addComponent(lfp2);
		cmpp1.addComponent(cmpp2);
		
		cmpp1.save();
		
		CompositeComponent loaded = new CompositePropery();
		loaded.load("D:\\cmpp1.xml");
		assertEquals(cmpp1.getName(), loaded.getName());
		LeafProperty original = (LeafProperty) cmpp1.getProperties("Test");
		LeafProperty load = (LeafProperty) loaded.getProperties("Test");
		
		assertEquals(original.getProperty("1"), load.getProperty("1"));
		assertEquals(original.getProperty("2"), load.getProperty("2"));
		original = (LeafProperty) cmpp1.getProperties("Test2");
		load = (LeafProperty) loaded.getProperties("Test2");
		System.out.println(loaded.getProperties("Test").toString());
		assertNotNull(loaded);
		assertNotNull(load);
		assertEquals(original.getProperty("11"), load.getProperty("11"));
		assertEquals(original.getProperty("22"), load.getProperty("22"));
	}

}
