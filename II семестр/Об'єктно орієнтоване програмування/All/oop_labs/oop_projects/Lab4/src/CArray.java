import java.util.Arrays;

public class CArray{
	public static void main(String[] args) {
		byte[][] array = {{6, 2, 3, 0, 6}, {8, 4, 3, 7, 5}, {7, 5, 9, 5, 1}, {2, 1, 7, 8, 4}};	//даний масив
		int row = 1, col = 5;	//номери рядків і стовпців, для який виконуються операції сортування
		
		//копіюємо вихідний масив для сортування, щоб не змінювати вхідні дані
		byte[][] copiedArray1 = new byte[array.length][array[0].length];
		byte[][] copiedArray2 = new byte[array.length][array[0].length];
		copiedArray1 = copyArray(array, copiedArray1);
		copiedArray2 = copyArray(array, copiedArray2);
		
		System.out.println("Масив:");	//даний масив
		showArray(array);

		boolean b1 = sortRow(copiedArray1, row);
		if (b1 == true){
			System.out.println("Відсортований масив за " + (row + 1) + " рядком:");
			showArray(copiedArray1);
		}
		else{
			System.out.println("Сортування неможливе. Такого рядка не існує");
		}
		
		boolean b2 = sortColumn(copiedArray2, col);
		if (b2 == true){
			System.out.println("Відсортований масив за " + (col + 1) + " стовпчиком:");
			showArray(copiedArray2);
		}
		else{
			System.out.println("Сортування неможливе. Такого стовпчика не існує");
		}	
		
		Double d1 = new Double(CArray.averageRow(array, row));
		if (d1.isNaN() == false){
			System.out.println("Середнє значення " + (row + 1) + " рядка: " + CArray.averageRow(array, row));
		}
		else{
			System.out.println("Відшукання середнього неможливе. Такого рядка не існує");
		}
		
		Double d2 = new Double(CArray.averageRow(array, col));
		if (d2.isNaN() == false){
			System.out.println("Середнє значення " + (col + 1) + " стовпчика: " + CArray.averageColumn(array, col));
		}
		else{
			System.out.println("Відшукання середнього неможливе. Такого стовпчика не існує");
		}	
	}

	
	public static double averageRow(byte[][] array, int row){	//повертає середнє арифметичне вибраного рядка
		int s = 0;
		double aver = 0.0;
		if ((row >= 0) && (row < array.length)){
			for(int j = 0; j < array[row].length; j++){
				s += array[row][j];
			}
			aver = (double)s/array[row].length;
			return aver;
		}
		else{
			return Double.NaN;
		}
	}

	public static double averageColumn(byte[][] array, int col){	//повертає середнє арифметичне вибраного стовпчика
		int s = 0;
		double aver = 0;
		if ((col >= 0) && (col < array[0].length)){
			for(int i = 0; i < array.length; i++){
				s += array[i][col];
			}
			aver = (double)s/array.length; 
			return aver;
		}
		else{
			return Double.NaN;
		}
	}

	public static boolean sortRow(byte[][] array, int row){	//метод сортування по рядку
		if ((row >= 0) && (row < array.length) ){
			Arrays.sort(array[row]);
			return true;
		}
		return false;
	}

	public static boolean sortColumn(byte[][] array, int col){	//метод сортування по стовпчику
		byte[] mas = new byte[array.length];	//створюємо новий одновимірний масив
		if ((col >= 0) && (col < array[0].length) ){
			for(int i = 0; i < array.length; i++){
				mas[i] = array[i][col];
			}
			Arrays.sort(mas);	//сортуємо одновимірний масив
			for(int i = 0; i < array.length; i++){	//переписуємо відсортований стовпчик у вихідний масив
				array[i][col] = mas[i];
			}
			return true;
		}
		return false;
	}

	public static void showArray(byte[][] array){	//метод для друку на екран масиву
		for(int i = 0; i < array.length; i++){
			for(int j = 0; j < array[i].length; j++){
				System.out.printf("  " + array[i][j]);
			}
			System.out.println();
		}
	}
	
	public static byte[][] copyArray(byte[][] array, byte[][] copiedArray){	//метод копіювання масивів
		for(int i = 0; i < array.length; i++){
			for(int j = 0; j < array[i].length; j++){
				copiedArray[i][j] = array[i][j];
			}
		}
		return copiedArray;
	}
}
