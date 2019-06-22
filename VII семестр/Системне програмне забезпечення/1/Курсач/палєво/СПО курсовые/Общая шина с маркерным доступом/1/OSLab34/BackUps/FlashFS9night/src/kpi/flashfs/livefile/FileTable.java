package kpi.flashfs.livefile;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

import kpi.flashfs.iosys.Record;

/**
 * Table each line of what describes one file. All files on flash are described
 * in this table.
 * @author Pustovit Michael, pustovitm@gmail.com
 */
/**
 *
 * @author Pustovit Michael, pustovitm@gmail.com
 */
/**
 *
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
	
	/**
	 * For file with name "name", system generates unique id.
	 * @param name opening file name
	 * @return id, or -1 if file with this name doesn't exist
	 */
	public int open(String name) {
		int rez = sysId;
		sysId++;
		
		Collection<FileDescriptor> coll = table.values();
		Iterator<FileDescriptor> iter = coll.iterator();
		FileDescriptor d = null;
		boolean flag = true;
		while (flag && iter.hasNext()) {
		    d = iter.next();
		    if (d.getNames().contains(name)) flag = false;
		}
		
		if (!flag) { 
			if (!idSysId.containsValue(d.getId())) {
				idSysId.put(rez, d.getId());
				d.setSysID(rez);
			} else {
				rez = d.getSysID();
			}
		}
		
		return flag? -1 : rez;
	}
	
	/**
	 * Closing file with id
	 * @param id file id
	 * @return if file with id doesn't exist - flase, 
	 *     else - true
	 */
	public boolean close(int id) {
	    if (idSysId.containsKey(id)) {
	        idSysId.remove(id);
	        return true;
	    } else {
	        return false;
	    }
	}
	
	/**
	 * Getting file with system ID (which we can get 
	 * with open())
	 * @param sysId    files system ID
	 * @return file descriptor of file with system ID sysId,
	 * or null if file doesn't exist
	 */
	public FileDescriptor getFileBySysID(int sysId) {
	    if (idSysId.containsKey(sysId)) {
	        return table.get(idSysId.get(sysId));
	    } else {
	        return null;
	    }
	}
	
	public FileDescriptor getFileByID(int id) {
	    if (table.containsKey(id)) {
	        return table.get(id);
	    } else {
	        return null;
	    }
	}
	
	/**
	 * Examine all files in table for name 
	 * @param name file name 
	 * @return	if one of file contains name "name" - TRUE, else - FALSE
	 */
	public boolean containsName(String name) {
		Collection<FileDescriptor> col = table.values();
		
		for (FileDescriptor d : col) {
			if (d.getNames().contains(name)) return true;
		}
		
		return false;
	}
	
	/**
	 * Clear table from deleted files (files without names)
	 */
	public void clearTable() {
		Collection<FileDescriptor> col = table.values();
		
		for (FileDescriptor d : col) {
			if (d.isDeleted()) table.remove(d.getId());
		}
	}
	

	/**
	 * Delete file (delete all names from it)
	 * @param name name of deleting file
	 */
	public boolean deleteFile(String name) {		
		Collection<FileDescriptor> col = table.values();
		
		FileDescriptor desc = null;
		
		for (FileDescriptor d : col) {
			if (d.getNames().contains(name)) {
				desc = d;
				break;
			}
		}
		
		if (desc != null) {
			desc.setNames(new HashSet<String>());	
		}
		
		return desc != null;
	}
}
