package com.lab111.labwork6;
/**
 * �������� - concretehandler, ����� ������
 * @author Nightingale
 *
 */
public class Button_Leaf extends MyHandler{
/**
 * �����������
 * @param up
 */
public Button_Leaf()
{
super.SetDown(null);
super.SetUp(null);
super.SetHelp(null);
}
/**
 * ����� ��� ����������� ��������������� ������
 */
public void Focuse()
{
	System.out.println("���������� ������"); 
}
public void HandleDown(){};
//public void FocuseAll(){}
}

//chain of responsobility)))