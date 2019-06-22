package com.lab111.labwork6;
/**
 * ����� �����������, �������� - handler
 * @author Nightingale
 *
 */
public abstract class MyHandler {
	private MyHandler up;
	private MyHandler[] down;
	private String HelpData;
	/**
	 * ����� ������� ������(��� ������������ ������)
	 * @param up ������
	 */
	public void SetUp(Panel_Component up)
	{
	this.up=up;	
	}
	/**
	 * ����� ������� ��������
	 * @param down ������ ��������
	 */
	public void SetDown(MyHandler[] down)
	{
	this.down=down;	
	}
	/**
	 * ����� ������� ����, ����������� �������
	 * @param HelpData ���������� �������
	 */
	public void SetHelp(String HelpData)
	{
		this.HelpData=HelpData;
	}
	/**
	 * ����� ������� � ������
	 * @return ������
	 */
	public MyHandler GetUp()
	{
	return this.up;	
	}
	/**
	 * ����� ������� � ��������
	 * @return ������ ��������
	 */
	public MyHandler[] GetDown()
	{
	return this.down;	
	}
	/**
	 * ����� ������� � �������
	 * @return ���������� �������
	 */
	public String GetHelp()
	{
		return this.HelpData;
	}
	/**
	 * ���� ������� �����(� ��������), ��� ������ ��������� ���������
	 */
	public void HandleUp()
	{
		boolean reqcomp=false;
		MyHandler t=this;
		 while((t.GetUp()!=null)&&(reqcomp!=true)) {
			t=t.GetUp();
		if((t.GetHelp()!=null)&&(reqcomp==false))
		{
			System.out.println("��������������:"+t.GetHelp());
			reqcomp=true;
		}
		 }
		 if (reqcomp==false) System.out.println("������ �� ��������");
	}
	//public abstract void ShowHelp();
	/**
	 * ����� ��� ����������� �������� � ���� ��� �������� � �������
	 */
	public void TotalFocus()
	{
		MyHandler t=this;
		while (t.GetUp()!=null) t=t.GetUp();
		t.FocuseAll();
	}
	/**
	 * ����� ��� ����������� �������� � ���� ��� ��������
	 */
	public  void FocuseAll()
	{
		this.Focuse();
		this.HandleDown();
	}
	/**
	 * ����������� ����� ����������� ��������������� ��������
	 */
	public abstract void Focuse();
	/**
	 * ����������� ����� ����������� ���� ��������
	 */
	public abstract void HandleDown();
}
