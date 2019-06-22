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
 * ���� ������ �������� ������� CSV-�����.
 *
 * @author ������ �����
 *
 */
public class CSVProcessor implements Externalizable {
	
	/**
	 * ��'� �� �������������
	 */
	public String DEFAULT_PATH = "test.csv";
	
    /**
     * ���������������� UID.
     */
    private static final long serialVersionUID = -5454321324683867327L;

    /**
     * ������� ����� �����.
     */
    private ArrayList < String > lines;

    public ArrayList < int[] > values;
    
    /**
     * ��'� �����, � ������ � ����� ������ ������ CSVProcessor.
     */
    private String nameOfFile;

    /**
     * ��� � ������ ����������� ������ (������).
     */
    private transient HashMap < String, Double > info;

    /**
     * ���� ��� ������������ CSV-�����.
     */
    private transient ParseThread threadParse;
	
    /**
     * ����������� ��� �������� ���� �����, �� ����������� ��'� �� �������������
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
     * ����������� � ��'�� �����.
     *
     * @param fileName
     *            ��'� �����
     * @throws IOException
     *            ������� �������� ��� ����� �� ������/�������
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
     * ������� ��� ����� ������� CSV-�����.
     *
     * @throws CSVParseException
     *             ������� �������� � ����� �������
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
     * ���� ��� ������������ CSV-�����.
     *
     * @author ������ �����
     * @
     */
    private class ParseThread extends Thread {
        /**
         * �����������.
         */
        ParseThread() {
            start();
        }

        /*
         * �� ��������� ����� ������ "�����������" ����� parse(),
         * ���� ������ ����� ������������ � ��������� ����� �����
         * � ���������� �����
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
     * ��������� CSV ���� � ������ ���� ����� � rows.
     *
     * @param fileName
     *            ��'� ������ �����
     * @throws IOException
     *             ������� �������� �����/������
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
     * ������ ����� � CSV-����.
     *
     * @throws IOException
     *             ������� �������� �����/������
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

