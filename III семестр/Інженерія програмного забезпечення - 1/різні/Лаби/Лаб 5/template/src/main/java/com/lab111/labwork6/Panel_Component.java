package com.lab111.labwork6;
/**
 * сущность - сcocreteHandler,  класс панели
 * @author Nightingale
 *
 */
public class Panel_Component extends MyHandler{
/**
 * конструктор в котором задаётся предок и массив потомков
 * @param up предок
 * @param down массив потомков
 */
	public Panel_Component(Panel_Component up, Panel_Component[] down)
	{
		super.SetUp(up);
	super.SetDown(down);
	}
	/**
	 * конструктор в котором задаётся предок
	 * @param up предок
	 */
	public Panel_Component(Panel_Component up)
	{
		super.SetUp(up);
		super.SetDown(null);
	}
	/**
	 * конструктор в котором задаются только потомки
	 * @param down массив потомков
	 */
	public Panel_Component(MyHandler[] down)
	{
		super.SetUp(null);
		super.SetDown(down);
		for(int i=0;i<down.length;i++)
		{
			down[i].SetUp(this);
		}
	}
	/**
	 * пустой конструктор
	 */
	public Panel_Component()
	{
		super.SetUp(null);
		this.SetDown(null);
	}

/**
 * метод фокусировки непосредственно на панели
 */
public void Focuse()
{
	System.out.println("Фокусируем панель"); 
}
/**
 * метод обхода структуры вниз для активации всех потомков
 */
public void HandleDown()
{
	Panel_Component t=this;
	if ((t.GetDown())!=null)
	{
		for (int i=0;i<t.GetDown().length;i++)
		{
			t.GetDown()[i].Focuse();
			( t.GetDown()[i]).HandleDown();
		}
	 } 
   }
}
