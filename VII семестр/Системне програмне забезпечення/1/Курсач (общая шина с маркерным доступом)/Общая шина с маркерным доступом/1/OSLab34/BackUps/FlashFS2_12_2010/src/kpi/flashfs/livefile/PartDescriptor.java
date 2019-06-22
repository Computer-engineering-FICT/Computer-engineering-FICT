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
