package com.lab111.Lab3var9;

/**
 * Класс ImageProxy работает с изображением до его загрузки
 * @author A
 * @version 3.9
 */
public class ImageProxy implements Graphic {
	private Image image = new Image(); 
	private int nParts;
	/**
	 * Метод Draw Вывод изображения
	 * @param name - имя изображения
	 */
	@Override
	public void Draw(String name) {
		System.out.println("3aгpyзкa изображения: "+name);
		image.Draw(name);
		System.out.println("Определяем на сколько частей делить картинку\n" + "Делим на 9 частей");
		nParts = 9;
		for(int і = 1; і<=nParts; і++){ 
					image.getPart(і);
		}
		System.out.println("-----------------------");
	}
	/**
	 * метод для определения цвета по координатам
	 * @param x - координата x
	 * @param y - координата y
	 */
	@Override
	public void getColor(int x, int y) {
		System.out.println("Определим цвет некоторой части изображения:");
		System.out.println("Узнaeм какая часть изображения нужна");
		System.out.println("Подгружаем только эту часть");
		System.out.println("Узнaeм цвет точки с координатами х="+x+" и у="+y);
		System.out.println("Все");
	}
}
