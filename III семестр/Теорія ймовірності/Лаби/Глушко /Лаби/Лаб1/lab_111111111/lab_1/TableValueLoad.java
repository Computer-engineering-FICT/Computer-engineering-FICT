package lab_1;

import java.io.*;

public class TableValueLoad {
	public static byte LoadValueFromFile(String PathToFile, int Number){
		byte Result = 0;
		try {
			FileReader SourceTableFile = new FileReader(PathToFile);
			BufferedReader BufTableReader = new BufferedReader(SourceTableFile);
			for (int i=0; i<=Number; i++){
				Result = (byte) (BufTableReader.read()-48);
			}
		} catch (IOException EX){
			System.out.println("I/O Exception occured");
		}
		return Result;
	}

}
