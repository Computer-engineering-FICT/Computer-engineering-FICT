package com.lab111.Lab3var9a;

/**
 * Lab.N3 var.9a
 * @author A
 * @version 3.9.1
 */
public final class Test {

	/**
	 * ������ �������� �� ����������
	 */
	public static void main(String[] args) {
		PictureProxy w = new PictureProxy(20, 20);
		for(int � = 0; � < 20; �++)
			for(int j = 0; j < 20; j++)
				// 7 ������ ������ - ������� �� ������ 7
				w.setColor(�,j, (�+j) % 7);
		for(int � = 0; � < 20; �++)
			for(int j = 0; j < 20; j++)
				w.getColor(�,j);
		}
}