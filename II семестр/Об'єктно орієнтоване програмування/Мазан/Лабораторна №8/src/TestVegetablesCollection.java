/**
 * Testing of my VegetablesCollection
 */

import org.junit.Before;
import org.junit.Test;
//import org.junit.runners.Parameterized.Parameters;
import org.junit.runners.Parameterized;

import static org.junit.Assert.*;
public class TestVegetablesCollection {

    private VegetablesCollection testCollection;
    private Vegetable a;
    private Vegetable b;

    /**
     * Method that initialises everything necessary before each testing
     * @throws MyException
     */
    @Before
    public void setUp() throws MyException{
        a = new Vegetable("Помідор", 12);
        b = new Vegetable("Огірок", 8);
        testCollection = new VegetablesCollection();
    }

    /**
     * Testing on IndexOutOfBoundsException
     */
    @Test
    public void testIndexOutOfBoundsException(){
        assertTrue(testCollection.remove(5));
    }

    /**
     * Testing on NulPointerException
     */
    @Test
    public void testNullPointerException() {
        assertTrue(testCollection.add(null));
    }

    /**
     * Testing of method clear()
     */
    @Test
    public void testClear(){
        testCollection.add(a);
        testCollection.add(b);
        testCollection.clear();
        assertEquals(0, testCollection.size());
    }

    /**
     * Testing of method size()
     */
    @Test
    public void testSize(){
        testCollection.add(a);
        testCollection.add(b);
        assertEquals(2, testCollection.size());
    }

    /**
     * Testing of method isEmpty()
     */
    @Test
    public void testIsEmpty(){
        assertTrue(testCollection.isEmpty());
        testCollection.add(a);
        testCollection.add(b);
        assertFalse(testCollection.isEmpty());
    }

    /**
     * Testing of method contains()
     */
    @Test
    public void testContains(){
        testCollection.add(a);
        assertFalse(testCollection.isEmpty());
        assertTrue(testCollection.contains(a));
        assertFalse(testCollection.contains(b));
    }

    /**
     * Testing of method containsAll()
     */
    @Test
    public void testContainsAll(){
        VegetablesCollection testCollection2 = new VegetablesCollection();
        testCollection2.add(a);
        testCollection.add(a);
        testCollection.add(b);
        assertTrue(testCollection.containsAll(testCollection2));
        assertFalse(testCollection2.containsAll(testCollection));
    }

    /**
     * Testing of method toArray()
     */
    @Test
    public void testToArray(){
        Vegetable[] testArray = new Vegetable[2];
        testArray[0] = a;
        testArray[1] = b;
        testCollection.add(a);
        testCollection.add(b);
        assertSame(testCollection.toArray(), testArray);
    }

    /**
     * Testing of method add()
     */
    @Test
    public void testAdd(){
        assertTrue(testCollection.add(a));
    }

    /**
     * Testing of method remove()
     */
    @Test
    public void testRemove(){
        testCollection.add(a);
        testCollection.add(b);
        testCollection.remove(b);
        assertFalse(testCollection.contains(b));
    }

    /**
     * Testing of method addAll()
     */
    @Test
    public void testAddAll(){
        VegetablesCollection testCollection2 = new VegetablesCollection();
        testCollection2.add(a);
        testCollection.add(b);
        testCollection.addAll(testCollection2);
        assertTrue(testCollection.contains(b));
    }

    /**
     * Testing of method retainAll()
     */
    @Test
    public void testRetainAll(){
        VegetablesCollection testCollection2 = new VegetablesCollection();
        testCollection2.add(a);
        testCollection.add(a);
        testCollection.add(b);
        testCollection.retainAll(testCollection2);
        assertFalse(testCollection.contains(b));
    }

    /**
     * Testing of method removeAll()
     */
    @Test
    public void testRemoveAll(){
        VegetablesCollection testCollection2 = new VegetablesCollection();
        testCollection2.add(a);
        testCollection.add(a);
        testCollection.add(b);
        testCollection.removeAll(testCollection2);
        assertFalse(testCollection.contains(a));
    }
}
