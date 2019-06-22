package kpi.flashfs.main;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

import kpi.flashfs.iosys.Record;

/**
 *    Class for create file which emulates flash. It creates free blocks with 
 *    block descriptor "FREE".
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class FlashFormat {   
    /**
     * @param args
     */
    public static void main(String[] args) {
        try {
            RandomAccessFile file = new RandomAccessFile("flash.dat", "rw");
            
            for (int i = 0; i < Params.FLASH_SIZE; i++) {
                file.write(Record.STOP);
                for (int j = 0; j < Params.BLOCK_SIZE - 1; j++) {
                    file.write(0);
                }
            }            
            
            file.close();
            System.out.println("Format: OK");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
