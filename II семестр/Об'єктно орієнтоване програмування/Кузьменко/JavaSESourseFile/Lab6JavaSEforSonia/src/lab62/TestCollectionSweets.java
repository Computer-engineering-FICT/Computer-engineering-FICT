package lab62;
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Iterator;
import org.junit.Before;
import org.junit.Test;


/**
 * 
 * @author sofi
 * Тест-клас для класу CollectionSweets
 *
 */
public class TestCollectionSweets {
	private Sweets sw1;
	private Sweets sw2;
	private Sweets sw3;
	private Sweets sw4;
	private CollectionSweets col;

	/**
	 * ініціалізація даних перед кожним тестом
	 * @throws Exception
	 */
	@Before
	public void setUpBeforeClass() throws Exception {
		sw1 = new Sweets(1, 20, 3, "name1");
		sw2 = new Sweets(2, 50, 80, "name2");
		sw3 = new  Sweets(30, 40, 10, "name3");
		sw4 = new Sweets(50, 20, 4, "name4");
		col = new CollectionSweets();
	}
	@Test (expected = ClassCastException.class)
	public final void testContainsClassCastException() {
		Present p = new Present(col);
		col.contains(p);
	}
	@Test (expected = SweetException.class)
	public final void testSweetException() throws SweetException{
		Sweets sw = new Sweets(10, -4, 45,"name");
	}
	@Test (expected = NullPointerException.class)
	public final void testAddNullPointerException() {
		col.add(null);
	}
	@Test
	public final void testAdd() {
		CollectionSweets col = new CollectionSweets();
		assertTrue(col.add(sw1)==true);
		assertTrue(col.add(sw1)==false);
	}

	@Test
	public final void testAddAll() {
		ArrayList<Sweets> arl = new ArrayList<Sweets>();
		arl.add(sw1);
		arl.add(sw2);
		col.addAll(arl);
		assertTrue(col.add(sw1)==false);
	}

	@Test
	public final void testClear() {
		col.add(sw1);
		col.add(sw2);
		col.clear();
		assertTrue(col.add(sw1)==true);
	}

	@Test
	public final void testContains() {
		col.add(sw1);
		assertTrue(col.contains(sw1));
	}

	@Test
	public final void testContainsAll() {
		ArrayList<Sweets> arl = new ArrayList<Sweets>();
		arl.add(sw1);
		col.add(sw1);
		assertTrue(col.containsAll(arl));
	}

	@Test
	public final void testIsEmpty() {
		assertTrue(col.isEmpty());
	}

	@Test
	public final void testIterator() {
		Iterator<Sweets> itr = col.iterator();
		col.add(sw1);
		col.add(sw2);
		
		ArrayList<Sweets> arl = new ArrayList<Sweets>();
		arl.add(sw1);
		arl.add(sw2);
		int i=0;
		while (itr.hasNext()) {
			Sweets sweets = (Sweets) itr.next();
			assertTrue(sweets.equals(arl.get(i)));
			i++;
		}
		itr = col.iterator();
		itr.next();
		itr.remove();
		assertTrue(col.add(sw2));
	}

	@Test
	public final void testRemove() {
		col.add(sw1);
		col.remove(sw1);
		assertTrue(col.add(sw1));
	}

	@Test
	public final void testRemoveAll() {
		ArrayList<Sweets> arl = new ArrayList<Sweets>();
		col.add(sw1);
		col.add(sw4);
		arl.add(sw1);
		arl.add(sw3);
		col.removeAll(arl);
		assertTrue(col.add(sw1));
	}

	@Test
	public final void testRetainAll() {
		ArrayList<Sweets> arl = new ArrayList<Sweets>();
		col.add(sw1);
		col.add(sw4);
		arl.add(sw1);
		arl.add(sw2);
		arl.add(sw3);
		col.retainAll(arl);
		assertTrue(col.add(sw4));
	}

	@Test
	public final void testSize() {
		assertTrue(col.size()==0);
		col.add(sw1);
		col.add(sw2);
		assertTrue(col.size()==2);
	}

	@Test 
	public final void testToArray() {
		ArrayList<Sweets> arl = new ArrayList<Sweets>();
		col.add(sw1);
		col.add(sw2);
		arl.add(sw1);
		arl.add(sw2);
		assertTrue(arl.toArray()[0].equals(col.toArray()[0]));
		assertTrue(arl.toArray()[1].equals(col.toArray()[1]));
		}

}
