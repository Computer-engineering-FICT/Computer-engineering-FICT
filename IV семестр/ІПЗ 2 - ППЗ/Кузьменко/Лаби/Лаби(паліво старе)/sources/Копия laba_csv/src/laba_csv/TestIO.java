package laba_csv;

import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * Класс для тестирования работы программы.
 * 
 * @author Шаршаков Андрей
 */
public class TestIO {

	/**
	 * @param args
	 *            параметры командной строки
	 * @throws IOException
	 *             исключительные ситуации ввода/вывода
	 * @throws ClassNotFoundException
	 *             класс не найден
	 * @throws CSVParseException
	 *             исключительные ситуации в работе парсера
	 */
	public static void main(String[] args) throws IOException,
			ClassNotFoundException, CSVParseException {
		CSVProcessor processor = new CSVProcessor();
		File serialized = new File("serialized.dat");
		if (serialized.exists()) {
			ObjectInputStream objIn = new ObjectInputStream(
					new FileInputStream(serialized));
			processor = (CSVProcessor) objIn.readObject();
		} else {
				try {
					System.out.println("Введите имя CSV-файла:");
					BufferedReader consoleIn = new BufferedReader(
							new InputStreamReader(System.in));
					processor = new CSVProcessor(consoleIn.readLine());
				} catch (IOException exc1) {
					try {
						System.out.println("Введите имя CSV-файла:");
						BufferedReader consoleIn = new BufferedReader(
								new InputStreamReader(System.in));
						processor = new CSVProcessor(consoleIn.readLine());
					} catch (IOException exc2) {
						try {
							System.out.println("Введите имя CSV-файла:");
							BufferedReader consoleIn = new BufferedReader(
									new InputStreamReader(System.in));
							processor = new CSVProcessor(consoleIn.readLine());
						} catch (IOException exc3) {
							System.out
									.println("CSV-файл не найден, выполнение программы прекращено");
							return;
						}
					}
				}
			processor.parseThread();
			ObjectOutputStream objOut = new ObjectOutputStream(
					new FileOutputStream(serialized));
			objOut.writeObject(processor);
			objOut.close();
		}
		System.out
				.println("Содержимое агрегированного объекта ArrayList и HashMap:");
		System.out.println(processor);
	}
}
