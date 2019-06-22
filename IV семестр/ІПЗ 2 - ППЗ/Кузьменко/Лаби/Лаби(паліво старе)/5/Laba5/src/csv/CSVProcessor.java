package csv;

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
 * Клас реалізує механізми обробки CSV-файлів.
 *
 * @author Сидора Сергій
 *
 */
public class CSVProcessor implements Externalizable {
	
	/**
	 * Ім'я за замовчуванням
	 */
	public String DEFAULT_PATH = "test.csv";
	
    /**
     * Автозгенерований UID.
     */
    private static final long serialVersionUID = -5454321324683867327L;

    /**
     * Агрегат рядків файлу.
     */
    private ArrayList < String > lines;

    public ArrayList < int[] > values;
    
    /**
     * Ім'я файлу, з котрим в даний момент працює CSVProcessor.
     */
    private String nameOfFile;

    /**
     * Дані у вигляді двувимірного масиву (опізнані).
     */
    private transient HashMap < String, Double > info;

    /**
     * Потік для розпізнавання CSV-файлу.
     */
    private transient ParseThread threadParse;
	
    /**
     * Конструктор без вказання імені файла, що використовує ім'я за замовчуванням
     */
    public CSVProcessor() throws IOException {
        super();
        lines = new ArrayList<String>();
        values = new ArrayList<int[]>();
        //loadCSV(DEFAULT_PATH);
        info = new HashMap<String, Double>();
        threadParse = null;
    }

    /**
     * Конструктор з ім'ям файлу.
     *
     * @param fileName
     *            ім'я файлу
     * @throws IOException
     *            Виключні ситуації при роботі із вводом/виводом
     */
    public CSVProcessor(final String fileName) throws IOException {
        super();
        lines = new ArrayList<String>();
        values = new ArrayList<int[]>();
        loadCSV(fileName);
        info = new HashMap<String, Double>();
        threadParse = null;
    }
	
    /**
     * Розпізнає дані згідно формату CSV-файла.
     *
     * @throws CSVParseException
     *             Виключні ситуації в роботі парсеру
     *
     */
    private synchronized void parse() throws CSVParseException {
        Iterator < String > line = lines.iterator();
        while (line.hasNext()) {
            String string = line.next();
            Scanner scan = new Scanner(string);
            scan.useDelimiter("=");
            String key;
            Double value;
            if (scan.hasNext()) {
                key = scan.next();
            } else {
                throw new CSVParseException("There is no key", 0);
            }
            if (scan.hasNext()) {
                value = scan.nextDouble();
            } else {
                throw new CSVParseException("There is no value", 1);
            }
            if (scan.hasNext()) {
                throw new CSVParseException("There is more values", 2);
            }
            info.put(key, value);
            scan.close();
        }
    }

    /**
     * Потік для роспізнавання CSV-файлів.
     *
     * @author Сидора Сергій
     * @
     */
    private class ParseThread extends Thread {
        /**
         * Конструктор.
         */
        ParseThread() {
            start();
        }

        /*
         * За допомогою цього методу "запускається" метод parse(),
         * який виконує розбір завантажених в попередній роботі даних
         * в двовимірний масив
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
     * Завантажує CSV файл і записує його рядки у rows.
     *
     * @param fileName
     *            ім'я нового файлу
     * @throws IOException
     *             Виключні ситуації вводу/виводу
     */
    public void loadCSV(final String fileName) throws IOException {
        this.nameOfFile = fileName;
        BufferedReader fileIn = new BufferedReader(new FileReader(fileName));
        String[] str = new String[2]; 
        String s;
        int[] v;
        int j = 0;
        while ((s = fileIn.readLine()) != null) {
    			lines.add(s);
        		str = s.split(";");
        		v = new int[2];
        		for (byte i=0; i<=1; i++) {
        			v[i] = Integer.parseInt(str[i]);
        		}
        		values.add(j, v);
        		j +=1;
        }
    }
    
    public void loadCSV() throws IOException, ClassNotFoundException {
    	loadCSV(DEFAULT_PATH);
    }
    
    public ArrayList < int[] > getValues(){    	
    	return values;
    }
    
    public ArrayList < String > getRows(){    	
    	return lines;
    }
    
    /**
     *
     */
    public void parseThread() {
        if (threadParse == null) {
            threadParse = new ParseThread();
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.Externalizable#readExternal(java.io.ObjectInput)
     */
    @Override
    public synchronized void readExternal(final ObjectInput in)
            throws IOException, ClassNotFoundException {
        lines = (ArrayList<String>) in.readObject();
        nameOfFile = (String) in.readObject();
        info = new HashMap<String, Double>();
        if (threadParse == null) {
            threadParse = new ParseThread();
        }
    }

    /**
     * Записує рядки в CSV-файл.
     *
     * @throws IOException
     *             Виключні ситуації вводу/виводу
     */
    public void saveCSV() throws IOException {
        PrintWriter fileOut = new PrintWriter(new BufferedWriter(
                new FileWriter(nameOfFile)));
        Iterator < String > row = lines.iterator();
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
        return lines.toString() + info.toString();
    }

    /*
     * (non-Javadoc)
     *
     * @see java.io.Externalizable#writeExternal(java.io.ObjectOutput)
     */
    @Override
    public synchronized void writeExternal(final ObjectOutput out)
                                                           throws IOException {
        out.writeObject(lines);
        out.writeObject(nameOfFile);
    }
}

