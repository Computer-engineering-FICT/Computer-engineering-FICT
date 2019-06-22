package edu.kpi.memory.process;

import java.io.File;
import java.util.Scanner;

public class Start {

    public static void main(String[] args) {
        Logging.openLogFile(new File("log.txt"));
        Processor proc = new Processor(new Parameters());
        
        System.out.println(
                "Menu:\n" + 
                "1. Auto mode\n" +
                "2. Manual mode\n");
        
        Scanner scan = new Scanner(System.in);
        
        int choise = scan.nextInt();
        
        switch (choise) {
            case 1: 
                System.out.println("How many steps: ");
                proc.start(scan.nextInt());
                break;
                        
            case 2: 
                proc.start();
                break;
        }                        
        
        Logging.closeFile();
    }

}
