package kpi.flashfs.main;

import java.util.Arrays;

import kpi.flashfs.iosys.LinkNameRecord;
import kpi.flashfs.iosys.WriteRecord;
import kpi.flashfs.livefile.FileDescriptor;

public class exper {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// new descr
		// old descr
		
		FileDescriptor desc;
		
		int id = 1;
		
		//	       ------ | ------
		//  ------        |         ------
		desc = new FileDescriptor(id);
		desc.applyDescriptor(new LinkNameRecord(0, id, (byte) 3, "abc"));
		byte [] data = {(byte)0xAA, (byte)0xBB, (byte)0xCC, (byte)0xDD, (byte)0xEE};
		desc.applyDescriptor(new WriteRecord(1, id, 0, 5, data));
		WriteRecord r = new WriteRecord(2, id, 1, 2, Arrays.copyOfRange(data, 0, 2));
		r.setFlashShift(10);
		desc.applyDescriptor(r);
		System.out.println(desc);
		//     ------
		//  ------

		//     ----
		//  ---------


		//   ------
		//       ------


	}

}
