package com.lab111.Lab9var9;

/**
 * � �������� Builder ��������� ���� ����������� ������-���������,
 * ���������������� ��������� ��������������� ������ �������-��������.
 * @author user
 * @version 9.9
 */
public class DBShemaBuilder2 extends DBShema{
	/**
	 * ����������� ����������� ���� ������, 
	 * ���������� ������ �� ������ ����� �� ������. 
	 * ���������� ������� Singleton.
	 * */
	public static final DBShemaBuilder2 shema2 = new DBShemaBuilder2();
	/**
	 * ����������� ������ ��� ����������.*/
	private DBShemaBuilder2(){
		System.out.println("DBShemaBuilder2 - ����������� ������");
	};
	/**
	 * {@inheritDoc}
	 * @see com.lab111.Lab9var9.DBShema#buildPartA()
	 */
	@Override
	void buildPartA() {
		System.out.println("Me��� buildPartA ������ DBShemaBuilder2");
	}
	/**
	 * {@inheritDoc}
	 * @see com.lab111.Lab9var9.DBShema#buildPartB()
	 */
	@Override
	void buildPartB() {
		System.out.println("Me��� buildPartB ������ DBShemaBuilder2");		
	}
}
