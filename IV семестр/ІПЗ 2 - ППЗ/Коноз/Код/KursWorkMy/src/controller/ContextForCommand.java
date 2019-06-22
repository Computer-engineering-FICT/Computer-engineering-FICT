package controller;

import java.util.Hashtable;

/**
 * ���� ����������� ����� ��������� ��� �'���� ���� {@link Hashtable}
 * � ����� ����������� ��������� ��������� ����������.
 * @author ����� ����� 
 */
public class ContextForCommand {

	/**
	 * {@value} �������, � ��� ����������� ��������� ���������.
	 */
	private Hashtable<String, Object> table;
	
	/**
	 * �����������, ���� ��� ��������� �������� �������� �������.
	 */
	public ContextForCommand(){
		table = new Hashtable<>();
	}
	
	/**
	 * �������� � ������� �������� ���������.
	 * @param key ���� ���������.
	 * @param value �������� ���������.
	 */
	public void put(String key, Object value){
		table.put(key, value);
	}
	/**
	 * @return ������� �������� ������� ���� {@link Hashtable}
	 */
	public Hashtable<String, Object> getHashTable(){
		return table;
	}

}
