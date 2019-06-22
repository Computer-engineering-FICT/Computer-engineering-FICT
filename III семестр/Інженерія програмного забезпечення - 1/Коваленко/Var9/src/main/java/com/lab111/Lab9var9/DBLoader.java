package com.lab111.Lab9var9;

/**
 * � �������� Builder ��������� ���� ������� - �������������, 
 * ������� ������������� ��������� ������ �������. 
 * ���������� ��������� ������� - ���������.
 * @author user
 * @version 9.9
 */
public class DBLoader {
	/**
	 * ������ �� ������ - ���������.
	 * @see DBShema */
	private DBShema shema;
	/**
	 * ����������� ������, �������������� �������� ���� {@link #shema>.
	 * @param s ������, ����������� ��������� {@link DBShema}
	 * @see DBShema */
	public DBLoader(DBShema s){ 
		shema = s;
	}
	/**
	 * ����������� ������ ��� ����������. */
	public DBLoader(){
		System.out.println("DBLoader - ����������� ������");
	}
	/**
	 * ����� ������������� ��������� ������ �������.
	 * ��� ��������������� ������� ������������ ������ �������, 
	 * ������������ ��������� {@linkDBShema}.
	 * @see Table
	 * @see DBShema */
	public void construct() {
		shema.createNewTable();
		shema.buildPartA();
		shema.buildPartB();
		getProduct();
	}
	/**
	 * ����� ���������� ������ �� ������� �������.
	 * @return ������ ������ {@link Table}
	 * @see Table */
	public Table getProduct(){
		return shema.getMyTable();
	}
	/**
	 * ����� ������������� �������� ���� {@link #shema).
	 * @param s ������, ����������� ��������� {@link DBShema}
	 * @see DBShema */
	public void setDBShema(DBShema s){ 
		shema = s;
	}
}
