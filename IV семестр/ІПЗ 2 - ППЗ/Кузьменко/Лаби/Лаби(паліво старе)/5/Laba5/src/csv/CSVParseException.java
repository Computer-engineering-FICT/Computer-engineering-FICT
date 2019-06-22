package csv;

import java.text.ParseException;

/**
 * ������ ��� ���������� � ������ ������������ CSV-�����.
 * 
 * @author ������ �����
 */
public class CSVParseException extends ParseException {
	/**
	 * ���������������� UID.
	 */
	private static final long	serialVersionUID	= -8854557416849992261L;

	/**
	 * ����������� ��'���� ���������� �� ������������ ��� ������� � ��������.
	 * 
	 * @param s
	 *            ����������� ��� �������
	 * @param errorOffset
	 *            �������, � ����� ������� ���������� �� ��� ������������
	 */
	public CSVParseException(String s, int errorOffset) {
		super(s, errorOffset);
	}
}

