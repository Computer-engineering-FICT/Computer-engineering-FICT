package com.lab111.labwork6;
/**
 * сущность - concretehandler, класс кнопки
 * @author Nightingale
 *
 */
public class Button_Leaf extends MyHandler{
/**
 * конструктор
 * @param up
 */
public Button_Leaf()
{
super.SetDown(null);
super.SetUp(null);
super.SetHelp(null);
}
/**
 * метод для фокусировки непосредственно кнопки
 */
public void Focuse()
{
	System.out.println("Фокусируем кнопку"); 
}
public void HandleDown(){};
//public void FocuseAll(){}
}

//chain of responsobility)))