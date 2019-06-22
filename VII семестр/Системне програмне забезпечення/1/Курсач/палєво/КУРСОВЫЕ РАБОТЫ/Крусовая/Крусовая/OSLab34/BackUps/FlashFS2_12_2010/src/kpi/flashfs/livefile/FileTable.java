package kpi.flashfs.livefile;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import kpi.flashfs.iosys.Record;

/**
 * Table each line of what describes one file. All files on flash are described
 * in this table.
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class FileTable {
	private HashMap<Integer, FileDescriptor> table;
	
	private HashMap<Integer, Integer> idSysId;
	int sysId;
	
	public FileTable(ArrayList<Record> queue) {
		table = new HashMap<Integer, FileDescriptor>();		
		
		Collections.sort(queue, new Comparator<Record>() {
			@Override
			public int compare(Record o1, Record o2) {
				return o1.getVer() - o2.getVer();
			}			
		});		
		
		for (Record rec : queue) {
			applyRecord(rec);
		}
		
		idSysId = new HashMap<Integer, Integer>();
		sysId = 0;
	}
	
	public void applyRecord(Record rec) {
		if (!table.containsKey(rec.getFileId())) {
			table.put(rec.getFileId(), new FileDescriptor(rec.getFileId()));
		}
		
		table.get(rec.getFileId()).applyDescriptor(rec);
	}
	
	public FileDescriptor getFile(int id) {
		return table.get(id);
	}
	
	public void putFile(int id, FileDescriptor fileDesc) {
		table.put(id, fileDesc);
	}
	
	public boolean containId(int id) {
		return table.containsKey(id);
	}
	
	public String toString() {
		StringBuffer str = new StringBuffer();
		
		for (FileDescriptor desc : table.values()) {
			str.append(desc + "\n");
		}
		
		return str.toString();
	}
	
	public int open(String name) {
		int rez = 0;
		
		
	}
}
