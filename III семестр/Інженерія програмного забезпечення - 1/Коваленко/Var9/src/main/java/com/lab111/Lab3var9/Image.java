package com.lab111.Lab3var9;

/**
 * ����� Image �������� ��������������� � �������������, �������� ������ �� ������ Graphic
 * @author A
 * @version 3.9
 */
public class Image implements Graphic {
	private String fileName;
	/**
	 * @param i - ��������� i-� ����� �����������
	 */
	public void getPart(int i){
		System.out.println("3a��y�ae� "+i+" �����");
		}
	
	/**
	 * ����� �����������
	 * @param name - ��� �����������
	 * 
	 */
	@Override
	public void Draw(String name) {
		this.fileName=name;
		System.out.println("3a�p��ae� �������� "+fileName+" �������");
	}
	/**
	 * ����� ��� ����������� ����� �� �����������
     * @param x - ���������� x
     * @param y - ���������� y
	 */
	@Override
	public void getColor(int x, int y) {
		System.out.println("3a�py��e� �������� "+fileName+" � ��������� ���� ����� � ���� ��������");
	}
}
