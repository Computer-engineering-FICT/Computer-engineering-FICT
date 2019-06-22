package lr5;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Vector {
	private int [] vec;
	
	public Vector (int N){
		vec = new int [N];
	}
	
	public int getN() {
		return vec.length;
	}
	
	public int getElement(int i) {
		return vec[i];
	}
	
	public void setElement(int i, int el) {
		vec[i] = el;
	}

	public String toString(){
		String str = "";
		for (int i = 0; i < getN(); i++){
			str = str + " " + this.getElement(i) ;
		}//end for
		return str;
	}//end toString
	
	public void Input_Vector(int El){
		for (int i = 0; i < getN(); i++){
			this.setElement(i, El);
		}//end for
	}//end Input_Vector
	
	public void Input_Vector(String path){
		File in = new File(path);
		try{
			Scanner sc = new Scanner(in);
			int i = 0, buf = 0;
			while (i < getN()) {
				try {
					buf = sc.nextInt();
					this.setElement(i, buf);
					i++;
				} catch (InputMismatchException e) {
					System.out.println("Input error if the file.");
				}	
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
	}//end Input_Vector
	
	public void Input_Vector(Scanner scan){
		int i = 0, buf = 0;
		while (i < getN()) {
			try {
				buf = scan.nextInt();
				this.setElement(i, buf);
				i++;
			} catch (InputMismatchException e) {
				System.out.println("Input error if the file.");
			}
		}
	}//end Input_Vector
	
	public static void Print_Vector(Vector vec, String path){
	    try {
	     PrintWriter out =
	       new PrintWriter(
	         new BufferedWriter(
	           new FileWriter(path)));
	     out.println(vec.toString());
	     out.println();  
	     out.close();
	    } catch(IOException e) {
	      System.err.println("Input/outpur error");
	    }
	}//end Print_Vector
	
	public String Output_Vector(Vector vec){
		return vec.toString();
	}//end Output_Vector

}
