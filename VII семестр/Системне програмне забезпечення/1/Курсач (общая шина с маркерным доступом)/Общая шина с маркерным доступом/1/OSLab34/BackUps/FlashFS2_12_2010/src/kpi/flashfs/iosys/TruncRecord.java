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
			byte code, 
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
}
