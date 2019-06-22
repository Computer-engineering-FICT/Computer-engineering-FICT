package com.lab111.Lab8var9;

/**
 * interface AggregatedStructure - ��������� � ��������� �������� Factory Method 
 * ��������� ���� ����������,
 * ������� ��������� ��������� ������, 
 * ������������ ������ ���� {@link Mylterator}. * 
 * @author user
 * @version 8.9
 * @param <T> - ���, ������� ����� � ������ �������������� ���������.
 */
public interface AggregatedStructure<T> {
	/**
	 * ����� ������ ����������� ������ ���� {@link MyIterator}, 
	 * ������� ��������� �������� � ��������� ���� {@link �}.
	 * @return ������ ���� {@link MyIterator}.	*/
	public <�> MyIterator<T> getIterator();
	/**
	 * ����� ������ ����������� ������ ���� {@link MyIterator}, 
	 * ������� ��������� �������� � ��������� ���� {@link j�}. 
	 * ������ - ��������, ������� ����� ��������� � ���������� ���������� ������,
	 * ������� �� �������� ���������.
	 * @param � - ������������� ��������, �������� ������� �������� �������-���������.
	 * @return ������ ���� {@link MyIterator}.
	*/
	public MyIterator<T> getIterator(int �);
}
