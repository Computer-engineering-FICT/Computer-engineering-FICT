package com.lab111.Lab3var9a;

/**
 * PictureProxy - класс Proxy для обработки изображения с задержкой
 * @author A
 * @version 3.9.1
 */
public class PictureProxy implements IF {
	/**
	* pic - Агрегат, Обьект класса Picture  */
	private Picture pic;
	/**
	*	Минимальное значение x, к которому есть доступ */
	private static final int X1 = 1;
	/**
	 * Максмальное значение x, к которому есть доступ */
	private static final int X2 = 100; 
	/**
	 * Минимальное значение у, к которому есть доступ */
	private static final int Y1 = 1;
	/**
	 * Максмальное значение у, к которому есть доступ */
	private static final int Y2 = 100;
	/**
	 * пустой Конструктор */
	public PictureProxy(){
		pic = new Picture();
	}
	/**
	 * Конструктор, которому передаются высота и ширина
	 * {@link Picture}; создается обьект класса
	 * @param h - высота изображения
	 * @param w - ширина изображения
	*/
	public PictureProxy(int h, int w){
		pic = new Picture(h, w);
	}
	/**
	 * 
	 * @param х координата x
	 * @param у координата y
	 * @return true, если есть доступ, и false в противном случае
	 */
    private boolean haveAccess(int х, int у) {
    	return !(х < X1 || х > X2 || у < Y1 || у > Y2);
    }	
    /**
     * Меняет цвет в точке x,y на color, если к этой точке есть доступ
     * @return булевское значение: TRUE, если цвет поменялся, и FALSE в противном случае
     * @see com.lab111.Lab3var9a.IF#setColor(int, int, int)
     */
    public boolean setColor(int х, int у, int color) {
		if (haveAccess(х,у)) 
			return pic.setColor(х,у,color);
		else
			return false;
	}

    /**
    * getColor - выводит на экран цвет точки
    * @return возвращает цвет, если к точке есть доступ, иначе -1
    * @see com.lab111.Lab3var9a.IF#getColor(int, int)
    */
	public int getColor(int х, int у) {
		if (haveAccess(х,у))
			System.out.println("Колір точки з координатами ("+х+", "+у+") є "+pic.getColor(х,у)); 
		else
			System.out.println("Немає доступу до точки з координатами ("+х+", "+у+")");
		return (haveAccess(х,у) ? pic.getColor(х,у) : -1);
		
	}
}
