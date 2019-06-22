package src.com.lab4;

import java.util.Arrays;


public class Main{
	public static void main(String [] args){
		int [] ab_array = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
		int  [] R = new int [1000];
		Generator generator = new Generator();
		Work work = new Work(R);
		generator.gen();
		//генеруємо масив із 1000 чисел за нашим розподілом
		for (int i=0;i<R.length;i++){
			R[i] = generator.getR(ab_array);
		}
		//System.out.println(Arrays.toString(a));
		
		//Сортуємо масив
		Arrays.sort(R);
		
		work.borders(R);
		work.chisqure();
		
		//Ручний режим
		
		
/*		int [] R = {3,40,80,150,300,500,630,680,750,920};
		Work work_hand = new Work(R);
		Arrays.sort(R);
		work_hand.borders(R);
		work_hand.chisqure();
	*/	

	}
}