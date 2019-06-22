package com.lab111.Lab3var9;

/**
 * Класс Image работает непосредственно с изображениями, реализуя методы из класса Graphic
 * @author A
 * @version 3.9
 */
public class Image implements Graphic {
	private String fileName;
	/**
	 * @param i - Получение i-й части изображения
	 */
	public void getPart(int i){
		System.out.println("3aгрyжaeм "+i+" часть");
		}
	
	/**
	 * Вывод изображения
	 * @param name - имя изображения
	 * 
	 */
	@Override
	public void Draw(String name) {
		this.fileName=name;
		System.out.println("3aгpужaeм картинку "+fileName+" целиком");
	}
	/**
	 * метод для определения цвета по координатам
     * @param x - координата x
     * @param y - координата y
	 */
	@Override
	public void getColor(int x, int y) {
		System.out.println("3aгpyжаeм картинку "+fileName+" и проверяем цвет точки у всей картинки");
	}
}
