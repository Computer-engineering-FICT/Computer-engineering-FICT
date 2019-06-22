package DDrawer;

import csv.CSVProcessor;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;


/**
 * Класс, выполняющий разбор данных и рисующий диаграмму.
 * @author Сидора Сергій, група ІО-73
 */
public class MyTestDraw {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		CSVProcessor processor = null;
		try {
			processor = new CSVProcessor();
			try {
				processor.loadCSV();
			} catch (IOException e) {
				System.out.println("Файл " + processor.DEFAULT_PATH + " не был найден, не может быть прочитан или не содержит информации требуемого формата.");
				for (int i=0; i<3; i++) {
					System.out.println("Введите имя CSV-файла:");
					BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
					String fileName = input.readLine();
					File file = new File(fileName);
					try {
						if (file.exists()) {							
							processor = new CSVProcessor(fileName);
							break;
						}
						else throw new FileNotFoundException();
					}
					catch (IOException e1) {
						System.out.println("Файл " + fileName + " не был найден, не может быть прочитан или не содержит информации требуемого формата.");
						if (i<3) {
							continue;
						}
						else {
							throw new IOException();
						}
					}
				}
			} catch (ClassNotFoundException e) {
				System.out.println("Файл " + processor.DEFAULT_PATH + " не содержит объектов необходимых классов.");
				for (int i=0; i<3; i++) {
					System.out.println("Введите имя CSV-файла:");
					BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
					String fileName = input.readLine();
					File file = new File(fileName);
					try {
						if (file.exists()) {
							processor = new CSVProcessor(fileName);
							break;
						}
						else throw new IOException();
					}
					catch (IOException e1) {
						System.out.println("Файл " + fileName + " не был найден, не может быть прочитан или не содержит информации требуемого формата.");
						if (i<3) {
							continue;
						}
						else {
							throw new IOException();
						}
					}
					/*catch (ClassNotFoundException e1) {
						System.out.println("Файл " + fileName + " не содержит объектов необходимых классов.");
						if (i<3) {
							continue;
						}
						else {
							throw new ClassNotFoundException();
						}
					}*/
				}
			}
		} catch (Exception e1) {
			System.err.println("Возникла ошибка! Работа программы завершена.");
		}
		for (int i=0; i<processor.getValues().size(); i++) {
			System.out.println(processor.getValues().get(i)[0]);
			System.out.println(processor.getValues().get(i)[1]);    			
		}
		
		/*CSVParser parser = new CSVParser(processor);
		Thread check = new Thread(parser);
		check.setName("CSV check");
		check.start();
		while (check.isAlive()) {
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				System.out.println("Главный поток прерван.");
			}
		}
		if (parser.isError()) {
			System.out.println(parser.getErrorMessage());			
		}
		else {*/
			String[][] table = new String[processor.getValues().size()][2]; //processor.getRows().size()

			
			for (int i=0; i<processor.getValues().size(); i++) {
				table[i][0] = Integer.toString(processor.getValues().get(i)[0]);
				table[i][1] = Integer.toString(processor.getValues().get(i)[1]);
				//processor.getValues().get(i)[1];
			}
			
			//processor.getRows().toArray(table);
			for (int i = 0; i < table.length; i++) {
				for (int j = 0; j < table[i].length; j++) {
					System.out.print(table[i][j]+"\t");
				}
				System.out.println();
			}
			DrawFrame frame = new DrawFrame(table);
			Toolkit kit = Toolkit.getDefaultToolkit();
			Dimension screen = kit.getScreenSize();
			frame.setBounds(0, 0, (int)(screen.getWidth()), (int)(screen.getHeight()));
			frame.setTitle("Diagram Builder");
			frame.setDefaultCloseOperation(DrawFrame.EXIT_ON_CLOSE);
			frame.setVisible(true);
			
	}

}
