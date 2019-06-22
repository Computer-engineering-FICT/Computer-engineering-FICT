package Lab7;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

public class MyTestMyCollection {
	private Ammunition am;
	private Ammunition am1;
	private Ammunition am2;
	private Ammunition am3;
	private Ammunition am4;
	/**
	 * метод буде запускатись перед кожним тестом
	 * @throws MyException
	 */
	@Before
	public void setParam() throws MyException{
		am = new Ammunition("name0", 100, 200);
		am1 = new Ammunition("name", 10, 20);
		am2 = new Ammunition("name2", 30, 40);
		am3 = new Ammunition("name2", 50, 60);
		am4 = new Ammunition("name4", 70, 80);
	}
	/**
	 * тест методу Remove на виключну ситуацію
	 * NullPointerException
	 */
	@Test (expected = NullPointerException.class)
	public void testRemoveNullPointerException(){
		MyCollection myCollection = new MyCollection();
		myCollection.remove(null);
	}

	/**
	 * тест методу Сontains на виключну ситуацію
	 * NullPointerException
	 */
	@Test (expected = NullPointerException.class)
	public void testContainsNullPointerException(){
		MyCollection col = new MyCollection();
		assertTrue(col.contains(null));
	}

	/**
	 * тест методу Remove на виключну ситуацію
	 * IndexOutOfBoundsException
	 */
	@Test (expected = IndexOutOfBoundsException.class)
	public void testRemoveIndexOutOfBoundsException(){
		MyCollection myCollection = new MyCollection();
		myCollection.remove(-2);
		myCollection.remove(8);
	}

	/**
	 * тест методу Get на виключну ситуацію
	 * IndexOutOfBoundsException
	 */
	@Test (expected = IndexOutOfBoundsException.class)
	public void testGetIndexOutOfBoundsException(){
		MyCollection myCollection = new MyCollection();
		myCollection.get(-5);
		myCollection.get(35);
	}

	/**
	 * тест методу Add на виключну ситуацію
	 * NullPointerException
	 */

	@Test (expected = NullPointerException.class)
	public void testAddAmmunitionNullException(){
		MyCollection myCollection = new MyCollection();
		myCollection.add(null);
	}

	/**
	 * Тест методу Add
	 */
	@Test
	public void testAddAmmunition() {
		MyCollection myCollection = new MyCollection();
		assertTrue(myCollection.add(am));
	}

	/**
	 * тест методу addInt на виключну ситуацію
	 * IndexOutOfBoundsException
	 */
	@Test (expected = IndexOutOfBoundsException.class)
	public void testAddArrayIndexOutOfBoundsException(){
		MyCollection myCollection = new MyCollection();
		myCollection.add(-5, am1);
	}

	/**
	 * Тест методу addAll
	 */
	@Test
	public void testAddAllCollectionOfQextendsAmmunition() {
		MyCollection col = new MyCollection();
		ArrayList<Ammunition> arr = new ArrayList<Ammunition>();
		arr.add(am); arr.add(am2);
		assertTrue(col.addAll(arr));
	}

	/**
	 * Тест методу AddAllIntCollection
	 */
	@Test
	public void testAddAllIntCollectionOfQextendsAmmunition() {
		MyCollection col = new MyCollection();
		ArrayList<Ammunition> arr = new ArrayList<Ammunition>();
		arr.add(am); arr.add(am2);
		assertTrue(col.addAll(1, arr));
		assertTrue(col.get(0)==null);
		assertTrue(col.get(2)==am2);
	}

	/**
	 * Тест методу clear
	 */
	@Test
	public void testClear() {
		MyCollection col = new MyCollection(am);
		col.clear();
		assertTrue(col.get(0)==null);
	}

	/**
	 * Тест методу Contains
	 */
	@Test
	public void testContains() {
	
		MyCollection col = new MyCollection();
		assertTrue(col.indexOf(am)==-1);
		col.add(am);
		assertTrue(col.get(0)==am);
	}

	/**
	 * Тест методу ContainsAll
	 */
	@Test
	public void testContainsAll() {
		MyCollection col = new MyCollection(am);
		ArrayList<Ammunition> arr = new ArrayList<Ammunition>();
		arr.add(am);
		assertTrue(col.containsAll(arr));
	}

	/**
	 * Тест методу ContainsAll
	 */
	@Test
	public void testIndexOf() {
		MyCollection col = new MyCollection();
		assertTrue(col.indexOf(am)==-1);
		col.add(am);
		assertTrue(col.indexOf(am)==0);
	}

	/**
	 * Тест методу isEmpty
	 */
	@Test
	public void testIsEmpty() {
		MyCollection myCollection = new MyCollection();
		assertTrue(myCollection.isEmpty());
	}

	/**
	 * Тест методу LastIndexOf
	 */
	@Test
	public void testLastIndexOf() {
		MyCollection col = new MyCollection();
		col.add(am);
		col.add(am);
		assertTrue(col.lastIndexOf(am)==1);
		
		
	}

	/**
	 * Тест методу Remove
	 */
	@Test
	public void testRemoveObject() {
		MyCollection col = new MyCollection(am);
		col.add(am1);
		col.remove(am);
		assertTrue(col.get(0)==am1);
		
	}

	/**
	 * Тест методу RemoveInt
	 */
	@Test
	public void testRemoveInt() {
		MyCollection col = new MyCollection(am);
		col.add(am1);
		col.remove(0);
		assertTrue(col.get(0)==am1);
	}

	/**
	 * Тест методу removeAll
	 */
	@Test
	public void testRemoveAll() {
		Ammunition [] arr = new Ammunition[3];
		arr[0]=am1;
		arr[1]=am2;
		arr[2]=am3;
		MyCollection col = new MyCollection(arr);
		ArrayList<Ammunition> amm = new ArrayList<Ammunition>();
		amm.add(am1);
		amm.add(am2);
		col.removeAll(amm);
		assertTrue(col.indexOf(am1)==-1);
		assertTrue(col.get(0)==am3);
		
	}

	/**
	 * Тест методу RetainsAll
	 */
	@Test
	public void testRetainAll() {
		
		Ammunition [] arr = new Ammunition[3];
		arr[0]=am1;
		arr[1]=am2;
		arr[2]=am3;
		MyCollection col = new MyCollection(arr);
		ArrayList<Ammunition> amm = new ArrayList<Ammunition>();
		amm.add(am1);
		col.retainAll(amm);
		assertTrue(col.indexOf(am2)==-1);
		assertTrue(col.get(0)==am1);
	}

	/**
	 * Тест методу Set
	 */
	@Test
	public void testSet() {
	
		MyCollection col = new MyCollection();
		col.add(am1);
		col.add(am3);
		col.set(1, am2);
		assertTrue(col.get(1)==am2);
	}

	/**
	 * Тест методу size
	 */
	@Test
	public void testSize() {
		
		MyCollection col = new MyCollection();
		col.add(am1);
		col.add(am3);
		col.add(am2);
		assertTrue(col.size()==3);
	}

	/**
	 * Тест методу subList
	 */
	@Test
	public void testSubList() {
		
		MyCollection col = new MyCollection();
		col.add(am1);
		col.add(am2);
		col.add(am3);
		col.add(am4);
		ArrayList<Ammunition> ar1 = new ArrayList<Ammunition>();
		ar1.add(am2);
		ar1.add(am3);
		
		ArrayList<Ammunition> ar2 = col.subList(1, 3);
		assertArrayEquals(ar1.toArray(), ar2.toArray());
		
	}

	/**
	 * Тест методу toArray
	 */
	@Test
	public void testToArray() {
		
		MyCollection col = new MyCollection();
		col.add(am1);
		col.add(am2);
		col.add(am3);
		col.add(am4);
		Ammunition [] am = new Ammunition [4];
		am[0]=am1;
		am[1]=am2;
		am[2]=am3;
		am[3]=am4;
		assertArrayEquals(am, col.toArray());
	}

	/**
	 * Тест методу IsCorrectAmmunition
	 */
	@Test
	public void testIsCorrectAmmunition() {
		Helmet am1=null;
		Armor am2=null;
		Sword am3=null;
		Shield am4=null;
		try {
			am1 = new Helmet("name", 10, 20);
			am2 = new Armor("name2", 30, 40);
			am3 = new Sword("name2", 50, 60);
			am4 = new Shield("name4", 70, 80);
		} catch (MyException e) {
			System.out.println("при таких параметрах це не буде виводитись");
			e.printStackTrace();
		}
		MyCollection col = new MyCollection();
		col.add(am1);
		col.add(am2);
		col.add(am3);
		col.add(am4);
		assertTrue(col.isCorrectAmmunition());
		Helmet am5=null;
		try{
			am5 = new Helmet("name5", 90 , 10);			
		}catch(MyException e){
		}
		col.add(am5);
		assertFalse(col.isCorrectAmmunition());
	}

}
