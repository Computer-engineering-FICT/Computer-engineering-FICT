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
		
		VerFileID max = new VerFileID();
		
		buffer = new Buffer(this.file, table);
		
		for (int i = 0; i < Params.FLASH_SIZE; i++) {	
			buffer.processBlock(i, recQueue, max);
		}
		
		table = new FileTable(recQueue);
		buffer.setTable(table);
		maxVer 		= max.maxVer + 1;
		maxFileId 	= max.maxFileId + 1;
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
		int currId = table.getFileBySysID(id).getId();
		
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
		int currId = table.getFileBySysID(id).getId();
		
        LinkNameRecord link = new LinkNameRecord(maxVer, currId, 
                (byte) (name.length() + 1), "&" + name);
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
        int currId = table.getFileBySysID(id).getId();

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
        FileDescriptor desc = table.getFileBySysID(id);

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
		int currId = table.getFileBySysID(id).getId();
		
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
		if (buffer.processBlock(num, recQueue, new VerFileID())) {
			
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
		return table.getFileBySysID(id).toString();
	}
	
	public void clean() {
		buffer.clean();
	}
}

package kpi.flashfs.iosys;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Arrays;

import kpi.flashfs.control.VerFileID;
import kpi.flashfs.livefile.FileDescriptor;
import kpi.flashfs.livefile.FileTable;
import kpi.flashfs.livefile.PartDescriptor;
import kpi.flashfs.main.Params;

public class Buffer {
	public static final byte 
		FREE_BLOCK 		= 0,
		OCCUPY_BLOCK 	= 1;
	
	private RandomAccessFile file;
	
	private ByteArrayOutputStream buffer 	= null;
	private DataOutputStream stream			= null;
	
	//Number of block in which we will flush buffer 
	private int currentBlockNum = 0;
	
	private FileTable table;
	
	public Buffer(RandomAccessFile file, FileTable tabl) {
		this.file = file;
		table = tabl;
		
		cleanBuffer();
		
		currentBlockNum = findFreeBlock();
	}
	
	public static byte[] intoByteString(String str) {
		byte []  rez = new byte[str.length()];	
		for (int i = 0; i < str.length(); i++) {			
			rez[i] = (byte) str.charAt(i);
		}
		return rez;
	}
	
	private int findFreeBlock() {
		int i;
		for (i = 0; i < Params.FLASH_SIZE && 
			getBlockState(i) != FREE_BLOCK; i++) {}
		
		return i;
	}
	
	private void cleanBuffer() {
		buffer = new ByteArrayOutputStream(Params.BLOCK_SIZE);
		stream = new DataOutputStream(buffer);
	}
	
	public void flushBuffer() {	
		try {
			if (stream.size() < Params.BLOCK_SIZE) {
				stream.write(Record.STOP);
			}
			byte [] tempArr = buffer.toByteArray();
			file.seek(currentBlockNum * Params.BLOCK_SIZE);
			file.write(tempArr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		cleanBuffer();
		
		currentBlockNum = findFreeBlock();
		
		//TODO: write cleaner integration
	}
	
	/**
	 * Process of writing data to flash (throw buffer)
	 * @param rec	writing record
	 * @return	array of successfully wrote records
	 */
	public ArrayList<Record> writeRecord(Record rec) {
		ArrayList<Record> rezList = new ArrayList<Record>();
		try {
			//If we havn't enough space for record in the end of buffer -
			//flush buffer
			if (Params.BLOCK_SIZE - stream.size() < rec.getRecordSize()) {
				flushBuffer();
			}

			if (rec.getCode() != Record.WRITE) {
				//If it's LINK_NAME or TRUNC (no data)
				rec.setFlashShift(Params.BLOCK_SIZE * currentBlockNum + 
						stream.size());
				stream.write(rec.getByteView());
				rezList.add(rec);
			} else {
				//If it's WRITE (with data)
				WriteRecord wrt = (WriteRecord) rec;							
				
				//if we can't write at least 1 byte of data - request for 
				//new block
				if (Params.BLOCK_SIZE - stream.size() < wrt.getRecordSize() + 1) {
					flushBuffer();
				}

				int freeSpsInBlock = Params.BLOCK_SIZE - stream.size();
				
				//If not enough space in current block - fill current block to 
				//the end, and write to next free block
				if (freeSpsInBlock >= wrt.getAveralSize()) {
					wrt.setFlashShift(Params.BLOCK_SIZE * currentBlockNum + 
						stream.size());
					rezList.add(wrt);
					stream.write(wrt.getByteView());
					stream.write(wrt.getData());				
				} else {
					WriteRecord clone = wrt.clone();
					
					//int currentShift = initialShift, 
					//	currentSize = initialSize;
					
					int recorded = freeSpsInBlock - wrt.getRecordSize();															
					clone.setWriteSize(recorded);
					clone.setFlashShift(currentBlockNum * Params.BLOCK_SIZE +
							stream.size()); 
					stream.write(clone.getByteView());
					stream.write(clone.getData(), 0, recorded);
					
					rezList.add(clone);
					
					flushBuffer();
					
					while ((wrt.getWriteSize() - recorded + wrt.getRecordSize()) 
							/ Params.BLOCK_SIZE >= 1) {
						clone = wrt.clone();
						clone.setWriteShift(wrt.getWriteShift() + recorded);								
						clone.setWriteSize(Params.BLOCK_SIZE - 
								wrt.getRecordSize());
						
						clone.setFlashShift(currentBlockNum * Params.BLOCK_SIZE +
								stream.size()); 
						stream.write(clone.getByteView());
						stream.write(clone.getData(), recorded,
								Params.BLOCK_SIZE -	wrt.getRecordSize());
						
						rezList.add(clone);
						recorded += (Params.BLOCK_SIZE - wrt.getRecordSize());
						flushBuffer(); 
					}
					
					if (wrt.getWriteSize() - recorded > 0) {
						clone = wrt.clone();
						
						clone.setWriteShift(wrt.getWriteShift() + recorded);								
						clone.setWriteSize(wrt.getWriteSize() - recorded);
						clone.setFlashShift(currentBlockNum * Params.BLOCK_SIZE +
								stream.size()); 
						stream.write(clone.getByteView());
						stream.write(clone.getData(), recorded, 
						        wrt.getWriteSize() - recorded);
						
						rezList.add(clone);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return rezList;
	}
	
	/**
	 * Processing of one block (and isolation record in it)
	 * @param blockNum	block number
	 * @param recQueue	result queue of block records
	 * @return	if block is FREE - false, OCCUPY - true
	 */
	public boolean processBlock(
			int blockNum, 
			ArrayList<Record> recQueue, 
			VerFileID max) 
	{
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
					tempDesc = readRecord(readByte, 
							blockNum * Params.BLOCK_SIZE + i, max);
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
	 * @param shift	shift of record
	 * @param max 	max of ver and fileID fields
	 * @return	descriptor with all fields
	 */
	private Record readRecord(byte code, int shift, VerFileID max) {
		Record desc = null;
		
		try {
			file.seek(shift + 1); //+1 because code byte has been read already
			int ver 	= file.readInt();
			int fileId 	= file.readInt();			
			
			if (max.maxVer < ver) 		max.maxVer = ver;
			if (max.maxFileId < fileId) max.maxFileId = fileId;
			
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
	 * Discover state of block
	 * @param num	block number
	 * @return		state of block (FREE_BLOCK / OCCUPY_BLOCK)
	 */
	public byte getBlockState(int num) {		
		byte rez = OCCUPY_BLOCK;
		try {
			file.seek(num * Params.BLOCK_SIZE);
			byte readByte = file.readByte();
			if (readByte == Record.STOP) {
				rez = FREE_BLOCK;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return rez;
	}
	
	/**
	 * Implementation of cleaning block mechanism. Mark blocks which contains
	 * outdated information as FREE blocks 
	 */
	public void clean() {
		flushBuffer();
		for (int i = 0; i < Params.FLASH_SIZE; i++) {	
			ArrayList<Record> recQueue = new ArrayList<Record>();
			boolean flag = processBlock(i, recQueue, new VerFileID());	

			//if block isn't aready free
			if (flag) {
				boolean dirty = false;
				
				ArrayList<Record> rezQueue = new ArrayList<Record>();;
				
				for (Record rec : recQueue) {
					ArrayList<Record> tempQueue = new ArrayList<Record>();
					boolean tempBool = getActualRec(rec, tempQueue);
					
					if (tempBool && !dirty) dirty = true; 
					
					rezQueue.addAll(tempQueue);
				}
				
				if (dirty) {
					if (rezQueue.size() != 0) {
						for (Record r : rezQueue) {
					        ArrayList<Record> arr = writeRecord(r);
					        for (Record rr : arr) {
					        	table.applyRecord(rr);
					        }        
						}						
					}
					
					try {
						file.seek(i * Params.BLOCK_SIZE);
						file.writeByte(Record.STOP);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}							
		}
	}
	
	/**
	 * Test rec.
	 * @param rec		testing record
	 * @param rezQueue	rezult queue
	 * @return			if dirty - TRUE
	 */
	private boolean getActualRec(Record rec, ArrayList<Record> rezQueue) {
		FileDescriptor desc = table.getFileByID(rec.getFileId());
		
		if (!desc.isDeleted()) {
			if (rec.getCode() == Record.LINK_NAME) {
				LinkNameRecord link = (LinkNameRecord) rec;
				
				if (desc.getNames().contains(link.getLinkFileName())) {
					rezQueue.add(rec);
					return false;
				} else {
					return true;
				}
			}

			if (rec.getCode() == Record.TRUNC) {
				return true;
			}
			
			if (rec.getCode() == Record.WRITE) {
				WriteRecord wrt = (WriteRecord) rec;
				
				boolean flag = false;
				
				for (PartDescriptor p : desc.getParts()) {
					if (p.getFileShift() == wrt.getWriteShift() &&
							p.getFileShift() + p.getSize() == 
							wrt.getWriteShift() + wrt.getWriteSize() &&
							p.getFlashShift() == wrt.getFlashShift()
					) 
					{
						rezQueue.add(wrt);
					} else
					
					//      ----
					//  -----------
					if (p.getFileShift() >= wrt.getWriteShift() &&
							p.getFileShift() + p.getSize() <= 
							wrt.getWriteShift() + wrt.getWriteSize()) 
					{
						if (p.getFlashShift() == wrt.getFlashShift() + 
								p.getFileShift() - wrt.getWriteShift())
						{
							WriteRecord clone = wrt.clone();
							
							clone.setWriteShift(p.getFileShift());
							clone.setWriteSize(p.getSize());
							clone.setData(Arrays.copyOfRange(wrt.getData(), 
									p.getFileShift() - wrt.getWriteShift(), 
									p.getFileShift() - wrt.getWriteShift() + 
									p.getSize()));
							
							rezQueue.add(clone);
							flag = true;
						}
					}
				}		
				return flag;
			}						
		}
		return true;		
	}
	
	public void setTable(FileTable tabl) {
		table = tabl;
	}
	
	public static String byteArrToHexStr(byte[] dat) {
	    StringBuffer buf = new StringBuffer();
		
	    for (int i = 0; i < dat.length; i++) {
	    	String str = Integer.toHexString(dat[i]);
	    	str = (str.length() > 2) ? str.substring(str.length()-2) : str;
	    	buf.append(str + " ");
	    }
		
		return buf.toString();
	}
}

package kpi.flashfs.iosys;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;

/**
 *	LinkName descriptor. If field starts with '&' character - it's unlink record
 * 	Type		Code	Fields
 * 	Link name	0x1D	code ver fileId	nameLen fileName
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class LinkNameRecord extends Record { 
	//File name
	private String linkFileName;
	//Length of file name
	private byte linkNameLen = 0;
	
	public LinkNameRecord(
			int ver, 
			int fileId,
			byte nameLen,
			String fileName) 
	{
		super(LINK_NAME, ver, fileId);
		linkFileName 	= fileName;
		linkNameLen		= nameLen;
	}

	@Override
	public int getRecordSize() {
		return BASE_SIZE + 1 + linkNameLen;
	}
	
	@Override
	public byte[] getByteView() {
		ByteArrayOutputStream rez = new ByteArrayOutputStream();
		DataOutputStream stream = new DataOutputStream(rez);
		
		try {
			stream.writeByte(code);
			stream.writeInt(ver);
			stream.writeInt(fileId);
			stream.writeByte(linkNameLen);
			stream.write(Buffer.intoByteString(linkFileName));			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return rez.toByteArray();
	}
	
	public String getLinkFileName() {
		return linkFileName;
	}
	public void setLinkFileName(String fileName) {
		this.linkFileName = fileName;
	}
	public byte getLinkNameLen() {
		return linkNameLen;
	}
	public void setLinkNameLen(byte nameLen) {
		this.linkNameLen = nameLen;
	}
	
	public String toString() {
		return "LINK: \t" + super.toString() + "\tfileName: " + linkFileName;
	}
}

package kpi.flashfs.iosys;

/**
 * Record of meta information.
 * Record types:
 * 	Type		Code	Fields
 * 	Link name	0x1D	code ver fileId	nameLen fileName
 * 	Trunc		0x2D	code ver fileId newSize
 * 	Write		0x3D	code ver fileId shift size
 * 	Stop		0xFF	This descriptor mark the end of data in block
 * 
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public abstract class Record {  
	public static final byte
	    LINK_NAME   =(byte) 0x1D,
	    TRUNC       =(byte) 0x2D,
	    WRITE       =(byte) 0x3D,
	    STOP       	=(byte) 0xFF;
	
	//Size of descriptor with field code, ver, fileId in bytes
	protected static final int BASE_SIZE = 9;
	
	//==================Common fields==================
	//Type of record
	protected byte	code;
	//Records version
	protected int 	ver;
	//File ID of this record
	protected int 	fileId;
	//Shift of record on the flash
	protected int flashShift;
    
    /**
     * @param code			Type of descriptor
     * @param ver			Descriptors version
     * @param fileId		File ID of this descriptor
     * @param flashShift	Shift of record on flash	
     */
    public Record(byte code, int ver, int fileId) {
		this.code = code;
		this.ver = ver;
		this.fileId = fileId;
	}
        
    public int getVer() {
		return ver;
	}

	public void setVer(int ver) {
		this.ver = ver;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public byte getCode() {
		return code;
	}
		
	public int getFlashShift() {
		return flashShift;
	}

	public void setFlashShift(int flashShift) {
		this.flashShift = flashShift;
	}

	//================================================
	public abstract int getRecordSize();
	public abstract byte[] getByteView();
	
	public String toString() {
		return "ver= " + ver + "\tfileId= " + fileId; 
	}
}

package kpi.flashfs.iosys;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;

/**
 * Trunc descriptor
 * 	Type		Code	Fields
 * 	Trunc		0x2D	code ver fileId newSize
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class TruncRecord extends Record {
	//New file size
	private int truncNewSize;
	
	public TruncRecord(
			int ver, 
			int fileId, 
			int newSize) 
	{
		super(TRUNC, ver, fileId);
		truncNewSize = newSize;
	}

	@Override
	public int getRecordSize() {
		return BASE_SIZE + 4;
	}

	@Override
	public byte[] getByteView() {
		ByteArrayOutputStream rez = new ByteArrayOutputStream();
		DataOutputStream stream = new DataOutputStream(rez);
		
		try {
			stream.writeByte(code);
			stream.writeInt(ver);
			stream.writeInt(fileId);
			stream.writeInt(truncNewSize);			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return rez.toByteArray();
	}
	
    public int getTruncNewSize() {
		return truncNewSize;
	}

	public void setTruncNewSize(int newSize) {
		this.truncNewSize = newSize;
	}
	
	public String toString() {
		return "TRUNC: \t" + super.toString() + "\tnewSize= " + truncNewSize;
	}
}

package kpi.flashfs.iosys;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;

/**
 *	Write descriptor
 * 	Type		Code	Fields
 * 	Write		0x3D	code ver fileId shift size
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class WriteRecord extends Record {
	//Shift of data block, from begining of file
	private int writeShift;
	//Size of data block
	private int writeSize;
	//Data
	private byte[] data;
	
	public WriteRecord( 
			int ver, 
			int fileId,
			int shift,
			int size, 
			byte[] dat) 
	{
		super(WRITE, ver, fileId);
		writeShift 	= shift;
		writeSize 	= size;
		data = dat;
	}

	@Override
	public int getRecordSize() {
		return BASE_SIZE + 8;
	}

	@Override
	public byte[] getByteView() {
		ByteArrayOutputStream rez = new ByteArrayOutputStream();
		DataOutputStream stream = new DataOutputStream(rez);
		
		try {
			stream.writeByte(code);
			stream.writeInt(ver);
			stream.writeInt(fileId);
			stream.writeInt(writeShift);
			stream.writeInt(writeSize);			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return rez.toByteArray();
	}
	
	public WriteRecord clone() {
		return new WriteRecord(ver, fileId, writeShift, writeSize, 
				data);
	}
	
	public int getAveralSize() {
		return BASE_SIZE + 8 + writeSize;
	}
	
	public int getWriteShift() {
		return writeShift;
	}

	public void setWriteShift(int shift) {
		this.writeShift = shift;
	}

	public int getWriteSize() {
		return writeSize;
	}

	public void setWriteSize(int size) {
		this.writeSize = size;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}
	
	public String toString() {
		return "WRITE: \t" + super.toString() + "\tfile sh= " + writeShift +
			"\tflash sh= " + flashShift  + "\nData:\n" + 
			Buffer.byteArrToHexStr(data);
	}
}

package kpi.flashfs.livefile;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
    				
				    if (!flag) {
				    	newDescriptors.add(pd);
				    	
				    	Collections.sort(newDescriptors, new Comparator<PartDescriptor>() {

							@Override
							public int compare(PartDescriptor o1,
									PartDescriptor o2) {
								return o1.getFileShift() - o2.getFileShift();
							}
						});
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
				d.getFileShift() + d.getSize() >= r.getFileShift() &&
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
					d.getFlashShift() +  r.getSize(), 
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

package kpi.flashfs.livefile;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;

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
}

package kpi.flashfs.livefile;

public class PartDescriptor {
	private int fileShift,
				flashShift,
				size;

	public PartDescriptor(int fileShift, int flashShift, int size) {
		this.fileShift = fileShift;
		this.size = size;
		this.flashShift = flashShift;
	}

	public int getFileShift() {
		return fileShift;
	}

	public void setFileShift(int fileShift) {
		this.fileShift = fileShift;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getFlashShift() {
		return flashShift;
	}

	public void setFlashShift(int flashShift) {
		this.flashShift = flashShift;
	}
	
	public String toString() {
		return "File sh=" + fileShift + " Flash sh=" + flashShift + 
			" size=" + size;
	}
}

package kpi.flashfs.main;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

import kpi.flashfs.iosys.Record;

/**
 *    Class for create file which emulates flash. It creates free blocks with 
 *    block descriptor "FREE".
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class FlashFormat {   
    /**
     * @param args
     */
    public static void main(String[] args) {
        try {
            RandomAccessFile file = new RandomAccessFile("flash.dat", "rw");
            
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

}

package kpi.flashfs.main;

import java.io.File;
import java.util.Scanner;

import kpi.flashfs.control.Controller;
import kpi.flashfs.iosys.Buffer;

public class Main {
	
	public static void create(Controller c) {
		System.out.println("Input file name:");
		Scanner scan = new Scanner(System.in);
		String name = scan.nextLine();
		c.create(name);
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("|FLASH|");
		System.out.println("1. Mount");
		System.out.println("2. Format");
		System.out.println("0. Exit");
		
		Controller control = new Controller(new File(Params.FILE_NAME));
		
		Scanner scan = new Scanner(System.in);
		int c = -1;
		while (c != 0 && c != 1) {			
			c = scan.nextInt();
			switch (c) {
			case 0: break;
			case 1:
				control.mount();				
				break;
			case 2:
				Controller.format();
				break;
		
			default:
				System.out.println("Illegal choise. Try again:");
				break;
			}
		}						
		
		if (c == 1) {
		System.out.println("File " + Params.FILE_NAME + " mounted");
				
		int choise = 1;
		while (choise != 0) {
			System.out.println("Make choise:");
			System.out.println("1. Create file");
			System.out.println("2. List");
			System.out.println("3. Open");
			System.out.println("4. Close");
			System.out.println("5. Write");
			System.out.println("6. Read");
			System.out.println("7. Blockstat");
			System.out.println("8. Link");
			System.out.println("9. Unlink");
			System.out.println("10. Trunc");
			System.out.println("11. Forse cleaning");
			System.out.println("12. Forse flush");
			System.out.println("0. Exit");
			
			choise = scan.nextInt();
			switch (choise) {
			case 0: break;
			case 1:
				create(control);
				break;
			case 2:
				System.out.println(control.list());
				break;
			case 3:
				open(control);
				break;				
			case 4:
				close(control);
				break;
			case 5:
				write(control);
				break;
			case 6:
				read(control);
				break;
			case 7:
				blockstat(control);
				break;				
			case 8:
				link(control);
				break;				
			case 9:
				unlink(control);
				break;
			case 10:
				trunc(control);
				break;
			case 11:
				control.clean();
				break;
			case 12:
				control.flushBuffer();
				break;
				
			default:
				System.out.println("Illegal choise. Try again:");
				break;
			}
		}
		
		control.unmount();
		System.out.println("OK");
		}
	}
	
	private static void trunc(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		System.out.println("Input new size:");
		int newSize = scan.nextInt();
		control.trunc(id, newSize);
		System.out.println(control.getFileInfo(id));
	}
	
	private static void unlink(Controller control) {
		Scanner scan = new Scanner(System.in);
		System.out.println("Input file ID:");		
		int id = scan.nextInt();
		System.out.println("Input unlinking name:");
		scan.nextLine();
		String name = scan.nextLine();
		control.unlink(id, name);
	}
	
	private static void link(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		System.out.println("Input linking name:");
		scan.nextLine();
		String name = scan.nextLine();
		control.link(id, name);		
	}
	
	private static void blockstat(Controller control) {
		System.out.println("Input block num (-1 for all blocks):");
		Scanner scan = new Scanner(System.in);
		int num = scan.nextInt();
		if (num >= 0) {
			System.out.println(control.blockstat(num));				
		} else {
			for (int i = 0; i < Params.FLASH_SIZE; i++) {
				System.out.println(control.blockstat(i));
			}
		}		
	}
	
	private static void read(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		System.out.println("Input shift:");
		int shift = scan.nextInt();
		System.out.println("Input size:");
		int size = scan.nextInt();
		byte[] data = control.read(id, shift, size);
		System.out.println(Buffer.byteArrToHexStr(data));
	}
	
	private static void write(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		System.out.println("Input shift:");
		int shift = scan.nextInt();
		System.out.println("Input data: ");
		scan.nextLine();
		String data = scan.nextLine();
		
		if (data.length() > 0) {
			control.write(id, shift, data.length(), Buffer.intoByteString(data));
		}
		
		System.out.println(control.getFileInfo(id));
	}
	
	private static void close(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		control.close(id);
	}
	
	private static void open(Controller control) {
		System.out.println("Input file name:");
		Scanner scan = new Scanner(System.in);
		String name = scan.nextLine();
		System.out.println("SysID: " + control.open(name));
	}
}

package kpi.flashfs.main;

import java.io.File;
import java.util.Scanner;

import kpi.flashfs.control.Controller;
import kpi.flashfs.iosys.Buffer;

public class Main {
	
	public static void create(Controller c) {
		System.out.println("Input file name:");
		Scanner scan = new Scanner(System.in);
		String name = scan.nextLine();
		c.create(name);
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("|FLASH|");
		System.out.println("1. Mount");
		System.out.println("2. Format");
		System.out.println("0. Exit");
		
		Controller control = new Controller(new File(Params.FILE_NAME));
		
		Scanner scan = new Scanner(System.in);
		int c = -1;
		while (c != 0 && c != 1) {			
			c = scan.nextInt();
			switch (c) {
			case 0: break;
			case 1:
				control.mount();				
				break;
			case 2:
				Controller.format();
				break;
		
			default:
				System.out.println("Illegal choise. Try again:");
				break;
			}
		}						
		
		if (c == 1) {
		System.out.println("File " + Params.FILE_NAME + " mounted");
				
		int choise = 1;
		while (choise != 0) {
			System.out.println("Make choise:");
			System.out.println("1. Create file");
			System.out.println("2. List");
			System.out.println("3. Open");
			System.out.println("4. Close");
			System.out.println("5. Write");
			System.out.println("6. Read");
			System.out.println("7. Blockstat");
			System.out.println("8. Link");
			System.out.println("9. Unlink");
			System.out.println("10. Trunc");
			System.out.println("11. Forse cleaning");
			System.out.println("12. Forse flush");
			System.out.println("0. Exit");
			
			choise = scan.nextInt();
			switch (choise) {
			case 0: break;
			case 1:
				create(control);
				break;
			case 2:
				System.out.println(control.list());
				break;
			case 3:
				open(control);
				break;				
			case 4:
				close(control);
				break;
			case 5:
				write(control);
				break;
			case 6:
				read(control);
				break;
			case 7:
				blockstat(control);
				break;				
			case 8:
				link(control);
				break;				
			case 9:
				unlink(control);
				break;
			case 10:
				trunc(control);
				break;
			case 11:
				control.clean();
				break;
			case 12:
				control.flushBuffer();
				break;
				
			default:
				System.out.println("Illegal choise. Try again:");
				break;
			}
		}
		
		control.unmount();
		System.out.println("OK");
		}
	}
	
	private static void trunc(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		System.out.println("Input new size:");
		int newSize = scan.nextInt();
		control.trunc(id, newSize);
		System.out.println(control.getFileInfo(id));
	}
	
	private static void unlink(Controller control) {
		Scanner scan = new Scanner(System.in);
		System.out.println("Input file ID:");		
		int id = scan.nextInt();
		System.out.println("Input unlinking name:");
		scan.nextLine();
		String name = scan.nextLine();
		control.unlink(id, name);
	}
	
	private static void link(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		System.out.println("Input linking name:");
		scan.nextLine();
		String name = scan.nextLine();
		control.link(id, name);		
	}
	
	private static void blockstat(Controller control) {
		System.out.println("Input block num (-1 for all blocks):");
		Scanner scan = new Scanner(System.in);
		int num = scan.nextInt();
		if (num >= 0) {
			System.out.println(control.blockstat(num));				
		} else {
			for (int i = 0; i < Params.FLASH_SIZE; i++) {
				System.out.println(control.blockstat(i));
			}
		}		
	}
	
	private static void read(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		System.out.println("Input shift:");
		int shift = scan.nextInt();
		System.out.println("Input size:");
		int size = scan.nextInt();
		byte[] data = control.read(id, shift, size);
		System.out.println(Buffer.byteArrToHexStr(data));
	}
	
	private static void write(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		System.out.println("Input shift:");
		int shift = scan.nextInt();
		System.out.println("Input data: ");
		scan.nextLine();
		String data = scan.nextLine();
		
		if (data.length() > 0) {
			control.write(id, shift, data.length(), Buffer.intoByteString(data));
		}
		
		System.out.println(control.getFileInfo(id));
	}
	
	private static void close(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		control.close(id);
	}
	
	private static void open(Controller control) {
		System.out.println("Input file name:");
		Scanner scan = new Scanner(System.in);
		String name = scan.nextLine();
		System.out.println("SysID: " + control.open(name));
	}
}

