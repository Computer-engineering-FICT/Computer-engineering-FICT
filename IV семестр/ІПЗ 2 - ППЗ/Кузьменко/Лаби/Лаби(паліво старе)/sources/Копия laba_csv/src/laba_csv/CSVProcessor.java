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
 * ����� ��������� ��������� ��������� CSV-������.
 * 
 * @author �������� ������
 * 
 */
public class CSVProcessor implements Externalizable {

	/**
	 * ����� ��� ������������� CSV-�����.
	 * 
	 * @author �������� ������
	 * 
	 */
	private class ParseThread extends Thread {
		/**
		 * �����������.
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
	 * ������������������� UID.
	 */
	private static final long serialVersionUID = -4363337173092408443L;

	/**
	 * ������� ����� �����.
	 */
	private ArrayList<String> rows;

	/**
	 * ��� �����, � ������� � ������ ������ �������� CSVProcessor.
	 */
	private String fileName;

	/**
	 * ������ � ���� ����������� �������(������������).
	 */
	private transient HashMap<String, Double> data;

	/**
	 * ����� ��� ������������� CSV-�����.
	 */
	private transient ParseThread parse;

	/**
	 * ����������� �� ���������.
	 */
	public CSVProcessor() {
		super();
		rows = new ArrayList<String>();
		fileName = "";
		data = new HashMap<String, Double>();
		parse = null;
	}

	/**
	 * ����������� � ������ �����.
	 * 
	 * @param fileName
	 *            ��� �����
	 * @throws IOException
	 *             �������������� �������� �����/������
	 */
	public CSVProcessor(String fileName) throws IOException {
		super();
		rows = new ArrayList<String>();
		loadCSV(fileName);
		data = new HashMap<String, Double>();
		parse = null;
	}

	/**
	 * ��������� CSV ���� � ���������� ��� ������ � rows.
	 * 
	 * @param fileName
	 *            ��� ������ �����
	 * @throws IOException
	 *             �������������� �������� �����/������
	 */
	public void loadCSV(String fileName) throws IOException {
		this.fileName = fileName;
		BufferedReader fileIn = new BufferedReader(new FileReader(fileName));
		String s;
		while ((s = fileIn.readLine()) != null)
			rows.add(s);
	}

	/**
	 * ���������� ������ �������� ������� CSV-�����.
	 * 
	 * @throws CSVParseException
	 *             �������������� �������� � ������ �������
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
	 * ���������� ������ � CSV-����.
	 * 
	 * @throws IOException
	 *             �������������� �������� �����/������
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
