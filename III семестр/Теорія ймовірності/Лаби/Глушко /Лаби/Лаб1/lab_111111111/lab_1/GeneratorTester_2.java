package lab_1;

import java.io.*;

public class GeneratorTester_2 {
	public static String TestFile(String PathToFile){
		try {
			FileReader ResFile = new FileReader(PathToFile);
			FileWriter DifFile = new FileWriter ("D:\\DifResGen.txt");
			BufferedReader BufResFile = new BufferedReader(ResFile);
			BufferedWriter BufDifFile = new BufferedWriter(DifFile);
			byte LastByte = (byte) BufResFile.read();
			byte CurrentByte = 0;
			while (!(CurrentByte == -1)){
				CurrentByte = (byte)BufResFile.read();
				BufDifFile.write(Byte.toString((byte) Math.abs(CurrentByte-LastByte)));
				LastByte = CurrentByte;
			}
			BufDifFile.close();
			BufResFile.close();
		}catch (IOException EX){
			System.out.println("I/O Exception occured");
		}
		String Result = GeneratorTester_1.TestFile("D:\\DifResGen.txt");
		return Result;
	}
}
