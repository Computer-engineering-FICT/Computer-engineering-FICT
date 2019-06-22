package kpi.flashfs.main;

public class Params {
    //Size of block in bytes
    public static int BLOCK_SIZE     = 56;
    
    //Flash size in blocks
    public static int FLASH_SIZE    = 3;
    
    //Name of file which emulates flash
    public static String FILE_NAME     = "flash.dat";
    
    //Minimal count of free blocks on the flash
    public static int REQ_FREE_BLOCKS_COUNT = 1;
}
