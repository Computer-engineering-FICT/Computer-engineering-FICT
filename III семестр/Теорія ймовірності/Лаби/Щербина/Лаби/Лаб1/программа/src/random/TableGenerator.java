package random;

import java.util.Random;

/**
 * табличный генератор
 * 
 */
public class TableGenerator {
	private int[] table;// таблица выбора выходного сигнала
	private LFSR[] lfsr;// генераторы случайных чисел

	/**
	 * инициализация таблицы выбора выходного сигнала
	 */
	private void initializationTable() {
		int n = 1 << lfsr.length;
		// int[] t = new int[n];// вспомогательная таблица
		// for (int i = 0; i < (n / 2); i++)
		// t[i] = 1;
		// int countSelected = 0;
		table = new int[n];
		// Random random = new Random();
		// while (countSelected < n) {
		// int nextIndex = random.nextInt(n);
		// if (t[nextIndex] > -1) {
		// table[countSelected] = t[nextIndex];
		// countSelected++;
		// t[nextIndex] = -1;
		// }
		// }
		for (int i = 0; i < n; i++) {

			int k = 1 << 2;

			if ((k & i) == 0) {
				table[i] = 0;
			} else
				table[i] = 1;
		}
		System.out.println("Таблиця");
		for (int i = 0; i < table.length; i++) {
			System.out.println(table[i]);
		}
	}

	/**
	 * @param capacity
	 *            - разрядность первого генератора
	 * @param countLFSR
	 *            - количество генераторов
	 */
	public TableGenerator(int capacity, int countLFSR) {
		lfsr = new LFSR[countLFSR];
		Random random = new Random();
		for (int i = 0; i < lfsr.length; i++) {
			int startValue = random.nextInt();
			while (startValue == 0)
				startValue = random.nextInt();
			lfsr[i] = new LFSR(capacity + i, startValue);
		}
		initializationTable();
	}

	/**
	 * возращает следующий сигнал
	 * 
	 * @return
	 */
	public int next() {
		int tableIndex = 0;
		for (int i = 0; i < lfsr.length; i++) {
			tableIndex += lfsr[i].next() << i;
		}
		return table[tableIndex];
	}

}
