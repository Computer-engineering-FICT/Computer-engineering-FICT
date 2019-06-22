package com.lab111.Lab3var9a;

/**
 * Lab.N3 var.9a
 * @author A
 * @version 3.9.1
 */
public final class Test {

	/**
	 * Запуск программ на выполнение
	 */
	public static void main(String[] args) {
		PictureProxy w = new PictureProxy(20, 20);
		for(int і = 0; і < 20; і++)
			for(int j = 0; j < 20; j++)
				// 7 цветов радуги - деление по модулю 7
				w.setColor(і,j, (і+j) % 7);
		for(int і = 0; і < 20; і++)
			for(int j = 0; j < 20; j++)
				w.getColor(і,j);
		}
}