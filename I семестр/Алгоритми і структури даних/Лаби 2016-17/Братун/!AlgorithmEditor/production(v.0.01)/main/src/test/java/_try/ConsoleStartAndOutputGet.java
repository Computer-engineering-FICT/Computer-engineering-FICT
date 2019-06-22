package _try;

import java.io.*;

public class ConsoleStartAndOutputGet {
    public static void main(String[] args) throws IOException {
        Runtime rt = Runtime.getRuntime();
        String[] commands = {"program.exe"};
        Process proc = rt.exec(commands);

        BufferedReader stdInput = new BufferedReader(new
                InputStreamReader(proc.getInputStream()));

        System.out.println("Here is the standard output of the command:\n");
        String s;
        while ((s = stdInput.readLine()) != null) {
            System.out.println(s);
        }
    }
}
