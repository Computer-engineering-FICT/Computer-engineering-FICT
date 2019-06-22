package lab8;

import static org.junit.Assert.*;
import org.junit.Test;

/**
 * �������� ���� ��� ����� WorkWithFile
 * @author Lenovo
 *
 */
public class TestWorkWithFile {
	/**
	 * ���� ��� ������ WriteMyCollection()
	 * ���� ��� ������ ReadMyCollection()
	 */
	@Test
	public void testReadWriteMyCollection() {
		Ammunition am=null;
		try {
			am = new Ammunition("name", 10, 20);
		} catch (MyException e) {
			e.printStackTrace();
		}
		MyCollection col = new MyCollection(am);
		WorkWithFile w = new WorkWithFile(col);
		w.WriteMyCollection();
		assertTrue(w.ReadMyCollection().toArray()[0].getInformation().equals(am.getInformation()));
	}
	/**
	 * ���� ��� ������ WriteAmmunitions()
	 * ���� ��� ������ ReadAmmunition()
	 */
	@Test
	public void testReadWriteAmmunitions() {
		Ammunition am=null;
		Ammunition am1 = null;
		try {
			am = new Ammunition("name", 10, 20);
			am1 = new Ammunition("name2", 40, 50);
		} catch (MyException e) {
			e.printStackTrace();
		}
		Ammunition [] mas = new Ammunition[2];
		mas[0]=am;
		mas[1]=am1;
		WorkWithFile w = new WorkWithFile(mas);
		w.WriteAmmunitions();
		int i=0;
		for (Ammunition ammunition : w.ReadAmmunition()) {
			assertTrue(ammunition.getInformation().equals(mas[i].getInformation()));
			i++;
		}	
	}
	
	/**
	 * ���� ��� ������ WriteInformation()
	 * ���� ��� ������ ReadInformation()
	 */
	@Test
	public void testWriteInformation() {
		Ammunition am = null;
		try {
			am = new Ammunition("name", 10, 20);
		} catch (MyException e) {
			e.printStackTrace();
		}
		MyCollection col = new MyCollection(am);
		WorkWithFile w = new WorkWithFile(col);
		w.WriteInformation();
		assertTrue(w.ReadInformation().equals(am.getInformation()));
		
	}
}
