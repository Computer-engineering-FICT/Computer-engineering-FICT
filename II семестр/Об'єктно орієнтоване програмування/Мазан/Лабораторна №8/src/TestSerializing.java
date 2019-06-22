/**
 * Testing my Serializator that works with files
 */
import org.junit.Test;
import java.io.*;
import static org.junit.Assert.*;

public class TestSerializing {

    /**
     * Initialising variables for testing
     */
    private static final String destination = System.getProperty("user.dir")+ "/data/";

    private VegetablesCollection testCollection;
    private Serializing workWithFile;

    /**
     * Testing of method writeCollectionAsOneObject()
     */
    @Test
    public void testWriteCollectionAsOneObject() throws IOException,MyException{
        new File(destination).mkdirs();
        workWithFile = new Serializing();
        Vegetable a = new Vegetable("Помідор", 12);
        Vegetable b = new Vegetable("Огірок", 8);
        testCollection = new VegetablesCollection();
        testCollection.add(a);
        testCollection.add(b);
        workWithFile.writeCollectionAsOneObject(testCollection, destination + "raw collection");
        boolean check = new File(destination, "raw collection").exists();
        assertTrue(check);
    }

    /**
     * Testing of method writeCollectionAsObjectsList()
     */
    @Test
    public void testWriteCollectionAsObjectsList() throws IOException,MyException{
        workWithFile = new Serializing();
        Vegetable a = new Vegetable("Помідор", 12);
        Vegetable b = new Vegetable("Огірок", 8);
        testCollection = new VegetablesCollection();
        testCollection.add(a);
        testCollection.add(b);
        workWithFile.writeCollectionAsObjectsList(testCollection, destination + "objects list");
        boolean check = new File(destination, "objects list").exists();
        assertTrue(check);
    }

    /**
     * Testing of method writeCollectionAsText()
     */
    @Test
    public void testWriteCollectionAsText() throws IOException,MyException{
        workWithFile = new Serializing();
        Vegetable a = new Vegetable("Помідор", 12);
        Vegetable b = new Vegetable("Огірок", 8);
        testCollection = new VegetablesCollection();
        testCollection.add(a);
        testCollection.add(b);
        workWithFile.writeCollectionAsText(testCollection, destination+"text");
        boolean check = new File(destination, "text").exists();
        assertTrue(check);
    }

    /**
     * Testing of method readCollectionAsOneObject(
     */
    @Test
    public void testReadCollectionAsOneObject() throws IOException, ClassNotFoundException, MyException {
        workWithFile = new Serializing();
        Vegetable a = new Vegetable("Помідор", 12);
        Vegetable b = new Vegetable("Огірок", 8);
        testCollection = new VegetablesCollection();
        testCollection.add(a);
        testCollection.add(b);
        workWithFile.writeCollectionAsOneObject(testCollection, destination+"raw collection");
        testCollection = workWithFile.readCollectionAsOneObject(destination + "raw collection");
        assertEquals(testCollection.size(),2);
    }

    /**
     * Testing of method readCollectionAsObjectsList
     */
    @Test
    public void testReadCollectionAsObjectsList() throws IOException, ClassNotFoundException, MyException{
        workWithFile = new Serializing();
        Vegetable a = new Vegetable("Помідор", 12);
        Vegetable b = new Vegetable("Огірок", 8);
        testCollection = new VegetablesCollection();
        testCollection.add(a);
        testCollection.add(b);
        workWithFile.writeCollectionAsObjectsList(testCollection, destination+"objects list");
        testCollection = workWithFile.readCollectionAsObjectsList(destination + "objects list");
        assertEquals(testCollection.size(),2);
    }

    /**
     * Testing of method readCollectionAsText()
     */
    @Test
    public void testReadCollectionAsText() throws IOException, ClassNotFoundException, MyException{
        workWithFile = new Serializing();
        Vegetable a = new Vegetable("Помідор", 12);
        Vegetable b = new Vegetable("Огірок", 8);
        testCollection = new VegetablesCollection();
        testCollection.add(a);
        testCollection.add(b);
        workWithFile.writeCollectionAsText(testCollection, destination+"text");
        testCollection = workWithFile.readCollectionAsText(destination + "text");
        assertEquals(testCollection.size(),2);
    }
}
