package com.lab111.Lab3var9a;

/**
 * Реальный объект - Класс реализует методы работы с изображением
 * @author A
 * @version 3.9.1
 */
public class Picture implements IF{
	/**
	 * w - Ширина изображения */
	private int w;
	/**
	 * h - Высота изображения */
	private int h;
	/**
	 * canvas - Матрица цветов */
	private int canvas[][];
	/**
	 * пустой конструктор
	 */
	public Picture() {
		this.h = 1;
		this.w = 1;		
		canvas = new int[h][w];
	}
	/**
	 * Конструктор c параметрами
	 * w, w2 ширина
	 * h, h2 высота
	 */
	public Picture(int h2, int w2) {
		this.h = h2;
		this.w = w2;		
		canvas = new int[h][w];
	}
	/**
	 * getColor - определяет значение цвета в точке с координатами х,у
	 * x параметр h
	 * y параметр w
	 * canvas возвращает цвет в точке х,у
	 * @see com.lab111.Lab3var9a.IF#getColor(int, int)
	 */
	@Override
	public int getColor(int х, int у) {
		if (х <= 0 || у	<=	0) return -1;
		if	(х > h || у > w) return -1;
		return canvas[х][у];
	}
/**
 * меняет цвет на color в точке х,у
 * x параметр h
 * y параметр w
 * color новый цвет в точке х,у
 * возвращает булевское значение: TRUE, если удалось поменять цвет, FALSE в противном случае
 * @see com.lab111.Lab3var9a.IF#setColor(int, int, int)
 */
	public boolean setColor(int x, int y, int color) {
		if (x <= 0 || y <= 0) return false;
		if (x > h || y > w) return false;
		canvas[x][y] = color; 
		return true;
	}
}
