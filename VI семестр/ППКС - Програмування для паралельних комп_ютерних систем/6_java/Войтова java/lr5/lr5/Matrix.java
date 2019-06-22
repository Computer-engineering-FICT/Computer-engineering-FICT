package lr5;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class Matrix {
	private Vector[] matr;
	
	public Matrix (int N){
		matr = new Vector[N];
		for (int i = 0; i < getN(); i++)
			matr[i] = new Vector(getN());
	}
	
	public int getN() {
		return matr.length;
	}
	
	public int getElement(int i, int j) {
		return matr[i].getElement(j);
	}
	
	public void setElement(int i, int j, int el) {
		matr[i].setElement(j, el);
	}
	
	
	public String toString(){
		String str = "";
		for (int i = 0; i < getN(); i++){
		  for (int j = 0; j < getN(); j++){
			str = str + " " + this.getElement(i,j) ;
		  }
		  str = str + "\n";
		}//end for
		return str;
	}//end toString
	
	public void Input_Matrix(int El){
		Vector vec = new Vector (getN());	
		for (int i = 0; i < getN(); i++){
			//System.out.print("   " + (i+1)+" line \n");
			vec.Input_Vector(El);
			for (int j = 0; j < getN(); j++){
				this.setElement(i, j, vec.getElement(j));
			}
		}
	}//end Input_Matrix
	
	public void Input_Matrix(String path){
		File in = new File(path);
		Vector vec = new Vector (getN());
		try{
			Scanner sc = new Scanner(in);
			for (int i = 0; i < getN(); i++){
				//System.out.print("   " + (i+1)+" line \n");
				vec.Input_Vector(sc);
				for (int j = 0; j < getN(); j++){
					this.setElement(i, j, vec.getElement(j));
				}
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
	}//end Input_Matrix;
	
	public static void Print_Matr(Matrix matr, String path){
	    try {
	     PrintWriter out =
	       new PrintWriter(
	         new BufferedWriter(
	           new FileWriter(path)));
	     out.println(matr.toString());
	     out.println();
	     out.close();
	    } catch(IOException e) {
	      System.err.println("Input/outpur error");
	    }
	}//end Print_Matr
	
	public String POutput_Matr(Matrix matr){
	    return matr.toString();
	}//end Output_Matr	
}
