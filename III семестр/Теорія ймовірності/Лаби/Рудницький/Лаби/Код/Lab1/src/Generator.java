import java.util.ArrayList;
import java.util.Random;

public class Generator {
	private int[] table = new int[255];
	private int position = 0;
	
	public Generator() {
	    for (int i = 0; i < table.length; i++) {
		    Random r = new Random();
		    table[i] = r.nextInt(2);
	    }
	}
	
	public int generate(ArrayList<LFSR> lfsr) {
		int res = 0;
		position = 0;
		int[] mas = new int[6];
		for (int i = 0; i < mas.length; i++) {
			mas[i] = lfsr.get(i).generate();	
		}
		for (int i = 0; i < mas.length; i++) {
			if (mas[i] == 1) {
				position = position + (int)(Math.pow(2, i));
			}
		}
		res = table[position];
		return res;
	}
}
