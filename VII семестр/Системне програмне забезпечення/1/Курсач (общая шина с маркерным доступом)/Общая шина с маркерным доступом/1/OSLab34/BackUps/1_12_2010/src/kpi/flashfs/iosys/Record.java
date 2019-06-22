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
}
