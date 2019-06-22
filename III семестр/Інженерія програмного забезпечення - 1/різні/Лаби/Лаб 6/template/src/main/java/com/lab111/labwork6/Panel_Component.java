package com.lab111.labwork6;
/**
 * essence - __cocreteHandler___, class Panel
 * @author Nightingale
 *
 */
public class Panel_Component extends MyHandler{
/**
 * constructor that sets an ancestor  and an array of the descendants 
 * @param up ancestor (parent)
 * @param down array of the descendants
 */
	public Panel_Component(Panel_Component up, Panel_Component[] down)
	{
		super.SetUp(up);
	super.SetDown(down);
	}
	/**
	 * constructor that sets an ancestor
	 * @param up ancestor (parent)
	 */
	public Panel_Component(Panel_Component up)
	{
		super.SetUp(up);
		super.SetDown(null);
	}
	/**
	 * constructor that sets only descendants (children)
	 * @param down array of the descendants
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
	 * empty constructor
	 */
	public Panel_Component()
	{
		super.SetUp(null);
		this.SetDown(null);
	}

/**
 * method of focusing directly on the panel
 */
public void Focuse()
{
	System.out.println("Focusing panel"); 
}
/**
 * method of passing the structure down for activation of all the descendants
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
