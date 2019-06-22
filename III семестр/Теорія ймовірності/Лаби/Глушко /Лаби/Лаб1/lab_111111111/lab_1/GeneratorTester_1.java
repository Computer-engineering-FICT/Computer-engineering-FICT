package lab_1;

import java.io.*;

public class GeneratorTester_1 {
	public static String TestFile(String PathToFile){
		int ZerCounter=0,OneCounter=0;
		try {
			FileReader ResFile = new FileReader(PathToFile);
			BufferedReader BufFileReader = new BufferedReader (ResFile);
			int CurrByte=0;
			while (!(CurrByte == -1)){
				CurrByte = BufFileReader.read();
				if(CurrByte == 49){
					OneCounter ++;
				}
				if (CurrByte == 48){
					ZerCounter ++;
				}	
			}
		}catch (FileNotFoundException EX){
			System.out.println("File not found");
		}catch (IOException EX){
			System.out.println("I/O Exception occured");
		}
		System.out.println("zer = "+ZerCounter);
		System.out.println("one = "+OneCounter);
		double ZerFreq = ((double)(ZerCounter))/((double)(ZerCounter+OneCounter));
		double OneFreq = ((double)(OneCounter))/((double)(ZerCounter+OneCounter));
		String Result = " Zero frequency: "+ZerFreq+"; \n One Frequency: "+OneFreq;
		return Result;
	}
}
