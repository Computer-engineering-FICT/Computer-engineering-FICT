package kpi.flashfs.livefile;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import kpi.flashfs.iosys.LinkNameRecord;
import kpi.flashfs.iosys.Record;
import kpi.flashfs.iosys.TruncRecord;
import kpi.flashfs.iosys.WriteRecord;

public class FileDescriptor {
	//File identifier
	private int id;
	//File names
	private HashSet<String> names;
	//File parts descriptors
	private ArrayList<PartDescriptor> parts;
	//System ID (for open() and close()). if value -1 - file isn't open
	private int sysId;
	
	public FileDescriptor(int id) {
		this.id = id;
		parts = new ArrayList<PartDescriptor>();
		names = new HashSet<String>();
		sysId = -1;
	}
	
	public void addName(String name) {
		names.add(name);
	}
	
	public void applyDescriptor(Record rec) {
		if (rec.getCode() == Record.LINK_NAME) {
			LinkNameRecord link = (LinkNameRecord) rec;
			
			//If name starts with '&' character - it's unlink record
			if (link.getLinkFileName().charAt(0) != '&') {
				names.add(link.getLinkFileName());
			} else {
				if (names.contains(link.getLinkFileName().substring(1))) {
					names.remove(link.getLinkFileName().substring(1));
				}
			}
		}
		
		if (rec.getCode() == Record.WRITE) {
			WriteRecord wrt = (WriteRecord) rec;
			
			PartDescriptor pd = new PartDescriptor(wrt.getWriteShift(), 
					wrt.getFlashShift(), wrt.getWriteSize());						
			
			if (parts.size() == 0) {
				parts.add(pd);
			} else {
				ArrayList<PartDescriptor> newDescriptors = 
					new ArrayList<PartDescriptor>();
				
				//if this record only append this file in the end
				// we simply add it to the end of parts list
				if (parts.get(parts.size()-1).getFileShift() +
				        parts.get(parts.size()-1).getSize() > pd.getFileShift()) {
				    boolean flag = false,
				            tempBool;
				    
				    for (PartDescriptor p : parts) {
    					tempBool = rewrite(p, pd, newDescriptors, flag);
    					if (!flag && tempBool) flag = true;
    				}
    				
    				parts = newDescriptors;
				} else {
				    parts.add(pd);
				}
			}
		}
		
		if (rec.getCode() == Record.TRUNC) {
			TruncRecord tr = (TruncRecord) rec;
			
			Iterator<PartDescriptor> iter = parts.iterator();
			
			if (parts.size() > 0) {
				PartDescriptor p = iter.next();
				while (iter.hasNext() && 
						p.getFileShift() + p.getSize() <= tr.getTruncNewSize()) {
					p = iter.next();
				}
				
				if (p.getFileShift() + p.getSize() > tr.getTruncNewSize()) {
					p.setSize(p.getSize() - (p.getFileShift() + p.getSize() 
							- tr.getTruncNewSize()));
				}
				
				while (iter.hasNext()) {
					iter.next();
					iter.remove();
				}
			}
			
			
		}
	}
	
	/**
	 * Applying WRITE record. descriptor d comparing with r (new record) ->
	 * d can be transformed if r is lay over it 
	 * @param d	"old" descriptor
	 * @param r	"new" descriptor
	 * @param newDescr	part of file part descriptors sequence
	 * @param recorded if r record already recorded
	 * @return if r had been recorded - true
	 */
	private boolean rewrite(
			PartDescriptor d, 
			PartDescriptor r,
			ArrayList<PartDescriptor> newDescr,
			boolean recorded) 
	{		 
		boolean rez = false;
	    // new descr
		// old descr
		
		//	       ------ | ------
		//  ------        |         ------
		if ( (d.getFileShift() + d.getSize() <= r.getFileShift()) || 
				(d.getFileShift() >= r.getFileShift() + r.getSize()))
		{
			newDescr.add(d);
		} else 
			
		//     ------
		//  ------
		if (d.getFileShift() < r.getFileShift() && 
				d.getFileShift() + d.getSize() > r.getFileShift() &&
				d.getFileShift() + d.getSize() <= r.getFileShift() + r.getSize()) 
		{
			PartDescriptor newD = new PartDescriptor(
					d.getFileShift(), 
					d.getFlashShift(), 
					r.getFileShift() - d.getFileShift());
			
			newDescr.add(newD);
			if (!recorded) {
			    newDescr.add(r);
			    rez = true;
			}			
		} else
			
		//     ----
		//  ---------
		if (d.getFileShift() < r.getFileShift() && 
				d.getFileShift() + d.getSize() > r.getFileShift() + r.getSize()) 
		{
			PartDescriptor newD1 = new PartDescriptor(
					d.getFileShift(), 
					d.getFlashShift(), 
					r.getFileShift() - d.getFileShift());
			PartDescriptor newD2 = new PartDescriptor(
					r.getFileShift() + r.getSize(), 
					d.getFlashShift() + r.getFileShift() + r.getSize(), 
					(d.getFileShift() + d.getSize()) - 
						(r.getFileShift() + r.getSize()) );
			newDescr.add(newD1);
            if (!recorded) {
                newDescr.add(r);
                rez = true;
            }           
			newDescr.add(newD2);
		} else 
			
		//   ------
		//       ------
		if (d.getFileShift() >= r.getFileShift() && 
		        d.getFileShift() + d.getSize() > r.getFileShift() + r.getSize() &&
				d.getFileShift() < r.getFileShift() + r.getSize()) 
		{
			PartDescriptor newD = new PartDescriptor(
					r.getFileShift() + r.getSize(), 
					d.getFlashShift() + (r.getFileShift() + 
							r.getSize() - d.getFileShift()), 
					d.getSize() - (r.getFileShift() + 
							r.getSize() - d.getFileShift()));
			
            if (!recorded) {
                newDescr.add(r);
                rez = true;
            }           
			newDescr.add(newD);
		} else
		    
		//  -------------
		//     ------
		if (d.getFileShift() >= r.getFileShift() &&
		        d.getFileShift() + d.getSize() <= r.getFileShift() + r.getSize()) {
            if (!recorded) {
                newDescr.add(r);
                rez = true;
            }           
		}
		
		return rez;
	}
	
	/**
	 * File reading 
	 * @param shift	start reading position
	 * @param size	size of reading data
	 * @return	array which contains part where parts of required data are 
	 * situated. Block sorting - increasing shift
	 */
	public ArrayList<PartDescriptor> read(int shift, int size) {
		ArrayList<PartDescriptor> rez = new ArrayList<PartDescriptor>();
		
		Iterator<PartDescriptor> iter = parts.iterator();
		PartDescriptor p = iter.next();
		
		while (!(p.getFileShift() <= shift && 
				p.getFileShift() + p.getSize() >= shift) && iter.hasNext())
		{
			p = iter.next();
		}

		PartDescriptor pd = new PartDescriptor(
				shift, 
				p.getFlashShift() + (shift - p.getFileShift()), 
				(p.getFileShift() + p.getSize() - shift > size)?size:
					p.getFileShift() + p.getSize() - shift);
		rez.add(pd);
		
		if (iter.hasNext()) {
			p = iter.next();
			while (p.getFileShift() + p.getSize() < shift + size && iter.hasNext()) {						
				rez.add(p);
				p = iter.next();
			}
					
			if (p.getFileShift() < shift + size) {
				pd = new PartDescriptor(
						p.getFileShift(),
						p.getFlashShift(), 
						shift + size - p.getFileShift());
				rez.add(pd);
			}
		}
		
		return rez;
	}
		
	//===========Getters/setters zone================
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public HashSet<String> getNames() {
		return names;
	}

	public void setNames(HashSet<String> names) {
		this.names = names;
	}

	public ArrayList<PartDescriptor> getParts() {
		return parts;
	}

	public void setParts(ArrayList<PartDescriptor> parts) {
		this.parts = parts;
	}

	public int getSysID() {
		return sysId;
	}

	public void setSysID(int sysId) {
		this.sysId = sysId;
	}
	
	public int getFileSize() {
		int rez = 0;
		
		for (PartDescriptor p : parts) {
			rez += p.getSize();
		}
		
		return rez;
	}
	
	public boolean isDeleted() {
		return names.size() == 0;
	}
	
	public String toString() {
		StringBuffer str = new StringBuffer("FILE: id:" + id + " names: ");
		
		for (String nam : names) {
			str.append(nam + " ");
		}				
		
		str.append(" Size = " + getFileSize());
		
		for (PartDescriptor par : parts) {
			str.append("\n\t" + par);
		}
		
		return str.toString();
	}
}
