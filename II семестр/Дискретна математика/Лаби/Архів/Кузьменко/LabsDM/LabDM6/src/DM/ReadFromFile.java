package DM;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;

public class ReadFromFile {
	private int [][] x;
	public ReadFromFile(String s) throws IOException {
		File f = new File (s);
		InputStream is = new FileInputStream(f);
		ObjectInputStream ois = new ObjectInputStream(is);
		try {
			int[][] mas = (int [] []) (ois.readObject());
			x=mas;	
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}finally{
			ois.close();
			is.close();
		}
	}
	public int [][] getMas(){
		return x;
	}
	
}
