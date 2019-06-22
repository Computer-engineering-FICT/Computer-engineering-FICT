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
