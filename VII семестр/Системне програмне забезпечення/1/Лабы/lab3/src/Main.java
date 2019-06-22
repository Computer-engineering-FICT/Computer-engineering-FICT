import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class Main {

     public static void main(String[] args) throws IOException {
         String fileName = "filename.txt";
         FileOutputStream fos = new FileOutputStream(fileName);
         ObjectOutputStream oos = new ObjectOutputStream(fos);
         oos.writeObject(fileName);
     }
}
