package line_graphics;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.swing.filechooser.FileFilter;
import javax.swing.table.AbstractTableModel;

/**
 * ����� ���������� ������������� ��� ����� ��������� ������� ������
 * @author ������ ������ ������������
 * �� - 73
 * septemberfalltirael@yahoo.com
 *
 */
class InputException extends Exception {
	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 165161654651L;

	/**
	 * @return ������� ��������� �� ������
	 */
	public final String getMessage() {
		return "!!!Format of enterred Data i not available!!!";
	}
}

/**
 * ����� ������� ������
 * @author ������ ������ ������������
 * �� - 73
 * septemberfalltirael@yahoo.com
 */
class ExtensionFileFilter extends FileFilter {
	/**
	 * ��������� ����� ����������
	 * � ������ ��������� ����������.
	 * 
	 * @param extension
	 *            - ����������
	 */
	public void addExtension(String extension) {
		if (!extension.startsWith("."))
			extension = "." + extension;
		extensions.add(extension.toLowerCase());
	}

	/**
	 * ������������� �������� ����� ������
	 * 
	 * @param aDescription
	 *            - ��������
	 */
	public void setDescription(String aDescription) {
		description = aDescription;
	}

	/**
	 * ���������� �������� ��� �������� ���� ������.
	 * @see javax.swing.filechooser.FileFilter#getDescription()
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * ��������.
	 */
	private String description = " ";

	/**
	 * ������ ����������.
	 */
	private ArrayList<String> extensions = new ArrayList<String>();

	/** 
	 * �������������� �����, ���������������� �� �������
	 * �����
	 * @see javax.swing.filechooser.FileFilter#accept(java.io.File)
	 */
	public boolean accept(File f) {
		if (f.isDirectory())
			return true;
		String name = f.getName().toLowerCase();
		for (int i = 0; i < extensions.size(); i++)
			if (name.endsWith((String) extensions.get(i)))
				return true;
		return false;
	}
}
