package lab6;

import static org.junit.Assert.*;

import java.util.ListIterator;
import org.junit.Before;
import org.junit.Test;
/**
 * ����-���� ��� ����������� ����� MyListIterator
 * @author Lenovo
 *
 */
public class MyTestMyListIterator {
	private Ammunition am;
	private Ammunition am1;
	private Ammunition am2;
	private Ammunition am3;
	/**
	 * ����������� ���������. ���������� ����� ������ ������
	 * @throws MyException
	 */
	@Before
	public void setParam() throws MyException{
		am = new Ammunition("name0", 100, 200);
		am1 = new Ammunition("name", 10, 20);
		am2 = new Ammunition("name2", 30, 40);
		am3 = new Ammunition("name2", 50, 60);
	}
	/**
	 * ���� ��� ������������ MyListIteratorInt 
	 */
	@Test
	public void testMyListIteratorInt() {
		MyCollection col = new MyCollection(am);
		ListIterator<Ammunition> itr = col.listIterator(1);
		assertTrue(itr.nextIndex()==2);
		assertTrue(itr.previous()==am);
	}
	
	/**
	 * ���� ��� ������������ MyListIterator 
	 */
	@Test
	public void testMyListIterator() {
		
		MyCollection col = new MyCollection();
		ListIterator<Ammunition> itr = col.listIterator();
		assertFalse(itr.hasNext());
		assertFalse(itr.hasPrevious());
		
	}

	/**���� ��� ������ */
	@Test
	public void testAdd() {
		MyCollection col = new MyCollection();
		ListIterator<Ammunition> itr = col.listIterator();
		itr.add(am);
		assertTrue(col.get(0)==am);
		
	}

	/**���� ��� ������ hasNext */
	@Test
	public void testHasNext() {
		MyCollection col = new MyCollection(am);
		ListIterator<Ammunition> itr = col.listIterator();
		assertTrue(itr.hasNext());
		itr.next();
		itr.add(am);
		assertFalse(itr.hasNext());
		
		
		
	}
	/**���� ��� ������ hasPrevious */
	@Test
	public void testHasPrevious() {
		MyCollection col = new MyCollection();
		ListIterator<Ammunition> itr2 = col.listIterator();
		assertFalse(itr2.hasPrevious());
		col.add(am1);
		col.add(am2);
		itr2.next();
		assertTrue(itr2.hasPrevious());	
	}
	
	/**���� ��� ������  next */
	@Test
	public void testNext() {
		MyCollection col = new MyCollection(am1);
		ListIterator<Ammunition> itr = col.listIterator();
		assertTrue(itr.next()==am1);
	}
	
	/**���� ��� ������ nextIndex */
	@Test
	public void testNextIndex() {
		MyCollection col = new MyCollection(am1);
		ListIterator<Ammunition> itr = col.listIterator();
		assertTrue(itr.nextIndex()==1);
	}
	
	/**���� ��� ������ previous */
	@Test
	public void testPrevious() {
		
		MyCollection col = new MyCollection();
		ListIterator<Ammunition> itr2 = col.listIterator();
		assertTrue(itr2.previous()==null);
		col.add(am1);
		col.add(am2);
		itr2.next();
		assertTrue(itr2.previous()==am2);	
	}
	
	/**���� ��� ������ previous */
	@Test
	public void testPreviousIndex() {
		
		MyCollection col = new MyCollection();
		ListIterator<Ammunition> itr2 = col.listIterator();
		assertTrue(itr2.previousIndex()==0);
		col.add(am1);
		col.add(am2);
		itr2.next();
		assertTrue(itr2.previousIndex()==1);	
	}
	
	/**���� ��� ������ remove */
	@Test
	public void testRemove() {
		
		MyCollection col = new MyCollection();
		ListIterator<Ammunition> itr2 = col.listIterator();
		col.add(am1);
		col.add(am2);
		assertTrue(col.get(0)==am1);
		assertTrue(col.get(1)==am2);
		itr2.remove();
		assertTrue(col.get(0)==am2);
		assertTrue(col.get(1)==null);
	}
	
	/**���� ��� ������ set */
	@Test
	public void testSet() {
		
		MyCollection col = new MyCollection();
		ListIterator<Ammunition> itr = col.listIterator();
		itr.add(am1);
		itr.add(am3);
		itr.set(am2);
		assertTrue(col.get(1)==am2);
	}

}
