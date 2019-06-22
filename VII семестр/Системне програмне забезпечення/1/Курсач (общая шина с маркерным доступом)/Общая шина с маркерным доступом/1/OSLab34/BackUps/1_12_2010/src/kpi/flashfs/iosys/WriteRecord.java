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
}
