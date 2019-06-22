
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class ReadFromFile {
	private int [][]sum;
	public ReadFromFile(String S) {
		int i;
		try {
			FileReader fr = new FileReader(S);
			BufferedReader br = new BufferedReader(fr);
			String g;
			int size;
			size = Integer.parseInt(br.readLine());
			int  A[][] = new int [size][size];
			i = 0;
			while ((g = br.readLine()) != null) {
				
				A[i]=gettmas(g);
				i++;		
			}
			fr.close();
			sum=A;
		} catch (IOException e1) {
			e1.printStackTrace();
		} 
	}
	public int [][] getsum(){
		return sum;
	}
	protected int [] gettmas(String s) {
		int []mas = new int [s.length()];
		for (int i = 0; i < s.length(); i++) {
			mas[i]=Integer.parseInt(String.valueOf(s.charAt(i))); 
		}
		return mas;
	}
}
