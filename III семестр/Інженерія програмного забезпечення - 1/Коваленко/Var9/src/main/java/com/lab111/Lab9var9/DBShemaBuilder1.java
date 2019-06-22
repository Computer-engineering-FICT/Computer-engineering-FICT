package com.lab111.Lab9var9;

/**
 * � �������� Builder ��������� ���� ����������� ������-���������,
 * ���������������� ��������� ��������������� ������ �������-��������.
 * ��������� ������ ������������ ������ {@link DBShema}.
 * @author user
 * @version 9.9
 */
public class DBShemaBuilder1 extends DBShema{
	/**
	 * ����������� ����������� ���� ������, 
	 * ���������� ������ �� ������ ����� �� ������. 
	 * ���������� ������� Singleton. */
	public static final DBShemaBuilder1 shema1 = new DBShemaBuilder1();
	/**
	 * ����������� ������ ��� ����������. */
	private DBShemaBuilder1(){
		System.out.println("DBShemaBuilder1 - ����������� ������");
	}
	/**
	 * {@inheritDoc}
	 * @see com.lab111.Lab9var9.DBShema#buildPartA()
	 */
	@Override
	void buildPartA() {
		System.out.println("Me��� buildPartA ������ DBShemaBuilder1");		
	}
	/**
	 * {@inheritDoc}
	 * @see com.lab111.Lab9var9.DBShema#buildPartB()
	 */
	@Override
	void buildPartB() {
		System.out.println("Me��� buildPartB ������ DBShemaBuilder1");		
	}
}
