package kpi.flashfs.livefile;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import kpi.flashfs.iosys.LinkNameRecord;
import kpi.flashfs.iosys.Record;
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
			
			names.add(link.getLinkFileName());
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
				
				for (PartDescriptor p : parts) {
					rewrite(p, pd, newDescriptors);
				}
				
				parts = newDescriptors;
			}
			

		}
	}
	
	/**
	 * Applying WRITE record. descriptor d comparing with r (new record) ->
	 * d can be transformed if r is lay over it 
	 * @param d	"old" descriptor
	 * @param r	"new" descriptor
	 * @param newDescr	part of file part descriptors sequence
	 */
	private void rewrite(
			PartDescriptor d, 
			PartDescriptor r,
			ArrayList<PartDescriptor> newDescr) 
	{		 
		// new descr
		// old descr
		
		//	       ------ | ------
		//  ------        |         ------
		if ( (d.getFileShift() + d.getSize() < r.getFileShift()) || 
				(d.getFileShift() > r.getFileShift() + r.getSize()))
		{
			newDescr.add(d);
		} else 
			
		//     ------
		//  ------
		if (d.getFileShift() < r.getFileShift() && 
				d.getFileShift() + d.getSize() > r.getFileShift() &&
				d.getFileShift() + d.getSize() < r.getFileShift() + r.getSize()) 
		{
			PartDescriptor newD = new PartDescriptor(
					d.getFileShift(), 
					d.getFlashShift(), 
					r.getFileShift() - d.getFileShift());
			
			newDescr.add(newD);
			newDescr.add(r);
		} else
			
		//     ----
		//  ---------
		if (d.getFileShift() < r.getFileShift() && 
				d.getFileShift() + d.getSize() > r.getFileShift() &&
				d.getFileShift() + d.getSize() > r.getFileShift() + r.getSize()) 
		{
			PartDescriptor newD1 = new PartDescriptor(
					d.getFileShift(), 
					d.getFlashShift(), 
					r.getFileShift() - d.getFileShift());
			PartDescriptor newD2 = new PartDescriptor(
					r.getFileShift() + r.getSize(), 
					r.getFlashShift() + r.getSize(), 
					(d.getFileShift() + d.getSize()) - 
						(r.getFileShift() + r.getSize()) );
			newDescr.add(newD1);
			newDescr.add(r);
			newDescr.add(newD2);
		} else 
			
		//   ------
		//       ------
		if (d.getFileShift() > r.getFileShift() && 
				d.getFileShift() < r.getFileShift() + r.getSize()) 
		{
			PartDescriptor newD = new PartDescriptor(
					r.getFileShift() + r.getSize(), 
					d.getFlashShift() + (r.getFileShift() + 
							r.getSize() - d.getFileShift()), 
					d.getSize() - (r.getFileShift() + 
							r.getSize() - d.getFileShift()));
			
			newDescr.add(newD);
		}
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
		
		while (p.getFileShift() < shift && 
				p.getFileShift() + p.getSize() > shift)
		{
			p = iter.next();
		}

		PartDescriptor pd = new PartDescriptor(
				shift, 
				p.getFlashShift() + (shift - p.getFileShift()), 
				(p.getFileShift() + p.getSize() - shift > size)?size:
					p.getFileShift() + p.getSize() - shift);
		rez.add(pd);
		
		p = iter.next();
		while (p.getFileShift() + p.getSize() < shift + size) {						
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
	
	public String toString() {
		StringBuffer str = new StringBuffer("FILE: id:" + id + " names: ");
		
		for (String nam : names) {
			str.append(nam + " ");
		}				
		
		System.out.println(" Parts: ");
		
		for (PartDescriptor par : parts) {
			str.append("\n\t" + par);
		}
		
		return str.toString();
	}
}
