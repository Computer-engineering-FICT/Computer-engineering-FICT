package lab_1;

import java.io.*;

public class Lab_1_Runner {
	
	public static void main(String[] args) {
		byte [] B1 = {(byte)1,(byte)1,(byte)0,(byte)1,(byte)0,(byte)0,(byte)0};
		byte [] B2 = {(byte)1,(byte)0,(byte)0,(byte)0,(byte)1,(byte)1,(byte)1};
		StartStop SS1 = new StartStop(B1,B2,(byte)1,"D:\\LFSRPolinoms.txt");
		byte [][] LinearGenBytes = new byte [12][];
		for (byte i=0; i<=7; i++){
			LinearGenBytes [i] = new byte [i+8];
			for (byte j=0; j<=8+i-1;j++){
				LinearGenBytes[i][j] = SS1.GetNextValue();
			}
		}
		TableGenerator TG1 = new TableGenerator(LinearGenBytes, (byte)2, "D:\\LFSRPolinoms.txt", "D:\\Table.txt");
		try {
			FileWriter ResFile = new FileWriter("D:\\ResGen.txt");
			BufferedWriter BufResFile = new BufferedWriter(ResFile);
			for (int i=0; i<=15000-1; i++){
				BufResFile.write(Byte.toString(TG1.GetNextValue()));
			}
			BufResFile.close();
		}catch (IOException EX){
		}
		System.out.println("---FREQUENCY TEST---");
		System.out.println(GeneratorTester_1.TestFile("D:\\ResGen.txt"));
		System.out.println();
		System.out.println("---DIFFERENTIAL FREQUENCY TEST---");
		System.out.println(GeneratorTester_2.TestFile("D:\\ResGen.txt"));
		System.out.println();
		System.out.println("---RANK---");
		System.out.println(GeneratorTester_3.TestFile("D:\\ResGen.txt"));
		System.out.println();
	}
}