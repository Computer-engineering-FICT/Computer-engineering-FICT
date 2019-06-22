/**
 * Testing my iterator inside VegetablesCollection
 */
import org.junit.Before;
import org.junit.Test;
import java.util.Iterator;

import static org.junit.Assert.*;

public class TestIterator {

    /**
     * Initialising variables for testing
     */
    private Iterator testIterator;
    private VegetablesCollection testCollection;
    private Vegetable a;
    private Vegetable b;
    private Vegetable c;

    /**
     * Initialising variables for testing
     */
    @Before
    public void setUp() throws MyException{
        a = new Vegetable("Помідор", 12);
        b = new Vegetable("Огірок", 8);
        testCollection.add(a);
        testCollection.add(b);
        testIterator = testCollection.iterator();
    }

    /**
     * Testing iterator's method hasNext
     */
    @Test
    public void testHasNext(){
        assertTrue(testIterator.hasNext());
        testIterator.next();
        assertFalse(testIterator.hasNext());
    }

    /**
     * Testing iterator's method Next
     */
    @Test
    public void testNext(){
        assertSame(b,testIterator.next());
    }
}
