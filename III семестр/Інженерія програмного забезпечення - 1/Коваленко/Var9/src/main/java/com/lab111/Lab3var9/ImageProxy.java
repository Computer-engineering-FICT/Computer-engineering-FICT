package com.lab111.Lab3var9;

/**
 * ����� ImageProxy �������� � ������������ �� ��� ��������
 * @author A
 * @version 3.9
 */
public class ImageProxy implements Graphic {
	private Image image = new Image(); 
	private int nParts;
	/**
	 * ����� Draw ����� �����������
	 * @param name - ��� �����������
	 */
	@Override
	public void Draw(String name) {
		System.out.println("3a�py��a �����������: "+name);
		image.Draw(name);
		System.out.println("���������� �� ������� ������ ������ ��������\n" + "����� �� 9 ������");
		nParts = 9;
		for(int � = 1; �<=nParts; �++){ 
					image.getPart(�);
		}
		System.out.println("-----------------------");
	}
	/**
	 * ����� ��� ����������� ����� �� �����������
	 * @param x - ���������� x
	 * @param y - ���������� y
	 */
	@Override
	public void getColor(int x, int y) {
		System.out.println("��������� ���� ��������� ����� �����������:");
		System.out.println("���ae� ����� ����� ����������� �����");
		System.out.println("���������� ������ ��� �����");
		System.out.println("���ae� ���� ����� � ������������ �="+x+" � �="+y);
		System.out.println("���");
	}
}
