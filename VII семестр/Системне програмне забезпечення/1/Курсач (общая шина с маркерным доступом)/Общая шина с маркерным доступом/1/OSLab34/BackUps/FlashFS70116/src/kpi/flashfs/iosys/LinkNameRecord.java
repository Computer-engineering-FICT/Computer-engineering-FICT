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
