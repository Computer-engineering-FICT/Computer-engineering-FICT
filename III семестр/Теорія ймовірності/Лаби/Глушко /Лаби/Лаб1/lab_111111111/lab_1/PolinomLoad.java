package lab_1;

import java.io.*;

public class PolinomLoad {
	public static byte [] LodaFromFile(String PathToFile, byte LFSRCapacity){
		byte [] Result = null;
		try {
			FileReader SourcePolinomFile = new FileReader(PathToFile);
			BufferedReader BufPolinomFile = new BufferedReader(SourcePolinomFile);
			String Polinom = null;
			for (byte i=3; i<=LFSRCapacity; i++){
				Polinom = BufPolinomFile.readLine();
			}
			Polinom = Polinom.substring(3);
			BufPolinomFile.close();
			String [] PolSet = Polinom.split(" ");
			Result = new byte [PolSet.length];
			for (byte i=0; i<=PolSet.length-1; i++){
				Result[i]=Byte.parseByte(PolSet[i]);
			}
		}catch (FileNotFoundException EX){
			System.out.println("File not found");
		}catch (IOException EX){
			System.out.println("I/O Exception occured");
		}
		return Result;
	}
}
