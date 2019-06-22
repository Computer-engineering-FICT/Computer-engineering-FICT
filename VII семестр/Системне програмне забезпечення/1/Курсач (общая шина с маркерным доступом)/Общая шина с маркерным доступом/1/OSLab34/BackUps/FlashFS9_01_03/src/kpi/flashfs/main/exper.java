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
		//=====================================
		Controller.format();

	    Controller con = new Controller(new File(Params.FILE_NAME));
	    con.mount();
	    //=====================================
	    
	    
	    //**************TEST 1*******************
	    con.create("a");
	    
	    int id1 = con.open("a");	    
	    
	    byte[] dat0 = new byte[60];
	    Arrays.fill(dat0, (byte) 'A');
	    con.write(id1, 0, dat0.length, dat0);
	    System.out.println("A: created. 60 bytes 'A' writed");
	    System.out.println(con.list());
	    
	    byte[] dat1 = new byte[5];
	    Arrays.fill(dat1, (byte) 'B');
	    con.write(id1, 0, 5, dat1);
	    System.out.println("A: write. 5 bytes 'B' from shift 3 writed");
	    System.out.println(con.list());	  
	    
	    System.out.println("CLEAN");
	    con.clean();	    
	    con.flushBuffer();   	    
	    System.out.println(con.list());	
	    
	    System.out.println("A: read from 0 to a.size");
	    byte[] readDat = con.read(id1, 0, con.getFileSize(id1));
	    System.out.println(Buffer.byteArrToStr(readDat));
	    
	    byte[] dat2 = new byte[15];
	    Arrays.fill(dat2, (byte) 'C');
	    con.write(id1, 9, 15, dat2);
	    System.out.println("A: write. 15 bytes 'C' from shift 9 writed");
	    System.out.println(con.list());	  
	    con.flushBuffer();
	    
	    System.out.println(con.list());
	    
		//=====================================
	    con.unmount();
		//=====================================
	}

}
