package DM;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.Arrays;

public class WriteFromFile {
	public WriteFromFile(int k) throws IOException {
		int [][] x = {
				{0,8,4,0,0,0,0},
				{0,0,0,8,3,0,0},
				{0,3,0,10,0,12,0},
				{0,0,0,0,0,3,0},
				{0,0,0,2,0,0,10},
				{0,0,0,0,0,0,4},
				{0,0,0,0,0,0,0}
		};
		int [][] r = new int [k][k];
		for (int i = 0; i < r.length; i++) {
			r[i] = Arrays.copyOf(x[i], k);
		}
		File f = new File("C:\\Users\\Lenovo\\Desktop\\lab6.data");
		OutputStream os = new FileOutputStream(f);
		ObjectOutputStream oos = new ObjectOutputStream(os);
		oos.writeObject(r);
		oos.close();
		os.close();
	}
	public WriteFromFile(String s) throws IOException{
		int [][] x =  {
				{0,1,1,1,1,1},
				{1,0,0,0,1,0},
				{1,0,0,0,0,1},
				{1,0,0,0,1,1},
				{1,1,0,1,0,1},
				{1,0,1,1,1,0},
			};
		File f = new File(s);
		OutputStream os = new FileOutputStream(f);
		ObjectOutputStream oos = new ObjectOutputStream(os);
		oos.writeObject(x);
		oos.close();
		os.close();
	}
}
