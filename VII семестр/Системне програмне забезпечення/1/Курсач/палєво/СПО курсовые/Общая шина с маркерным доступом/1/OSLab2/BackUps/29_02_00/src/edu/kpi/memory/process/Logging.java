package edu.kpi.memory.process;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class Logging {
    private static PrintWriter writer;
    private static boolean consoleMirror = false;
    
    public static void openLogFile(File file) {
        try {
            writer = new PrintWriter(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public static void write(String str) {
        writer.write(str);
        if (consoleMirror) {
            System.out.println(str);
        }
    }
    
    public static void closeFile() {
        writer.close();
    }
    
    public static void setConsoleMirror(boolean b) {
        consoleMirror = b;
    }
}
