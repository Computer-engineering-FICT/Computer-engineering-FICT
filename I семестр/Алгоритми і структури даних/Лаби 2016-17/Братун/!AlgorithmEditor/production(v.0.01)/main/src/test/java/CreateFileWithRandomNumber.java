import java.io.*;
import java.util.Random;

public class CreateFileWithRandomNumber {
    public static void main(String[] args) throws IOException {
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(new File("random.txt")));
        Random random = new Random();
        for (int i = 0; i < 10000; i++) {
            bufferedWriter.write(random.nextInt(10000) + "\n");
        }
        bufferedWriter.close();
        System.out.println("Done!");
    }
}
