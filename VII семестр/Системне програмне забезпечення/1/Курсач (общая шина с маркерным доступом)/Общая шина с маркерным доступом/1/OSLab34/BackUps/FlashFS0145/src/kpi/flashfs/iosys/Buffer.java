package kpi.flashfs.iosys;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;

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
	
	public Buffer(RandomAccessFile file) {
		this.file = file;

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
		try {
			for (int i = 0; i < Params.FLASH_SIZE; i++) {	
					file.seek(i * Params.BLOCK_SIZE);
					
					
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

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
