package src.com.lab4;

import java.util.Arrays;


public class Work {
	public Work(int []R){
		this.R=R;
	}
	
	private int []R;
	
	
	//Число границь
	private int border = 9;
	
	
	
	//Зберігаємо числове значення границь
	double[] border_array = new double [border];
	
	//Зберігаємо позиції границь
	int [] position_array = new int [border];
	
	//Визначаємо імовірності на кожній ділянці
	double [] border_position_piece = new double [border+1];
	
	
	public void borders (int [] R){

		//Скільки чисел приблизно має бути в кожній границі
		int count_numb = R.length/border;
		
		//Коефіцієнт, на який домножуємо к-сть границь (100, 200, 300 ...)
		int k=1;
		for (int i=count_numb; i<R.length-1;i=k*count_numb){
			//Якщо даа позиція і наступна різні
			if(R[i]!=R[i+1]){
				//записуємо в масив середнє значення
				position_array[k-1]=i;
				border_array[k-1]=(R[i+1]+R[i])/2;
			//	System.out.println(position_array[k-1]);
			}else{
				//крок, який будемо робити вправо
				//Цикл від 1 до різниці довжини масиву і теперішньої позиції
				for (int f=1;f<R.length-i;f++){
					//Якщо все ж таки наступний не рівний попередньому - знайти середнє значення і вийти з циклу 
					if(R[i]!=R[i+f]){
						border_array[k-1]=(R[i]+R[i+f])/2;
						position_array[k-1]=i+f;
						break;
					}
				}
			}
			k++;
		}
		
		//Якщо хитрі межі і останній межа за 1 до кінця
		//if((R.length-k*count_numb)>=1){
			position_array[position_array.length-1] = R.length-2;
			border_array[border_array.length-1] = (R[R.length-2]+R[R.length-1])/2;
			//System.out.println(Arrays.toString(border_array));
		//}
		
		
		
		System.out.println("Імовірність на кожній ділянці");
		for (int i=0; i<border;i++){
			// Для нульової позиції
			if(i==0){
				double pos1 = R[position_array[i]]-R[0];
				double pos2 = R[R.length-1];				
				border_position_piece[i]=(double)(pos1/pos2);
				System.out.println((double)(pos1/pos2));
			}else{
				//Для всіх інших
				double pos1 = R[position_array[i]]-R[position_array[i-1]];
				double pos2 = R[R.length-1];
				border_position_piece[i]=(double)(pos1/pos2);
				System.out.println((double)(pos1/pos2));
			
			}
				
		}
		
		//Останнє число мінус останнє число на останній границі
		double sum=0;
		//double pos1 = R[R.length-1]-R[border_array.length-1];
		//double pos2 = R[R.length-1];
		//System.out.println(pos1/pos2);
		//остання позиція
		//border_position_piece[border_position_piece.length-1]=pos1/pos2;
		
		for (int i=0;i<border_position_piece.length;i++){
			//System.out.println(border_position_piece[i]);
			sum+=border_position_piece[i];
		}
		
		
		System.out.println("Загальна імовірність: "+sum);
		
		
		}

	public void chisqure(){
		double sum= 0.0;
		int count_numb = R.length/border;
		for (int i=0;(int) i<border;i++){
			sum+=(Math.pow(count_numb-R.length*border_position_piece[i],2))/(R.length*border_position_piece[i]);
			//System.out.println(sum);
		}
		System.out.println("Хі квадрат: "+sum);
	}
	
	
	
}
