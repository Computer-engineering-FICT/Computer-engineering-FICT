package com.lab111.Lab9var9;

/**
 * ����������� ����� � �������� Builder ��������� ���� ����������,
 * ������� �������� � ���� �������� ���� ��������� ����������� �������
 * ��� �������� �������� �������.
 * ��������� �������� - ��������� ����������� ������ ��� ��������������� �������.
 * �������� ������ �� �������������� ������.
 * @author user
 * @version 9.9
 */
public abstract class DBShema {
	/**
	 * ������ �� ������ - ������� */
	private Table myTable;
	/**
	 * ����� ����������� ���� {@link #myTable} ������ 
	 * �� ��������� ������ ������ {@link Table}.
	 * @see Table */
	public void createNewTable(){
		myTable = new Table();
	}
	/**
	 * ����� ���������� ��������� ��������������� ������������ ����� �������-�������� */
	abstract void buildPartA();
	/**
	 * ����� ���������� ��������� ��������������� ������������ ����� �������-�������� */
	abstract void buildPartB();
	/**
	 * ����� ���������� �������� ���� {@link #myTable}.
	 * @return ������ ������ {@link Table}
	*/
	public Table getMyTable() { 
		return myTable;
	}
}
