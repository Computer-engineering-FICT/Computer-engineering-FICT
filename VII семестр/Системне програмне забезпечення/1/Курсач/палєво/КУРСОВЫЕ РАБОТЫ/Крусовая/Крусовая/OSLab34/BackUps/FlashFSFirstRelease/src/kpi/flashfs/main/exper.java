package kpi.flashfs.main;

import java.io.File;
import java.util.Arrays;

import kpi.flashfs.control.Controller;
import kpi.flashfs.iosys.Buffer;

public class exper {

	/**
	 * @param args
	 */
	public static void main(String[] args) {	    
	    Controller.format();
	    
	    Controller con = new Controller(new File(Params.FILE_NAME));
	    con.mount();
	    
	    con.create("a");
	    
	    int id1 = con.open("a");	    
	    
	    byte[] dat = new byte[10];
	    Arrays.fill(dat, (byte) 0xDD);
	    con.write(id1, 0, 10, dat);
	    System.out.println(con.list());
	    con.flushBuffer();
	    byte [] dat1 = {(byte) 0xAA, (byte) 0xAA, (byte) 0xAA};
	    con.write(id1, 2, 3, dat1);
	    System.out.println(con.list());	  
	    
	    //con.unlink(id1, "a");
	    
	    con.clean();	     	   
	    
	    con.flushBuffer();   
	    
	    System.out.println(con.list());	
	    
	    byte[] readDat = con.read(id1, 0, 30);
	    System.out.println(Buffer.byteArrToHexStr(readDat));
	    
	    con.unmount();
	    
	}

}
