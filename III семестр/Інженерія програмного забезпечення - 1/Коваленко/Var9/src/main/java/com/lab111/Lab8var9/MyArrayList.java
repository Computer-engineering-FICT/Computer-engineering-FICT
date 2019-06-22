package com.lab111.Lab8var9;

import java.util.ArrayList;

/**
 * ����� ��������� �������������� ���������. 
 * � ��������� �������� Factory Method ��������� ���� ������, 
 * ������������ ��������� ������ ���������� {@link AggregatedStructure}.
 * @author user
 * @version 8.9
 * @see AggregatedStructure
 */
public class MyArrayList implements AggregatedStructure<String>{
	/**
	 * �������������� ���������. */
	private ArrayList<String> myList;
	/**
	 * ����������� ������ ��� ����������.	*/
	public MyArrayList(){
		System.out.println("MyArrayList - ����������� ������ ��� ����������.");
	};
	/**
	 * ���������� ������ ������ {@link MyListlteratorl}.
	 * @see com.lab111.Lab8var9.AggregatedStructure#getIteraton()
	 */
	@Override
	public MyIterator<String> getIterator() {
		return new MyListIterator1();		
	}
	/**
	 * � ����������� �� �������� ���������, ����� ����� ����������
	 * {@link MyListlteratorl}, {@link MyListIterator2} ���
	 * <code>null</code>.
	 * @param � - ��������, �����������,
	 *  ������ ������ ������ ������	���� �������������. 
	 *  ���� � = 0 - ������������ ������ ������	{@link MyListIteratorl}, 
	 *  ���� � = 1 - {@link MyListIterator2},
	 *  � ���� ������ ������������ <code>null</code>.
	 *  @see MyListIterator1
	 *  @see MyListIterator2
	 *  @see Mylterator
	 *  @see com.lab111.Lab8var9.AggregatedStructure#getIterator(int) */
	@Override
	public MyIterator<String> getIterator(int �) {
		switch (�){ 
		case 0:	return new MyListIterator1(); 
		case 1:	return new MyListIterator2(); 
		default: return null;
		}
	}
	/**
	 * ����� ���������� �������� ���� {@link #myList}.
	 * @return ������ ������ {@link ArrayList}
	 * @see ArrayList */
	public ArrayList<String> getMyList() { 
		return myList;
	}
	public void setMyList(ArrayList<String> myList) { 
		this.myList = myList;
	}	
}
