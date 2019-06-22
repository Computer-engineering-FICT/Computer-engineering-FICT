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
 * ����� ��� ������������ ������ ���������.
 * 
 * @author �������� ������
 */
public class TestIO {

	/**
	 * @param args
	 *            ��������� ��������� ������
	 * @throws IOException
	 *             �������������� �������� �����/������
	 * @throws ClassNotFoundException
	 *             ����� �� ������
	 * @throws CSVParseException
	 *             �������������� �������� � ������ �������
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
					System.out.println("������� ��� CSV-�����:");
					BufferedReader consoleIn = new BufferedReader(
							new InputStreamReader(System.in));
					processor = new CSVProcessor(consoleIn.readLine());
				} catch (IOException exc1) {
					try {
						System.out.println("������� ��� CSV-�����:");
						BufferedReader consoleIn = new BufferedReader(
								new InputStreamReader(System.in));
						processor = new CSVProcessor(consoleIn.readLine());
					} catch (IOException exc2) {
						try {
							System.out.println("������� ��� CSV-�����:");
							BufferedReader consoleIn = new BufferedReader(
									new InputStreamReader(System.in));
							processor = new CSVProcessor(consoleIn.readLine());
						} catch (IOException exc3) {
							System.out
									.println("CSV-���� �� ������, ���������� ��������� ����������");
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
				.println("���������� ��������������� ������� ArrayList � HashMap:");
		System.out.println(processor);
	}
}
