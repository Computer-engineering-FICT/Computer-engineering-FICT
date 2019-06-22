package lab_1;

import java.io.*;

public class TableCreator {

	public static void main(String[] args) {
		byte zer = 0;
		byte one = 1;
		byte [] BArr1 = {zer,zer,one,zer,one,one,zer};
		byte [] BArr2 = {zer,one,one,zer,zer,one,zer};
		StartStop SS1 = new StartStop(BArr1, BArr2,(byte)1, "D:\\LFSRPolinoms.txt");
		try {
			FileWriter TableFile = new FileWriter("D:\\Table.txt");
			BufferedWriter BufTable = new BufferedWriter(TableFile);
			String TmpString;
			for (int i=0; i<=4095; i++){
				TmpString =""+SS1.GetNextValue()/*+"\n"*/;
				BufTable.write(TmpString);
			}
			BufTable.close();
		}catch (IOException EX){
			System.out.println("I/O Exception occured");
		}
	}

}
