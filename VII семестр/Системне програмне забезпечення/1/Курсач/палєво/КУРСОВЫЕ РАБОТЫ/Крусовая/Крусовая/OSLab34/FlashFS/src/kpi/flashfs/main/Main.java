package kpi.flashfs.main;

import java.io.File;
import java.util.Scanner;

import kpi.flashfs.control.Controller;
import kpi.flashfs.iosys.Buffer;
import kpi.flashfs.iosys.LinkNameRecord;
import kpi.flashfs.iosys.Record;
import kpi.flashfs.iosys.TruncRecord;

public class Main {	
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
				if (control.getFreeBlockCount() <= Params.REQ_FREE_BLOCKS_COUNT) 
				{
					control.clean();
					
					if (control.getFreeBlockCount() <= Params.REQ_FREE_BLOCKS_COUNT) {
						System.out.println("Isn't free space on flash. " +
						"Delete one of files:");
						System.out.println(control.list());

						System.out.println("Input file name:");
						scan = new Scanner(System.in);
						scan.nextLine();
						String name = scan.nextLine();

						control.deleteFile(name);
						control.clean();
					}
				} else {			
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
					System.out.println("13. Delete file");
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
					case 13:
						deleteFile(control);
						break;						
						
					default:
						System.out.println("Illegal choise. Try again:");
						break;
					}
				}			
			}
			
			control.unmount();
			System.out.println("OK");
		}
	}
	
	private static boolean isEnoughSpace(Record rec, Controller control) {
		if (rec.getRecordSize() <= control.getFreeBufSize()) {
			return true;
		} else {
			System.out.println("Not enough space");
			return false;
		}
	}
	
	private static void deleteFile(Controller control) {
		System.out.println("Input file name:");
		Scanner scan = new Scanner(System.in);
		String name = scan.nextLine();
		control.deleteFile(name);
		
		control.clean();
	}
	
	public static void create(Controller control) {				
		System.out.println("Input file name:");
		Scanner scan = new Scanner(System.in);
		String name = scan.nextLine();
		
		if (!control.containsName(name)) {
			if (!isEnoughSpace(new LinkNameRecord(0, 0, (byte) name.length(), 
					name), control)) {
				return;
			}
			
			control.create(name);
		} else {
			System.out.println("File with this name already exist");
		}		
	}
	
	private static void trunc(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		
		boolean fl = control.fileExist(id);
		
		if (!isEnoughSpace(new TruncRecord(0, 0, 0), control)) {
			return;
		}
		
		if (fl) {
			System.out.println("Input new size:");
			int newSize = scan.nextInt();
			control.trunc(id, newSize);
			System.out.println(control.getFileInfo(id));
		} else {
			System.out.println("File with this ID doesn't exist");
		}
	}
	
	private static void unlink(Controller control) {
		Scanner scan = new Scanner(System.in);
		System.out.println("Input file ID:");		
		int id = scan.nextInt();
		
		boolean fl = control.fileExist(id);
		
		if (fl) {
			System.out.println("Input unlinking name:");
			scan.nextLine();
			String name = scan.nextLine();
			if (!isEnoughSpace(new LinkNameRecord(0, 0, (byte) (name.length() + 1), 
					name), control)) {
				return;
			}
			control.unlink(id, name);
		} else {
			System.out.println("File with this ID doesn't exist");
		}
	}
	
	private static void link(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		boolean fl = control.fileExist(id);
		
		if (fl) {
			System.out.println("Input linking name:");
			scan.nextLine();
			String name = scan.nextLine();
			
			if (!isEnoughSpace(new LinkNameRecord(0, 0, (byte) name.length(), 
					name), control)) {
				return;
			}
			
			if (!control.containsName(name)) {
				control.link(id, name);
			} else {
				System.out.println("File with this name already exist");
			}			
		} else {
			System.out.println("File with this ID doesn't exist");
		}			
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
		
				boolean fl = control.fileExist(id);
		
		if (fl) {
			System.out.println("Input shift:");
			int shift = scan.nextInt();
			System.out.println("Input size:");
			int size = scan.nextInt();
			byte[] data = control.read(id, shift, size);
			System.out.println(Buffer.byteArrToHexStr(data));
			System.out.println(Buffer.byteArrToStr(data));
		} else {
			System.out.println("File with this ID doesn't exist");
		}	
	}
	
	private static void write(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		
		boolean fl = control.fileExist(id);
		
		if (fl) {
			System.out.println("Input shift:");
			int shift = scan.nextInt();
			System.out.println("Input data: ");
			scan.nextLine();
			String data = scan.nextLine();						
			
			if (data.length() > 0) {
				boolean flag = control.write(id, shift, 
						data.length(), Buffer.intoByteString(data));
				
				if (!flag) {
					System.out.println("Not enough space on flash");
				}
			}
			
			System.out.println(control.getFileInfo(id));
		} else {
			System.out.println("File with this ID doesn't exist");
		}	
	}
	
	private static void close(Controller control) {
		System.out.println("Input file ID:");
		Scanner scan = new Scanner(System.in);
		int id = scan.nextInt();
		
		boolean flag = control.close(id);;
		if (!flag) {
			System.out.println("File with this ID doesn't exist");
		}
	}
	
	private static void open(Controller control) {
		System.out.println("Input file name:");
		Scanner scan = new Scanner(System.in);
		String name = scan.nextLine();
		int id = control.open(name);
		
		boolean fl = control.fileExist(id);
		
		if (fl) {
			System.out.println("SysID: " + id);
		} else {
			System.out.println("File with this name doesn't exist");
		}
	}
}
