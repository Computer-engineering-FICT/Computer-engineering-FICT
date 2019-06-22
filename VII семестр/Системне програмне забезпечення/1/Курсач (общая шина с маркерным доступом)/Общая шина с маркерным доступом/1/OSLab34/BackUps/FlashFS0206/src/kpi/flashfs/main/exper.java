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
//		FileDescriptor desc;
//		
//		int id = 1;
//		desc = new FileDescriptor(id);
//		desc.applyDescriptor(new LinkNameRecord(0, id, (byte) 3, "abc"));
//		byte [] data = {(byte)0xAA, (byte)0xBB, (byte)0xCC, (byte)0xDD, (byte)0xEE, 1, 2, 3, 4, 5};
//		desc.applyDescriptor(new WriteRecord(1, id, 0, 10, data));
//		WriteRecord r = new WriteRecord(2, id, 0, 3, Arrays.copyOfRange(data, 0, 2));
//		r.setFlashShift(10);
//		desc.applyDescriptor(r);
//		r = new WriteRecord(2, id, 2, 14, Arrays.copyOfRange(data, 0, 4));
//        r.setFlashShift(20);
//        desc.applyDescriptor(r);
//		System.out.println(desc);
	    
	    Controller.format();
	    
	    Controller con = new Controller(new File(Params.FILE_NAME));
	    con.mount();
	    
	    con.create("abc");
	    
	    int id1 = con.open("abc");	    
	    
	    byte[] dat = new byte[30];
	    Arrays.fill(dat, (byte) 0xDD);
	    con.write(id1, 0, 30, dat);
	    System.out.println(con.list());
	    
//	    con.create("qwe");
//	    int id2 = con.open("qwe");
//	    
//	    Arrays.fill(dat, (byte) 0xBB);
//	    con.write(id1, 5, 15, dat);
//	    System.out.println(con.list());
//	    
//	    Arrays.fill(dat, (byte) 0xCC);
//	    con.write(id2, 0, 16, dat);
//	    System.out.println(con.list());
//	    
//	    Arrays.fill(dat, (byte) 0xEE);
//	    con.write(id1, 0, 20, dat);
//	    System.out.println(con.list());   	   
	    
	    con.flushBuffer();
//	    
//	    byte[] readDat = con.read(id1, 2, 10);
//	    System.out.println(Buffer.byteArrToHexStr(readDat));
	    
//	    Controller con = new Controller(new File(Params.FILE_NAME));
//	    con.mount();
//
//	    System.out.println(con.list());
//	    
//	    int id1 = con.open("abc");		    
	    
	    byte[] readDat = con.read(id1, 0, 30);
	    System.out.println(Buffer.byteArrToHexStr(readDat));
	    
	    con.unmount();
	    
	}

}
