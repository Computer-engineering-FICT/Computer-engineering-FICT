package com.lab111.labwork6;
/**
 * тестирующий класс
 * @author Nightingale
 *
 */
public class Test6 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyHandler b[]=new MyHandler[3];
		/**
		 * создаём массив  компонентов
		 */
		b[0]=new Button_Leaf();
		b[0].SetHelp("кнопка первая");
		b[1]=new Button_Leaf();
		/**
		 * еще один массив
		 */
		MyHandler b1[]=new MyHandler[1];
		b1[0]=new Button_Leaf();
		b[2]=new Panel_Component(b1);
		b[2].SetHelp("панель1");
		/**
		 * создаём главную панель
		 */
		Panel_Component p=new Panel_Component(b);
		p.SetHelp(" справка главной панели");
		System.out.println("Наводим на главную панель ");
		p.Focuse();
		System.out.println("Фокусируются все принадлежащие ей компоненты ");
		p.HandleDown();
		System.out.println("Получаем справку наводя на 2ю кнопку(для неё справка не  задана) ");
		b[2].HandleUp();
		/**
		 * когда наводим на компонент - всё остальное также фокусируется
		 */
		System.out.println("При наводе на какой либо компонент всё фокусируется ");
		b[1].TotalFocus();
	}

}
