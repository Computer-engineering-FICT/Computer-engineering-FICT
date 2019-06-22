package com.lab111.labwork6;
/**
 * essence - __concretehandler__, class Button
 * @author Nightingale
 *
 */
public class Button_Leaf extends MyHandler{
/**
 * constructor
 * @param up
 */
public Button_Leaf()
{
super.SetDown(null);
super.SetUp(null);
super.SetHelp(null);
}
/**
 * method for focusing directly Button
 */
public void Focuse()
{
	System.out.println("Focusing button"); 
}
public void HandleDown(){};
//public void FocuseAll(){}
}