package com.lab111.labwork6;
/**
 * класс обработчика, сущность - handler
 * @author Nightingale
 *
 */
public abstract class MyHandler {
	private MyHandler up;
	private MyHandler[] down;
	private String HelpData;
	/**
	 * метод задания предка(для конструктора предка)
	 * @param up предок
	 */
	public void SetUp(Panel_Component up)
	{
	this.up=up;	
	}
	/**
	 * Метод задания потомков
	 * @param down массив потомков
	 */
	public void SetDown(MyHandler[] down)
	{
	this.down=down;	
	}
	/**
	 * Метод задания поля, содержащего справку
	 * @param HelpData содержимое справки
	 */
	public void SetHelp(String HelpData)
	{
		this.HelpData=HelpData;
	}
	/**
	 * метод доступа к предку
	 * @return предок
	 */
	public MyHandler GetUp()
	{
	return this.up;	
	}
	/**
	 * Метод доступа к потомкам
	 * @return массив потомков
	 */
	public MyHandler[] GetDown()
	{
	return this.down;	
	}
	/**
	 * метод доступа к справке
	 * @return содержимое справки
	 */
	public String GetHelp()
	{
		return this.HelpData;
	}
	/**
	 * метд подъёма вверх(к родителю), для поиска ближайшей подсказки
	 */
	public void HandleUp()
	{
		boolean reqcomp=false;
		MyHandler t=this;
		 while((t.GetUp()!=null)&&(reqcomp!=true)) {
			t=t.GetUp();
		if((t.GetHelp()!=null)&&(reqcomp==false))
		{
			System.out.println("Подсвечивается:"+t.GetHelp());
			reqcomp=true;
		}
		 }
		 if (reqcomp==false) System.out.println("запрос не выполнен");
	}
	//public abstract void ShowHelp();
	/**
	 * метод для фокусировки элемента и всех его потомков и предков
	 */
	public void TotalFocus()
	{
		MyHandler t=this;
		while (t.GetUp()!=null) t=t.GetUp();
		t.FocuseAll();
	}
	/**
	 * метод для фокусировки элемента и всех его потомков
	 */
	public  void FocuseAll()
	{
		this.Focuse();
		this.HandleDown();
	}
	/**
	 * абстрактный метод фокусировки непосредственно элемента
	 */
	public abstract void Focuse();
	/**
	 * абстрактный метод фокусировки всех потомков
	 */
	public abstract void HandleDown();
}
