package lab1;

import javax.xml.ws.Action;
/**
 * 
 * @author Богдан Матвійчук
 * 		   группа ІО-91
 * @param <T>   int_ob ==> int
 * 				long_ob ==> long
 * 				float_ob ==> float			
 */
class Gen< INT extends Integer,LONG extends Long, FLOAT extends Float>{
	INT int_ob;
	LONG long_ob;
	FLOAT float_ob;
	/**
	 * @param  Задаем значения обекта
	 */
	Gen(INT a,LONG b,FLOAT c){
		int_ob=a;
		long_ob=b;
		float_ob=c;
	}
	INT set_int (INT a){
		int_ob = a;
		return int_ob;
	}
	
	LONG set_long (LONG b){
		long_ob=b;
		return long_ob;
	}
	FLOAT set_float (FLOAT c){
		float_ob=c;
		return float_ob;
	}
	/**
	@Action возвращает значения int
	*/
	INT get_int (){
		return int_ob;
	}
	/**
	@Action возвращает значения long
	*/
	LONG get_long (){
		return long_ob;
	}
	/**
	@Action возвращает значения float
	*/
	FLOAT get_float (){
		return float_ob;
	}
	/**
	@Action выводет на екран обект
	*/
	void print_ob (){
		System.out.print("int = "+ int_ob + " long = " + long_ob +
				" float = " + float_ob + '\n');
	}
}