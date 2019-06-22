import java.io.*;

public class Main {

    public static void main(String[] args) throws IOException, ClassNotFoundException, MyException {
        String destination = System.getProperty("user.dir")+ "/data/";
        new File(destination).mkdirs();
        Serializing worksWithFile = new Serializing();
        TestSerializing tests = new TestSerializing();
        Vegetable a = new Vegetable("Помідор", 12);
        Vegetable b = new Vegetable("Огірок", 8);
        Vegetable c = new Vegetable("Цибуля", 5);
        Vegetable d = new Vegetable("Морква", 13);
        VegetablesCollection salad = new VegetablesCollection();
        salad.add(a);
        salad.add(b);
        salad.add(c);
        salad.add(d);
        worksWithFile.writeCollectionAsObjectsList(salad, destination + "Objects List");
        worksWithFile.writeCollectionAsOneObject(salad, destination + "One Object");
        worksWithFile.writeCollectionAsText(salad, destination + "Text");
        tests.testReadCollectionAsText();
        tests.testReadCollectionAsOneObject();
        tests.testReadCollectionAsObjectsList();
        VegetablesCollection saladRead = worksWithFile.readCollectionAsObjectsList(destination + "Objects List");
        System.out.println("Зчитаний із текстового файлу салат");
        for (Object i : saladRead) {
            System.out.println(i);
        }
        System.out.println("\nНезчитаний салат");
        for (Object i : salad) {
            System.out.println(i);
        }
    }
}
