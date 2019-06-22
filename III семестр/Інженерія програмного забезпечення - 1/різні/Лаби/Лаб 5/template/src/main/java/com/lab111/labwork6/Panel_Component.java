package com.lab111.labwork6;
/**
 * �������� - �cocreteHandler,  ����� ������
 * @author Nightingale
 *
 */
public class Panel_Component extends MyHandler{
/**
 * ����������� � ������� ������� ������ � ������ ��������
 * @param up ������
 * @param down ������ ��������
 */
	public Panel_Component(Panel_Component up, Panel_Component[] down)
	{
		super.SetUp(up);
	super.SetDown(down);
	}
	/**
	 * ����������� � ������� ������� ������
	 * @param up ������
	 */
	public Panel_Component(Panel_Component up)
	{
		super.SetUp(up);
		super.SetDown(null);
	}
	/**
	 * ����������� � ������� �������� ������ �������
	 * @param down ������ ��������
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
	 * ������ �����������
	 */
	public Panel_Component()
	{
		super.SetUp(null);
		this.SetDown(null);
	}

/**
 * ����� ����������� ��������������� �� ������
 */
public void Focuse()
{
	System.out.println("���������� ������"); 
}
/**
 * ����� ������ ��������� ���� ��� ��������� ���� ��������
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
