public class Lab2 {
/**
 * Лабораторна робота №2
 * @author Vova
 * Використовується клас-обгортка Character
 * Детальніше про нього можна прочитати тут:
 * http://docs.oracle.com/javase/7/docs/api/java/lang/Character.html
 */
	public static void main(String[] args) {
		/**
		 * вхідні дані
		 */
		char[][] masA = { { 'q', 'a', 'z', 'c' }, { 'q', 'e', 'f', 'b', 'r' },
				{ 'e', 'z', 't' } };
		char[][] masB = { { 'b', 'h', 'z', 't' }, { 'i', 'n', 'm', 'y', 'r' },
				{ 'v', 'z', 'l' } };
		
		/**
		 * перевірка на рівність матриць.
		 * Додаватись можуть тільки рівні між собою матриці
		 * @param <flag> флажок, якщо довжина одного рядка матриці 
		 * masA не відповідає довжині іншого рядка матриці то flag = false
		 */
		boolean flag = true;
		if (masA.length == masB.length) {
			int i=0;
			while (i < masB.length) {
				if (masB[i].length != masA[i].length) {
					flag = false;
				}
				i++;
			}
			
		}else flag = false;
		/**
		 * якщо flag=true працюємо далі
		 */
		if (flag){
			/**
			 * обявляємо матрицю C
			 * виділяємо пам'ять для рядків
			 */
			char [] [] masC = new char [masA.length][];
			/**
			 * виділяємо пам*ять в кожному рядку для стовпців цього рядка відповідно до розмірів матриць-доданків.
			 */
			for (int i = 0; i < masC.length; i++) {
				masC[i] = new char [masB[i].length];
			}
			
			for (int i = 0; i < masC.length; i++) {
				for (int j = 0; j < masC[i].length; j++) {
					/**
					 * перевіряємо чи отриманий нами елемент належить до Unicode
					 */
					if (Character.isDefined((Character.getNumericValue(masA[i][j])+Character.getNumericValue(masB[i][j])))){
						/**
						 * виконуэмо додавання. Спочатку переводимо код букви в тип int. Потім додаємо, 
						 * і результат приводимо до типу char
						 */
						masC[i][j] =(char) (Character.getNumericValue(masA[i][j])+Character.getNumericValue(masB[i][j]));
					}else
					System.out.println("Упсс..символ не належатиме до Unicode");
				}
			}
			System.out.println("Результати сумування матриць");
			for (int i = 0; i < masC.length; i++) {
				for (int j = 0; j < masC[i].length; j++) {
					System.out.print(masC[i][j]+"|");
				}
				System.out.println();
			}
			
			/**
			 * обчислюємо суму максимальних елеменів в рядках матриці masC
			 * @param sum - тут будемо накопичувати суму
			 * @param max - змінна для пошуку максимального елемента
			 */
			char sum = '\u0000';
			char max = sum;
			for (int i = 0; i < masC.length; i++) {
				max = '\u0000';
				for (int j = 0; j < masC[i].length; j++) {
					if (masC[i][j]>max)
						max = masC[i][j]; 
				}
				/**
				 * знову перевіряємо та сумуємо
				 */
				if (Character.isDefined((Character.getNumericValue(sum)+Character.getNumericValue(max)))){
					sum =(char) (Character.getNumericValue(max)+Character.getNumericValue(sum));	
				}
				
			}
			System.out.println("Результат. Сума найбільших елементів кожного рядка матриці:"+sum);
		}
		else System.out.println("Упсс..невірні вхідні дані");
	}

}
