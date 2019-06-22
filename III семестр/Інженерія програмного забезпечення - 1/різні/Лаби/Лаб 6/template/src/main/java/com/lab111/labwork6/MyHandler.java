package com.lab111.labwork6;
/**
 * handler class, the essence - ___handler___
 * @author Nightingale
 *
 */
public abstract class MyHandler {
	private MyHandler up;
	private MyHandler[] down;
	private String HelpData;
	/**
	 * setter parent (for parent constructor)
	 * @param up parent
	 */
	public void SetUp(Panel_Component up)
	{
	this.up=up;	
	}
	/**
	 * Children setter
	 * @param down children array
	 */
	public void SetDown(MyHandler[] down)
	{
	this.down=down;	
	}
	/**
	 * Method of defining a field containing help
	 * @param HelpData Help content
	 */
	public void SetHelp(String HelpData)
	{
		this.HelpData=HelpData;
	}
	/**
	 * access method to parent
	 * @return parent
	 */
	public MyHandler GetUp()
	{
	return this.up;	
	}
	/**
	 * access method to children
	 * @return children array
	 */
	public MyHandler[] GetDown()
	{
	return this.down;	
	}
	/**
	 * access method to help data
	 * @return help data
	 */
	public String GetHelp()
	{
		return this.HelpData;
	}
	/**
	 * method lift up (to parent) to find the nearest tips (blijaishaya podskazka)
	 */
	public void HandleUp()
	{
		boolean reqcomp=false;
		MyHandler t=this;
		 while((t.GetUp()!=null)&&(reqcomp!=true)) {
			t=t.GetUp();
		if((t.GetHelp()!=null)&&(reqcomp==false))
		{
			System.out.println("Lights:"+t.GetHelp());
			reqcomp=true;
		}
		 }
		 if (reqcomp==false) System.out.println("Request failed");
	}
	//public abstract void ShowHelp();
	/**
	 * method for focusing element and all its descendants (children) and ancestors (parent)
	 */
	public void TotalFocus()
	{
		MyHandler t=this;
		while (t.GetUp()!=null) t=t.GetUp();
		t.FocuseAll();
	}
	/**
	 * method for focusing element and all its descendants (children)
	 */
	public  void FocuseAll()
	{
		this.Focuse();
		this.HandleDown();
	}
	/**
	 * abstract method of focusing the element directly
	 */
	public abstract void Focuse();
	/**
	 * abstract method of focusing all the descendants
	 */
	public abstract void HandleDown();
}
