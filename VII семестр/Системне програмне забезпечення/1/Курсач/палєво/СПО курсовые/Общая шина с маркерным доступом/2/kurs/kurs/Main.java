package kurs;

/**
 * Запускає на виконання весь проект
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Main {
	public final static int[][] GRAPH_CON = {
		{ 0, 1, 1, 1, 2, 0, 2, 0, 0},		   
		{ 0, 0, 0, 0, 0, 1, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0},		
		{ 0, 0, 0, 0, 0, 1, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 2, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 2},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 2},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 2},		
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0}
	};  
	public final static int[] GRAPH_WEIGHT = {
		15, 18, 35, 25, 12, 20, 30, 45, 5 
		};

	//кількість процесорів в системі
	public final static int PROC_NUM = 4;
	
	public static void main(String[] args) {
		if (GRAPH_CON.length != GRAPH_CON[0].length
				| GRAPH_WEIGHT.length != GRAPH_CON.length) {
			System.out.println("Неправильні розміри таблиць для задання графа");
			System.exit(0);
		}
		Ruler.get_instance().start();
	}
}
