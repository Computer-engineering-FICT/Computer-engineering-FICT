package lab_1;

import java.io.*;

public class GeneratorTester_3 {
	public static String TestFile(String PathToFile){
		int [] TestResult = new int [8];
		for (byte i=0; i<=7; i++){
			TestResult[i] = 0;
		}
		try{
			FileReader ResFile = new FileReader(PathToFile);
			BufferedReader BufResFile = new BufferedReader(ResFile);
			String B1,B2,B3;
			byte Byte3 = 0;
			String Triada = "";
			B1 = Byte.toString((byte)(BufResFile.read()-48));
//			System.out.println("B1: "+B1);
			B2 = Byte.toString((byte)(BufResFile.read()-48));
//			System.out.println("B2: "+B2);
			while (!(Byte3 == -1)) {
				Triada = "";
				Byte3 = (byte) BufResFile.read();
				if (!(Byte3 == -1)){
					B3 = Byte.toString((byte)(Byte3-48));
	//				System.out.println("B3: "+B3);
					Triada = B1+B2+B3;
//					System.out.println("Triada: "+Triada);
					int Index = Integer.parseInt(Triada, 2);
					TestResult[Index]++;
					B1 = B2;
					B2 = B3;
				}
			}
		}catch(IOException EX){
			System.out.println("I/O Exception occured");
		}
		int Sum = 0;
		for (int i=0; i<=7; i++){
			Sum += TestResult[i];
		}
		double Freq0 = ((double)(TestResult[0])/(double)(Sum));
		double Freq1 = ((double)(TestResult[1])/(double)(Sum));
		double Freq2 = ((double)(TestResult[2])/(double)(Sum));
		double Freq3 = ((double)(TestResult[3])/(double)(Sum));
		double Freq4 = ((double)(TestResult[4])/(double)(Sum));
		double Freq5 = ((double)(TestResult[5])/(double)(Sum));
		double Freq6 = ((double)(TestResult[6])/(double)(Sum));
		double Freq7 = ((double)(TestResult[7])/(double)(Sum));
		String Res = " 0 : "+TestResult[0]+"   Freq0: "+Freq0+"\n";
		Res += " 1 : "+TestResult[1]+"   Freq1: "+Freq1+"\n";
		Res += " 2 : "+TestResult[2]+"   Freq2: "+Freq2+"\n";
		Res += " 3 : "+TestResult[3]+"   Freq3: "+Freq3+"\n";
		Res += " 4 : "+TestResult[4]+"   Freq4: "+Freq4+"\n";
		Res += " 5 : "+TestResult[5]+"   Freq5: "+Freq5+"\n";
		Res += " 6 : "+TestResult[6]+"   Freq6: "+Freq6+"\n";
		Res += " 7 : "+TestResult[7]+"   Freq7: "+Freq7+"\n";
		return Res;
	}
}
