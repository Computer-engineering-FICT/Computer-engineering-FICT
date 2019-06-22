package laba_csv;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
import java.io.Externalizable;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.io.PrintWriter;

/**
 * Класс реализует механизмы обработки CSV-файлов.
 * 
 * @author Шаршаков Андрей
 * 
 */
public class CSVProcessor implements Externalizable {

	/**
	 * Поток для распознавания CSV-файла.
	 * 
	 * @author Шаршаков Андрей
	 * 
	 */
	private class ParseThread extends Thread {
		/**
		 * Конструктор.
		 */
		ParseThread() {
			start();
		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Thread#run()
		 */
		@Override
		public void run() {
			try {
				parse();
			} catch (CSVParseException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Автосгенерированный UID.
	 */
	private static final long serialVersionUID = -4363337173092408443L;

	/**
	 * Агрегат строк файла.
	 */
	private ArrayList<String> rows;

	/**
	 * Имя файла, с которым в данный момент работает CSVProcessor.
	 */
	private String fileName;

	/**
	 * Данные в виде двухмерного массива(распознанные).
	 */
	private transient HashMap<String, Double> data;

	/**
	 * Поток для распознавания CSV-файла.
	 */
	private transient ParseThread parse;

	/**
	 * Конструктор по умолчанию.
	 */
	public CSVProcessor() {
		super();
		rows = new ArrayList<String>();
		fileName = "";
		data = new HashMap<String, Double>();
		parse = null;
	}

	/**
	 * Конструктор с именем файла.
	 * 
	 * @param fileName
	 *            имя файла
	 * @throws IOException
	 *             исключительные ситуации ввода/вывода
	 */
	public CSVProcessor(String fileName) throws IOException {
		super();
		rows = new ArrayList<String>();
		loadCSV(fileName);
		data = new HashMap<String, Double>();
		parse = null;
	}

	/**
	 * Загружает CSV файл и записывает его строки в rows.
	 * 
	 * @param fileName
	 *            имя нового файла
	 * @throws IOException
	 *             исключительные ситуации ввода/вывода
	 */
	public void loadCSV(String fileName) throws IOException {
		this.fileName = fileName;
		BufferedReader fileIn = new BufferedReader(new FileReader(fileName));
		String s;
		while ((s = fileIn.readLine()) != null)
			rows.add(s);
	}

	/**
	 * Распознает данные согласно формату CSV-файла.
	 * 
	 * @throws CSVParseException
	 *             исключительные ситуации в работе парсера
	 * 
	 */
	private synchronized void parse() throws CSVParseException {
		Iterator<String> row = rows.iterator();
		while (row.hasNext()) {
			String s = row.next();
			Scanner sc = new Scanner(s);
			sc.useDelimiter("=");
			String key;
			Double value;
			if (sc.hasNext())
				key = sc.next();
			else
				throw new CSVParseException("There is no key", 0);
			if (sc.hasNext())
				value = sc.nextDouble();
			else
				throw new CSVParseException("There is no value", 1);
			if (sc.hasNext())
				throw new CSVParseException("There is more values", 2);
			data.put(key, value);
			sc.close();
		}
	}

	/**
	 * 
	 */
	public void parseThread() {
		if (parse == null)
			parse = new ParseThread();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.io.Externalizable#readExternal(java.io.ObjectInput)
	 */
	@Override
	public synchronized void readExternal(ObjectInput in) throws IOException,
			ClassNotFoundException {
		rows = (ArrayList<String>) in.readObject();
		fileName = (String) in.readObject();
		data = new HashMap<String, Double>();
		if (parse == null)
			parse = new ParseThread();
	}

	/**
	 * Записывает строки в CSV-файл.
	 * 
	 * @throws IOException
	 *             исключительные ситуации ввода/вывода
	 */
	public void saveCSV() throws IOException {
		PrintWriter fileOut = new PrintWriter(new BufferedWriter(
				new FileWriter(fileName)));
		Iterator<String> row = rows.iterator();
		while (row.hasNext()) {
			String s = row.next();
			fileOut.println(s);
		}
		fileOut.close();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return rows.toString() + data.toString();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.io.Externalizable#writeExternal(java.io.ObjectOutput)
	 */
	@Override
	public synchronized void writeExternal(ObjectOutput out) throws IOException {
		out.writeObject(rows);
		out.writeObject(fileName);
	}
}
