package com.lab111.Lab8var9;

/**
 * ����� � ��������� �������� Factory Method ��������� ���� ����������� ������,
 * ������� ���������� ���������, ��������� ��������, 
 * ���������� ���������� �������� �������, 
 * ����������� ��������� {@link AggregatedStructure}.
 * @author user
 * @version 8.9
 * *	@see AggregatedStructure
 * @see AggregatedStructure#getIterator()
 * @see AggregatedStructure#getIterator(int)
 */
public class MyListIterator1 implements MyIterator<String>{
	/**
	 * ������ ����������� ������. */
	public MyListIterator1(){
		System.out.println("MyListIterator1 - ����������� ������ ��� ����������.");
	};

	/**
	 * {@inheritDoc MyIterator}
	 * @see com.lab111.Lab8var9.MyIterator#hasNext()
	 */
	@Override
	public boolean hasNext() {
		System.out.println("Me��� hasNext ��� ����������. ���������� ��������� ��������.");
		return false;
	}
	/**
	 * {@inheritDoc MyIterator}
	 * @see com.lab111.Lab8var9.MyIterator#next()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String next() {
		System.out.println("����� next ��� ����������, ���������� ������ ������ String.");
		return null;
	}

	/**
	 * {@inheritDoc MyIterator}
	 * @see com.lab111.Lab8var9.MyIterator#skipTo()
	 */
	@Override
	public String skipTo() {
		System.out.println("����� skipTo ��� ����������. ���������� ������ ������ String.");
		return null;
	}
}
