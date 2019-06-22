package kpi.flashfs.main;

import java.awt.Container;
import java.io.File;
import java.util.Arrays;

import kpi.flashfs.control.Controller;
import kpi.flashfs.iosys.LinkNameRecord;
import kpi.flashfs.iosys.WriteRecord;
import kpi.flashfs.livefile.FileDescriptor;

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
	    int id2 = con.open("qwe");
	    
	    byte[] dat = new byte[30];
	    Arrays.fill(dat, (byte) 0xDD);
	    con.write(id1, 0, 30, dat);
	    
	    con.create("qwe");
	    
	    con.unmount();
	}

}
