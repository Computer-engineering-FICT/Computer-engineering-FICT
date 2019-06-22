package kpi.flashfs.control;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;

import kpi.flashfs.iosys.Buffer;
import kpi.flashfs.iosys.LinkNameRecord;
import kpi.flashfs.iosys.Record;
import kpi.flashfs.iosys.TruncRecord;
import kpi.flashfs.iosys.WriteRecord;
import kpi.flashfs.livefile.FileDescriptor;
import kpi.flashfs.livefile.FileTable;
import kpi.flashfs.livefile.PartDescriptor;
import kpi.flashfs.main.Params;

public class Controller {
	private RandomAccessFile file;
	private FileTable table;
	private Buffer buffer;
	
	private int 
		maxVer	= 0, 
		maxFileId = 0;
	
	public Controller(File file) {	
		try {
			this.file = new RandomAccessFile(file, "rw");
		} catch (FileNotFoundException e) {
			System.out.println("mount: I/O problem");
			e.printStackTrace();
		}		
	}
	
	/**
	 * Flash drive mount
	 * @param file	file which emulate flash
	 */
	public void mount () {
		ArrayList<Record> recQueue = new ArrayList<Record>();
		
		for (int i = 0; i < Params.FLASH_SIZE; i++) {	
			processBlock(i, recQueue);
		}
		
		table = new FileTable(recQueue);
		buffer = new Buffer(this.file);
		maxVer++;
		maxFileId++;
	}
	
	/**
	 * Processing of one block (and isolation record in it)
	 * @param blockNum	block number
	 * @param recQueue	result queue of block records
	 * @return	if block is FREE - false, OCCUPY - true
	 */
	private boolean processBlock(int blockNum, ArrayList<Record> recQueue) {
		int i = 0;							//with help of i we process current 
											//position in file
		byte readByte = 0;
		Record tempDesc = null;
		boolean flag = true;
		
		while (i < Params.BLOCK_SIZE-1 && readByte != Record.STOP) {
			try {
				file.seek(blockNum * Params.BLOCK_SIZE + i);
				readByte = file.readByte();
				if (readByte != Record.STOP) {
					tempDesc = readRecord(readByte, blockNum * Params.BLOCK_SIZE + i);
					recQueue.add(tempDesc);
					if (readByte == Record.WRITE) {
						i += ((WriteRecord) tempDesc).getAveralSize();
					} else {
						i += tempDesc.getRecordSize();
					}
				}												
			} catch (IOException e) {
				System.out.println("process block: I/O problem");
				e.printStackTrace();
			}			
		}
		
		//If STOP record in first byte of block -> block is free
		if (readByte == Record.STOP && i == 0) {
			flag = false;
		}
		return flag;
	}
	
	/**
	 * Reading of one record descriptor
	 * @param code	code of descriptor
	 * @return	descriptor with all fields
	 */
	private Record readRecord(byte code, int shift) {
		Record desc = null;
		
		try {
			file.seek(shift + 1); //+1 because code byte has been read already
			int ver 	= file.readInt();
			int fileId 	= file.readInt();			
			
			if (maxVer < ver) 		maxVer = ver;
			if (maxFileId < fileId) maxFileId = fileId;
			
			//========LINK_NAME========
			if (code == Record.LINK_NAME) {
				byte nameLen = file.readByte();				
				
				byte [] nameArr = new byte [nameLen];
				try {
					file.read(nameArr);
				} catch (IOException e) {
					e.printStackTrace();
				}

				StringBuilder str = new StringBuilder();

				for (byte b : nameArr) {
					str.append((char) b);
				}

				String fileName = str.toString();
				
				desc = new LinkNameRecord(ver, fileId, nameLen,	fileName);
				desc.setFlashShift(shift);
			} else
			//===========WRITE=========
			if (code == Record.WRITE) {
				int writeShift	= file.readInt();
				int writeSize 	= file.readInt();
				
				byte[] data = new byte[writeSize];
				
				for (int j = 0; j < writeSize; j++) {
					data[j] = file.readByte();
				}
				
				desc = new WriteRecord(ver, fileId, writeShift,  
						writeSize, data);
				desc.setFlashShift(shift);
			} else
			//===========TRUNC=========
			if (code == Record.TRUNC) {
				int truncNewSize = file.readInt();
				desc = new TruncRecord(ver, fileId, truncNewSize);
				desc.setFlashShift(shift);
			}			
		} catch (IOException e) {
			System.out.println("read record: I/O problem");
			e.printStackTrace();
		}
		
		
		return desc;
	}
	
	/**
	 *	Unmount flash drive 
	 */
	public void unmount() {
		try {
			buffer.flushBuffer();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * File creation
	 * @param name	file name
	 */
	public void create(String name) {
		LinkNameRecord link = new LinkNameRecord(maxVer, maxFileId, 
				(byte) name.length(), name);
		maxVer++;
		maxFileId++;
		ArrayList<Record> arr = buffer.writeRecord(link);
		table.applyRecord(arr.get(0));
	}
	
	/**
	 * Linking name and file
	 * @param id	file ID
	 * @param name	linking name
	 */
	public void link(int id, String name) {
		int currId = table.getFile(id).getId();
		
        LinkNameRecord link = new LinkNameRecord(maxVer, currId, 
                (byte) name.length(), name);
        maxVer++;
        ArrayList<Record> arr = buffer.writeRecord(link);
        table.applyRecord(arr.get(0));		
	}
	
	/**
	 * Unlinking name and file
	 * @param name	unlinking name
	 */
	public void unlink(int id, String name) {
		int currId = table.getFile(id).getId();
		
        LinkNameRecord link = new LinkNameRecord(maxVer, currId, 
                (byte) name.length(), "&" + name);
        maxVer++;
        ArrayList<Record> arr = buffer.writeRecord(link);
        table.applyRecord(arr.get(0));
	}
	
	/** 
	 * Write data to file
	 * @param id	ID of writable file
	 * @param shift	shift of new data from beginning of file  
	 * @param size	size of writable data
	 * @param dat  writable data
	 */
	public void write (int id, int shift, int size, byte[] dat) {
        int currId = table.getFile(id).getId();

        WriteRecord wrt = new WriteRecord(maxVer, currId, shift, size, dat);
        maxVer++;

        ArrayList<Record> arr = buffer.writeRecord(wrt);
        for (Record r : arr) {
        	table.applyRecord(r);
        }        
	}
	
	/**
	 * Read data from file
	 * @param id	ID of readable file
	 * @param shift	shift of data from beginning of file  
	 * @param size	size of readable data
	 * @return		read data
	 */
	public byte[] read(int id, int shift, int size) {
        FileDescriptor desc = table.getFile(id);

        byte [] rez = new byte [size];
        
        ArrayList<PartDescriptor> parts =  desc.read(shift, size);
        int pos = 0;
        for (PartDescriptor p : parts) {
            try {
                file.seek(p.getFlashShift() + 
                		(new WriteRecord(0, 0, 0, 0, null)).getRecordSize());
                for (int i = 0; i < p.getSize(); i++) 
                {
                    rez[pos] = file.readByte();
                    pos++;
                }
            } catch (IOException e) {
                System.out.println("reading file: I/O problem");
                e.printStackTrace();
            }

        }
        
	    return rez;
	}
	
	/**
	 * Truncate of file
	 * @param id		file ID
	 * @param newSize	new file size
	 */
	public void trunc(int id, int newSize) {
		int currId = table.getFile(id).getId();
		
		TruncRecord tr = new TruncRecord(maxVer, currId, newSize);
		maxVer++;
		
		buffer.writeRecord(tr);
		table.applyRecord(tr);
	}
	
	/**
	 * String with information about block
	 * @param num	number of block
	 * @return		block info
	 */
	public String blockstat(int num) {
		ArrayList<Record> recQueue = new ArrayList<Record>();
		StringBuffer buf = new StringBuffer("Block #" + num + "\n");
		if (processBlock(num, recQueue)) {
			
			for (Record r : recQueue) {
				buf.append(r + "\n");
			}
		} else {
			buf.append("FREE\n");
		}		
		
		return buf.toString();
	}
	
	/**
	 * Averal list of files (names)
	 * @return	list of files
	 */
	public String list() {
		return table.toString();
	}
	
	/**
	 * Open file (create system descriptor)
	 * @param name	file name
	 * @return		descriptor
	 */
	public int open(String name) {
		return table.open(name);
	}
	
	/**
	 * Close file (destroy system descriptor)
	 * @param fd	descriptor
	 */
	public void close(int fd) {
		table.close(fd);
	}
	
	/**
	 *    Method for create file which emulates flash. 
	 *    It creates free blocks with block descriptor "FREE".
	 */
	public static void format() {
        try {
            RandomAccessFile file = 
                new RandomAccessFile(Params.FILE_NAME, "rw");
            
            for (int i = 0; i < Params.FLASH_SIZE; i++) {
                file.write(Record.STOP);
                for (int j = 0; j < Params.BLOCK_SIZE - 1; j++) {
                    file.write(0);
                }
            }            
            
            file.close();
            System.out.println("Format: OK");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	public void flushBuffer() {
		buffer.flushBuffer();
	}
	
	public String getFileInfo(int id) {
		return table.getFile(id).toString();
	}
}
